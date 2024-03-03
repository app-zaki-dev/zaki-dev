-- 記事データテーブル
CREATE TABLE `t_articles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` varchar(36) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0が非公開、1が公開',
  `display_order` int unsigned NOT NULL DEFAULT '0' COMMENT '記事の表示順',
  `is_fixed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '記事を固定するか？',
  `created_at` bigint DEFAULT '0',
  `updated_at` bigint DEFAULT NULL,
  `deleted_at` bigint DEFAULT NULL,
  `created_by` varchar(10) NOT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `deleted_by` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- カテゴリマスタテーブル
CREATE TABLE `m_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` bigint DEFAULT '0',
  `updated_at` bigint DEFAULT NULL,
  `deleted_at` bigint DEFAULT NULL,
  `created_by` varchar(10) NOT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `deleted_by` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- 中間テーブル
CREATE TABLE `i_articles_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `t_articles_id` int unsigned DEFAULT NULL,
  `m_categories_id` int unsigned NOT NULL,
  `created_at` bigint DEFAULT '0',
  `updated_at` bigint DEFAULT NULL,
  `deleted_at` bigint DEFAULT NULL,
  `created_by` varchar(10) NOT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `deleted_by` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_article_id` (`t_articles_id`),
  KEY `m_categories_id` (`m_categories_id`),
  CONSTRAINT `i_articles_categories_ibfk_1` FOREIGN KEY (`t_articles_id`) REFERENCES `t_articles` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `i_articles_categories_ibfk_2` FOREIGN KEY (`m_categories_id`) REFERENCES `m_categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci