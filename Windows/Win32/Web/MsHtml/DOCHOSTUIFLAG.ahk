#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class DOCHOSTUIFLAG extends Win32Enum {

    /**
     * Native name: DOCHOSTUIFLAG_DIALOG
     * @type {Integer (Int32)}
     */
    static DIALOG => 1

    /**
     * Native name: DOCHOSTUIFLAG_DISABLE_HELP_MENU
     * @type {Integer (Int32)}
     */
    static DISABLE_HELP_MENU => 2

    /**
     * Native name: DOCHOSTUIFLAG_NO3DBORDER
     * @type {Integer (Int32)}
     */
    static NO3DBORDER => 4

    /**
     * Native name: DOCHOSTUIFLAG_SCROLL_NO
     * @type {Integer (Int32)}
     */
    static SCROLL_NO => 8

    /**
     * Native name: DOCHOSTUIFLAG_DISABLE_SCRIPT_INACTIVE
     * @type {Integer (Int32)}
     */
    static DISABLE_SCRIPT_INACTIVE => 16

    /**
     * Native name: DOCHOSTUIFLAG_OPENNEWWIN
     * @type {Integer (Int32)}
     */
    static OPENNEWWIN => 32

    /**
     * Native name: DOCHOSTUIFLAG_DISABLE_OFFSCREEN
     * @type {Integer (Int32)}
     */
    static DISABLE_OFFSCREEN => 64

    /**
     * Native name: DOCHOSTUIFLAG_FLAT_SCROLLBAR
     * @type {Integer (Int32)}
     */
    static FLAT_SCROLLBAR => 128

    /**
     * Native name: DOCHOSTUIFLAG_DIV_BLOCKDEFAULT
     * @type {Integer (Int32)}
     */
    static DIV_BLOCKDEFAULT => 256

    /**
     * Native name: DOCHOSTUIFLAG_ACTIVATE_CLIENTHIT_ONLY
     * @type {Integer (Int32)}
     */
    static ACTIVATE_CLIENTHIT_ONLY => 512

    /**
     * Native name: DOCHOSTUIFLAG_OVERRIDEBEHAVIORFACTORY
     * @type {Integer (Int32)}
     */
    static OVERRIDEBEHAVIORFACTORY => 1024

    /**
     * Native name: DOCHOSTUIFLAG_CODEPAGELINKEDFONTS
     * @type {Integer (Int32)}
     */
    static CODEPAGELINKEDFONTS => 2048

    /**
     * Native name: DOCHOSTUIFLAG_URL_ENCODING_DISABLE_UTF8
     * @type {Integer (Int32)}
     */
    static URL_ENCODING_DISABLE_UTF8 => 4096

    /**
     * Native name: DOCHOSTUIFLAG_URL_ENCODING_ENABLE_UTF8
     * @type {Integer (Int32)}
     */
    static URL_ENCODING_ENABLE_UTF8 => 8192

    /**
     * Native name: DOCHOSTUIFLAG_ENABLE_FORMS_AUTOCOMPLETE
     * @type {Integer (Int32)}
     */
    static ENABLE_FORMS_AUTOCOMPLETE => 16384

    /**
     * Native name: DOCHOSTUIFLAG_ENABLE_INPLACE_NAVIGATION
     * @type {Integer (Int32)}
     */
    static ENABLE_INPLACE_NAVIGATION => 65536

    /**
     * Native name: DOCHOSTUIFLAG_IME_ENABLE_RECONVERSION
     * @type {Integer (Int32)}
     */
    static IME_ENABLE_RECONVERSION => 131072

    /**
     * Native name: DOCHOSTUIFLAG_THEME
     * @type {Integer (Int32)}
     */
    static THEME => 262144

    /**
     * Native name: DOCHOSTUIFLAG_NOTHEME
     * @type {Integer (Int32)}
     */
    static NOTHEME => 524288

    /**
     * Native name: DOCHOSTUIFLAG_NOPICS
     * @type {Integer (Int32)}
     */
    static NOPICS => 1048576

    /**
     * Native name: DOCHOSTUIFLAG_NO3DOUTERBORDER
     * @type {Integer (Int32)}
     */
    static NO3DOUTERBORDER => 2097152

    /**
     * Native name: DOCHOSTUIFLAG_DISABLE_EDIT_NS_FIXUP
     * @type {Integer (Int32)}
     */
    static DISABLE_EDIT_NS_FIXUP => 4194304

    /**
     * Native name: DOCHOSTUIFLAG_LOCAL_MACHINE_ACCESS_CHECK
     * @type {Integer (Int32)}
     */
    static LOCAL_MACHINE_ACCESS_CHECK => 8388608

    /**
     * Native name: DOCHOSTUIFLAG_DISABLE_UNTRUSTEDPROTOCOL
     * @type {Integer (Int32)}
     */
    static DISABLE_UNTRUSTEDPROTOCOL => 16777216

    /**
     * Native name: DOCHOSTUIFLAG_HOST_NAVIGATES
     * @type {Integer (Int32)}
     */
    static HOST_NAVIGATES => 33554432

    /**
     * Native name: DOCHOSTUIFLAG_ENABLE_REDIRECT_NOTIFICATION
     * @type {Integer (Int32)}
     */
    static ENABLE_REDIRECT_NOTIFICATION => 67108864

    /**
     * Native name: DOCHOSTUIFLAG_USE_WINDOWLESS_SELECTCONTROL
     * @type {Integer (Int32)}
     */
    static USE_WINDOWLESS_SELECTCONTROL => 134217728

    /**
     * Native name: DOCHOSTUIFLAG_USE_WINDOWED_SELECTCONTROL
     * @type {Integer (Int32)}
     */
    static USE_WINDOWED_SELECTCONTROL => 268435456

    /**
     * Native name: DOCHOSTUIFLAG_ENABLE_ACTIVEX_INACTIVATE_MODE
     * @type {Integer (Int32)}
     */
    static ENABLE_ACTIVEX_INACTIVATE_MODE => 536870912

    /**
     * Native name: DOCHOSTUIFLAG_DPI_AWARE
     * @type {Integer (Int32)}
     */
    static DPI_AWARE => 1073741824
}
