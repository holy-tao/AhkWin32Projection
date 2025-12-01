#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to specify URL schemes.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class URL_SCHEME extends Win32Enum{

    /**
     * An invalid scheme.
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_INVALID => -1

    /**
     * An unknown scheme.
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_UNKNOWN => 0

    /**
     * FTP (ftp:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_FTP => 1

    /**
     * HTTP (http:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_HTTP => 2

    /**
     * Gopher (gopher:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_GOPHER => 3

    /**
     * Mail-to (mailto:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_MAILTO => 4

    /**
     * Usenet news (news:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_NEWS => 5

    /**
     * Usenet news with NNTP (nntp:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_NNTP => 6

    /**
     * Telnet (telnet:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_TELNET => 7

    /**
     * Wide Area Information Server (wais:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_WAIS => 8

    /**
     * File (file:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_FILE => 9

    /**
     * URL moniker (mk:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_MK => 10

    /**
     * URL HTTPS (https:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_HTTPS => 11

    /**
     * Shell (shell:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_SHELL => 12

    /**
     * NNTP news postings with SSL (snews:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_SNEWS => 13

    /**
     * Local (local:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_LOCAL => 14

    /**
     * JavaScript (javascript:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_JAVASCRIPT => 15

    /**
     * VBScript (vbscript:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_VBSCRIPT => 16

    /**
     * About (about:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_ABOUT => 17

    /**
     * Res (res:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_RES => 18

    /**
     * Internet Explorer 6 and later only. Shell-rooted (ms-shell-rooted:)
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_MSSHELLROOTED => 19

    /**
     * Internet Explorer 6 and later only. Shell ID-list (ms-shell-idlist:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_MSSHELLIDLIST => 20

    /**
     * Internet Explorer 6 and later only. MSHelp (hcp:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_MSHELP => 21

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_MSSHELLDEVICE => 22

    /**
     * Internet Explorer 7 and later only. Wildcard (*:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_WILDCARD => 23

    /**
     * Windows Vista and later only. Search-MS (search-ms:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_SEARCH_MS => 24

    /**
     * Windows Vista with SP1 and later only. Search (search:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_SEARCH => 25

    /**
     * <b>Windows 7 and later</b>. Known folder (knownfolder:).
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_KNOWNFOLDER => 26

    /**
     * The highest legitimate value in the enumeration, used for validation purposes.
     * @type {Integer (Int32)}
     */
    static URL_SCHEME_MAXVALUE => 27
}
