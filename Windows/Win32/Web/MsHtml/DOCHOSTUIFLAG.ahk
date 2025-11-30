#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class DOCHOSTUIFLAG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_DIALOG => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_DISABLE_HELP_MENU => 2

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_NO3DBORDER => 4

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_SCROLL_NO => 8

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_DISABLE_SCRIPT_INACTIVE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_OPENNEWWIN => 32

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_DISABLE_OFFSCREEN => 64

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_FLAT_SCROLLBAR => 128

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_DIV_BLOCKDEFAULT => 256

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_ACTIVATE_CLIENTHIT_ONLY => 512

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_OVERRIDEBEHAVIORFACTORY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_CODEPAGELINKEDFONTS => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_URL_ENCODING_DISABLE_UTF8 => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_URL_ENCODING_ENABLE_UTF8 => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_ENABLE_FORMS_AUTOCOMPLETE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_ENABLE_INPLACE_NAVIGATION => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_IME_ENABLE_RECONVERSION => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_THEME => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_NOTHEME => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_NOPICS => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_NO3DOUTERBORDER => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_DISABLE_EDIT_NS_FIXUP => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_LOCAL_MACHINE_ACCESS_CHECK => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_DISABLE_UNTRUSTEDPROTOCOL => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_HOST_NAVIGATES => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_ENABLE_REDIRECT_NOTIFICATION => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_USE_WINDOWLESS_SELECTCONTROL => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_USE_WINDOWED_SELECTCONTROL => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_ENABLE_ACTIVEX_INACTIVATE_MODE => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIFLAG_DPI_AWARE => 1073741824
}
