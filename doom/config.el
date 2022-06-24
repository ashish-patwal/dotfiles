;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ashish Patwal"
      user-mail-address "ashishpatwal147@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-city-lights)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-font (font-spec :family "JetBrainsMono" :size 14 ))

(require 'elfeed)

(setq elfeed-feeds
      '(
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCPZkYpT5XIUou8sV8zk-3jQ" youtube anime) ;;retrocrush
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCOwLECHVxmbbWTr9tXmxDxA" youtube kawaii) ;;anime-drawing channel
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCnTB8uNxND40iwvPiyzpnWw" youtube music) ;;heiakim
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCld68syR8Wi-GY_n4CaoJGA" youtube linux) ;;brodie robertson
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCWr0mx597DnSGLFk1WfvSkQ" youtube program) ;;kalle halden
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCsBjURrPoezykLs9EqgamOA" youtube program) ;;fireship
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC4JX40jDee_tINbkjycV4Sg" youtube program) ;;tech with tim
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC9x0AN7BWHpCDHSm9NiJFJQ" youtube linux) ;;NetworkChuck
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCgTNupxATBfWmfehv21ym-g" youtube linux) ;;NetworkChuck
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCo2EevPr79_Ux66GACESAkQ" youtube draw) ;;ibis paint
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCGbshtvS9t-8CW11W7TooQg" youtube anime) ;;muse asia - authentic anime
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCrUL8K81R4VBzm-KOYwrcxQ" youtube program) ;;engineer man
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCp0iCvHGMwyfPHpYq7n2sPw" youtube funny) ;;atarashi gakkou
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC2IYWWifoIht9T47z1Z5lJw" youtube movies) ;;dead meat
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UClvgyQvIplPQU8N73vPlFUA" youtube football) ;;Ash-studio-7
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCBJeMCIeLQos7wacox4hmLQ" youtube football) ;;Seria-A
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC6mIxFTvXkWQVEHPsEdflzQ" youtube mech) ;;great-scott
        ("https://feeds.soundcloud.com/users/soundcloud:users:187841578/sounds.rss" podcast) ;; learn-japanese
        ("https://www.aaapodcast.com/aaapodcast_episode1.xml" podcast) ;;AAA-anime-podcast
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCcmxOGYGF51T1XsqQLewGtQ" youtube) ;;trash-taste anime-podcast 3-anime-musketeers
        ("https://trash-taste-podcast.castos.com/feed" podcast) ;;trash-taste-podcast
        ("https://feeds.sbs.com.au/anime-show-joey-akidearest" podcast) ;;anime-podcast
        ("http://otakuspirit.com/feed/" podcast) ;;otaku-anime-podcast
        ("https://www.reddit.com/r/unixporn.rss" reddit linux)
        ("https://www.reddit.com/r/listentothis.rss" reddit music)
        ("https://www.reddit.com/r/anime.rss" reddit anime)
        ("https://www.reddit.com/r/archlinux.rss" reddit linux)
        ("https://www.reddit.com/r/AnimeART.rss" reddit draw)
        ("https://www.reddit.com/r/animeillustrations.rss" reddit draw)
        ("https://www.reddit.com/r/illustration.rss" reddit draw)
        ("https://www.reddit.com/r/animenews.rss" reddit anime)
        ("https://www.animenewsnetwork.com/all/rss.xml?ann-edition=us" anime)
        ("https://honeysanime.com/feed/" anime)
        ("https://justlightnovels.com/feed/" novel)
        ("https://yenpress.com/feed/" novel)
        ("https://nyaa.si/?page=rss" nyaa)
        ("https://www.reddit.com/r/Music.rss" music)
        ("https://www.reddit.com/r/LetsTalkMusic.rss" music)
        ))

(defun yt-dl-it (url)
  "Downloads the URL in an async shell"
  (let ((default-directory "~/Videos"))
    (async-shell-command (format "youtube-dl -x %s" url))))

