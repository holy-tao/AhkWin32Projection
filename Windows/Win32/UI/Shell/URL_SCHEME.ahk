#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to specify URL schemes.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme
 * @namespace Windows.Win32.UI.Shell
 */
class URL_SCHEME extends Win32Enum {

    /**
     * An invalid scheme.
     * Native name: URL_SCHEME_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => -1

    /**
     * An unknown scheme.
     * Native name: URL_SCHEME_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * FTP (ftp:).
     * Native name: URL_SCHEME_FTP
     * @type {Integer (Int32)}
     */
    static FTP => 1

    /**
     * HTTP (http:).
     * Native name: URL_SCHEME_HTTP
     * @type {Integer (Int32)}
     */
    static HTTP => 2

    /**
     * Gopher (gopher:).
     * Native name: URL_SCHEME_GOPHER
     * @type {Integer (Int32)}
     */
    static GOPHER => 3

    /**
     * Mail-to (mailto:).
     * Native name: URL_SCHEME_MAILTO
     * @type {Integer (Int32)}
     */
    static MAILTO => 4

    /**
     * Usenet news (news:).
     * Native name: URL_SCHEME_NEWS
     * @type {Integer (Int32)}
     */
    static NEWS => 5

    /**
     * Usenet news with NNTP (nntp:).
     * Native name: URL_SCHEME_NNTP
     * @type {Integer (Int32)}
     */
    static NNTP => 6

    /**
     * Telnet (telnet:).
     * Native name: URL_SCHEME_TELNET
     * @type {Integer (Int32)}
     */
    static TELNET => 7

    /**
     * Wide Area Information Server (wais:).
     * Native name: URL_SCHEME_WAIS
     * @type {Integer (Int32)}
     */
    static WAIS => 8

    /**
     * File (file:).
     * Native name: URL_SCHEME_FILE
     * @type {Integer (Int32)}
     */
    static FILE => 9

    /**
     * URL moniker (mk:).
     * Native name: URL_SCHEME_MK
     * @type {Integer (Int32)}
     */
    static MK => 10

    /**
     * URL HTTPS (https:).
     * Native name: URL_SCHEME_HTTPS
     * @type {Integer (Int32)}
     */
    static HTTPS => 11

    /**
     * Shell (shell:).
     * Native name: URL_SCHEME_SHELL
     * @type {Integer (Int32)}
     */
    static SHELL => 12

    /**
     * NNTP news postings with SSL (snews:).
     * Native name: URL_SCHEME_SNEWS
     * @type {Integer (Int32)}
     */
    static SNEWS => 13

    /**
     * Local (local:).
     * Native name: URL_SCHEME_LOCAL
     * @type {Integer (Int32)}
     */
    static LOCAL => 14

    /**
     * JavaScript (javascript:).
     * Native name: URL_SCHEME_JAVASCRIPT
     * @type {Integer (Int32)}
     */
    static JAVASCRIPT => 15

    /**
     * VBScript (vbscript:).
     * Native name: URL_SCHEME_VBSCRIPT
     * @type {Integer (Int32)}
     */
    static VBSCRIPT => 16

    /**
     * About (about:).
     * Native name: URL_SCHEME_ABOUT
     * @type {Integer (Int32)}
     */
    static ABOUT => 17

    /**
     * Res (res:).
     * Native name: URL_SCHEME_RES
     * @type {Integer (Int32)}
     */
    static RES => 18

    /**
     * Internet Explorer 6 and later only. Shell-rooted (ms-shell-rooted:)
     * Native name: URL_SCHEME_MSSHELLROOTED
     * @type {Integer (Int32)}
     */
    static MSSHELLROOTED => 19

    /**
     * Internet Explorer 6 and later only. Shell ID-list (ms-shell-idlist:).
     * Native name: URL_SCHEME_MSSHELLIDLIST
     * @type {Integer (Int32)}
     */
    static MSSHELLIDLIST => 20

    /**
     * Internet Explorer 6 and later only. MSHelp (hcp:).
     * Native name: URL_SCHEME_MSHELP
     * @type {Integer (Int32)}
     */
    static MSHELP => 21

    /**
     * Not supported.
     * Native name: URL_SCHEME_MSSHELLDEVICE
     * @type {Integer (Int32)}
     */
    static MSSHELLDEVICE => 22

    /**
     * Internet Explorer 7 and later only. Wildcard (*:).
     * Native name: URL_SCHEME_WILDCARD
     * @type {Integer (Int32)}
     */
    static WILDCARD => 23

    /**
     * Windows Vista and later only. Search-MS (search-ms:).
     * Native name: URL_SCHEME_SEARCH_MS
     * @type {Integer (Int32)}
     */
    static SEARCH_MS => 24

    /**
     * Windows Vista with SP1 and later only. Search (search:).
     * Native name: URL_SCHEME_SEARCH
     * @type {Integer (Int32)}
     */
    static SEARCH => 25

    /**
     * <b>Windows 7 and later</b>. Known folder (knownfolder:).
     * Native name: URL_SCHEME_KNOWNFOLDER
     * @type {Integer (Int32)}
     */
    static KNOWNFOLDER => 26

    /**
     * The highest legitimate value in the enumeration, used for validation purposes.
     * Native name: URL_SCHEME_MAXVALUE
     * @type {Integer (Int32)}
     */
    static MAXVALUE => 27
}
