#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a set of flags that indicate the current Shell settings. This structure is used with the SHGetSettings function.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-shellflagstate
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHELLFLAGSTATE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - fShowAllObjects
     * - fShowExtensions
     * - fNoConfirmRecycle
     * - fShowSysFiles
     * - fShowCompColor
     * - fDoubleClickInWebView
     * - fDesktopHTML
     * - fWin95Classic
     * - fDontPrettyPath
     * - fShowAttribCol
     * - fMapNetDrvBtn
     * - fShowInfoTip
     * - fHideIcons
     * - fAutoCheckSelect
     * - fIconsOnly
     * - fRestFlags
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Show All Files</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fShowAllObjects {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Hide extensions for known file types</b> option is disabled, or zero otherwise.
     * @type {Integer}
     */
    fShowExtensions {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Display Delete Confirmation Dialog</b> box in the Recycle Bin is enabled, or zero otherwise.
     * @type {Integer}
     */
    fNoConfirmRecycle {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Don't show hidden files, folders, or drives</b> option is selected, or zero otherwise.
     * @type {Integer}
     */
    fShowSysFiles {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Display encrypted or compressed NTFS files in color</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fShowCompColor {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Double-Click to Open an Item</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fDoubleClickInWebView {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Active Desktop – View as Web Page</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fDesktopHTML {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Classic Style</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fWin95Classic {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Allow All Uppercase Names</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fDontPrettyPath {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Show File Attributes in Detail View</b> option is enabled, or zero otherwise. 
     *                     
     * 
     * <b>Windows Vista and later</b>. Not used.
     * @type {Integer}
     */
    fShowAttribCol {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Show Map Network Drive Button in Toolbar</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fMapNetDrvBtn {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Show Info Tips for Items in Folders &amp; Desktop</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fShowInfoTip {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Nonzero if the <b>Show Desktop Icons</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fHideIcons {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>Windows Vista and later</b>: Nonzero if the <b>Use checkboxes to select  items</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fAutoCheckSelect {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>Windows Vista and later</b>: Nonzero if the <b>Always show icons, never thumbnails</b> option is enabled, or zero otherwise.
     * @type {Integer}
     */
    fIconsOnly {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * Type: <b>UINT</b>
     * 
     * For Windows Vista this bitfield is 1, otherwise member this is not used.
     * @type {Integer}
     */
    fRestFlags {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
}