(defun elfeed-youtube-dl (&optional use-generic-p)
  "Youtube-DL link"
  (interactive "P")
  (let ((entries (elfeed-search-selected)))
    (cl-loop for entry in entries
             do (elfeed-untag entry 'unread)
             when (elfeed-entry-link entry)
             do (yt-dl-it it))
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))

(define-key elfeed-search-mode-map (kbd "d") 'elfeed-youtube-dl)

(defun elfeed-eww-open (&optional use-generic-p)
  "open with eww"
  (interactive "P")
  (let ((entries (elfeed-search-selected)))
    (cl-loop for entry in entries
             do (elfeed-untag entry 'unread)
             when (elfeed-entry-link entry)
             do (eww-browse-url it))
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))

(defun elfeed-firefox-open (&optional use-generic-p)
  "open with firefox"
  (interactive "P")
  (let ((entries (elfeed-search-selected)))
    (cl-loop for entry in entries
             do (elfeed-untag entry 'unread)
             when (elfeed-entry-link entry)
             do (browse-url-firefox it))
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))

(defun elfeed-w3m-open (&optional use-generic-p)
  "open with w3m"
  (interactive "P")
  (let ((entries (elfeed-search-selected)))
    (cl-loop for entry in entries
             do (elfeed-untag entry 'unread)
             when (elfeed-entry-link entry)
             do (ffap-w3m-other-window it))
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))

(define-key elfeed-search-mode-map (kbd "t") 'elfeed-w3m-open)
(define-key elfeed-search-mode-map (kbd "w") 'elfeed-eww-open)
(define-key elfeed-search-mode-map (kbd "f") 'elfeed-firefox-open)

;; spray-mode global
(global-set-key (kbd "<f6>") 'spray-mode)

(defun yt-mpv (url)
  "Downloads the URL in an async shell"
  (let ((default-directory "~/Downloads"))
    (async-shell-command (format "mpv -shuffle --ytdl-format='bestvideo[height<=720]+bestaudio/best[height<=720]' --ytdl-raw-options=sub-lang=en,write-auto-sub=,yes-playlist= --force-window=immediate \"%s\"" url))))
;;    (async-shell-command (format "mpv -shuffle --ytdl-raw-options=sub-lang=en,write-auto-sub=,yes-playlist= --force-window=immediate \"%s\" &" url))))

(defun empv (&optional use-generic-p)
  "Youtube-DL link"
  (interactive "P")
  (let ((entries (elfeed-search-selected)))
    (cl-loop for entry in entries
             do (elfeed-untag entry 'unread)
             when (elfeed-entry-link entry)
             do (yt-mpv it))
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))

(define-key elfeed-search-mode-map (kbd "m") 'empv)


(defun yt-mpv-no-video (url)
  "Downloads the URL in an async shell"
  (let ((default-directory "~/Downloads"))
    (async-shell-command (format "mpv -shuffle --cover-art-file=/home/lucifer/Downloads/images/ash6.jpeg --force-window=immediate --ytdl-raw-options=extract-audio=,audio-format=mp3,write-thumbnail=,embed-thumbnail= \"%s\" &" url))))

(defun empva (&optional use-generic-p)
  "Youtube-DL link"
  (interactive "P")
  (let ((entries (elfeed-search-selected)))
    (cl-loop for entry in entries
             do (elfeed-untag entry 'unread)
             when (elfeed-entry-link entry)
             do (yt-mpv-no-video it))
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))

(define-key elfeed-search-mode-map (kbd "a") 'empva)

(defun elfeed-show-play-enclosure (enclosure-index)
  (interactive (list (elfeed--enclosure-maybe-prompt-index elfeed-show-entry)))
  (let ((url (car
              (elt
               (elfeed-entry-enclosures elfeed-show-entry)
               (- enclosure-index 1)))))
    (async-shell-command (format "mpv --cover-art-file=/home/lucifer/Downloads/images/bean2.jpeg --force-window=immediate %s" url) "*mpv*")))


(setq exec-path (append exec-path '("/usr/bin")))
(require 'emms-setup)
(require 'emms-player-mpv)
(emms-all)
(emms-default-players)

(setq emms-source-file-default-directory "~/Music/")
(setq emms-playlist-buffer-name "*Music*")

;; emms-pause glob
(global-set-key (kbd "<f9>") 'emms-pause)
(global-set-key (kbd "<f10>") 'emms-next)
(global-set-key (kbd "<f8>") 'emms-previous)

(use-package doom-themes
  :config
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
