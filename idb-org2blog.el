;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WordPress blogging with org-mode:
;; org2blog, xml-rpc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'xml-rpc)

(require 'org2blog-autoloads)

(setq org2blog/wp-blog-alist
      '(("lay-geek"
	 :url "http://laygeek.wordpress.com/xmlrpc.php"
	 :username "ibrunton")))