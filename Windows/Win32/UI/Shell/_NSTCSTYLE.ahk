#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _NSTCSTYLE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_HASEXPANDOS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_HASLINES => 2

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_SINGLECLICKEXPAND => 4

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_FULLROWSELECT => 8

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_SPRINGEXPAND => 16

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_HORIZONTALSCROLL => 32

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_ROOTHASEXPANDO => 64

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_SHOWSELECTIONALWAYS => 128

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_NOINFOTIP => 512

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_EVENHEIGHT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_NOREPLACEOPEN => 2048

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_DISABLEDRAGDROP => 4096

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_NOORDERSTREAM => 8192

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_RICHTOOLTIP => 16384

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_BORDER => 32768

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_NOEDITLABELS => 65536

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_TABSTOP => 131072

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_FAVORITESMODE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_AUTOHSCROLL => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_FADEINOUTEXPANDOS => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_EMPTYTEXT => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_CHECKBOXES => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_PARTIALCHECKBOXES => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_EXCLUSIONCHECKBOXES => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_DIMMEDCHECKBOXES => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_NOINDENTCHECKS => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_ALLOWJUNCTIONS => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_SHOWTABSBUTTON => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_SHOWDELETEBUTTON => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static NSTCS_SHOWREFRESHBUTTON => -2147483648
}
