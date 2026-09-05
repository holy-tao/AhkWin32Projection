#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SSF_MASK extends Win32BitflagEnum {

    /**
     * Native name: SSF_SHOWALLOBJECTS
     * @type {Integer (UInt32)}
     */
    static SHOWALLOBJECTS => 1

    /**
     * Native name: SSF_SHOWEXTENSIONS
     * @type {Integer (UInt32)}
     */
    static SHOWEXTENSIONS => 2

    /**
     * Native name: SSF_HIDDENFILEEXTS
     * @type {Integer (UInt32)}
     */
    static HIDDENFILEEXTS => 4

    /**
     * Native name: SSF_SERVERADMINUI
     * @type {Integer (UInt32)}
     */
    static SERVERADMINUI => 4

    /**
     * Native name: SSF_SHOWCOMPCOLOR
     * @type {Integer (UInt32)}
     */
    static SHOWCOMPCOLOR => 8

    /**
     * Native name: SSF_SORTCOLUMNS
     * @type {Integer (UInt32)}
     */
    static SORTCOLUMNS => 16

    /**
     * Native name: SSF_SHOWSYSFILES
     * @type {Integer (UInt32)}
     */
    static SHOWSYSFILES => 32

    /**
     * Native name: SSF_DOUBLECLICKINWEBVIEW
     * @type {Integer (UInt32)}
     */
    static DOUBLECLICKINWEBVIEW => 128

    /**
     * Native name: SSF_SHOWATTRIBCOL
     * @type {Integer (UInt32)}
     */
    static SHOWATTRIBCOL => 256

    /**
     * Native name: SSF_DESKTOPHTML
     * @type {Integer (UInt32)}
     */
    static DESKTOPHTML => 512

    /**
     * Native name: SSF_WIN95CLASSIC
     * @type {Integer (UInt32)}
     */
    static WIN95CLASSIC => 1024

    /**
     * Native name: SSF_DONTPRETTYPATH
     * @type {Integer (UInt32)}
     */
    static DONTPRETTYPATH => 2048

    /**
     * Native name: SSF_SHOWINFOTIP
     * @type {Integer (UInt32)}
     */
    static SHOWINFOTIP => 8192

    /**
     * Native name: SSF_MAPNETDRVBUTTON
     * @type {Integer (UInt32)}
     */
    static MAPNETDRVBUTTON => 4096

    /**
     * Native name: SSF_NOCONFIRMRECYCLE
     * @type {Integer (UInt32)}
     */
    static NOCONFIRMRECYCLE => 32768

    /**
     * Native name: SSF_HIDEICONS
     * @type {Integer (UInt32)}
     */
    static HIDEICONS => 16384

    /**
     * Native name: SSF_FILTER
     * @type {Integer (UInt32)}
     */
    static FILTER => 65536

    /**
     * Native name: SSF_WEBVIEW
     * @type {Integer (UInt32)}
     */
    static WEBVIEW => 131072

    /**
     * Native name: SSF_SHOWSUPERHIDDEN
     * @type {Integer (UInt32)}
     */
    static SHOWSUPERHIDDEN => 262144

    /**
     * Native name: SSF_SEPPROCESS
     * @type {Integer (UInt32)}
     */
    static SEPPROCESS => 524288

    /**
     * Native name: SSF_NONETCRAWLING
     * @type {Integer (UInt32)}
     */
    static NONETCRAWLING => 1048576

    /**
     * Native name: SSF_STARTPANELON
     * @type {Integer (UInt32)}
     */
    static STARTPANELON => 2097152

    /**
     * Native name: SSF_SHOWSTARTPAGE
     * @type {Integer (UInt32)}
     */
    static SHOWSTARTPAGE => 4194304

    /**
     * Native name: SSF_AUTOCHECKSELECT
     * @type {Integer (UInt32)}
     */
    static AUTOCHECKSELECT => 8388608

    /**
     * Native name: SSF_ICONSONLY
     * @type {Integer (UInt32)}
     */
    static ICONSONLY => 16777216

    /**
     * Native name: SSF_SHOWTYPEOVERLAY
     * @type {Integer (UInt32)}
     */
    static SHOWTYPEOVERLAY => 33554432

    /**
     * Native name: SSF_SHOWSTATUSBAR
     * @type {Integer (UInt32)}
     */
    static SHOWSTATUSBAR => 67108864
}
