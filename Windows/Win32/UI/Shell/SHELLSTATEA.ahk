#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains settings for the Shell's state. This structure is used with the SHGetSetSettings function.
 * @remarks
 * 
  * > [!NOTE]
  * > The shlobj_core.h header defines SHELLSTATE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-shellstatea
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class SHELLSTATEA extends Win32Struct
{
    static sizeof => 32

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
     * - fWebView
     * - fFilter
     * - fShowSuperHidden
     * - fNoNetCrawling
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to show all objects, including hidden files and folders. <b>FALSE</b> to hide hidden files and folders.
     * @type {Integer}
     */
    fShowAllObjects {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to show file name extensions, <b>FALSE</b> to hide them.
     * @type {Integer}
     */
    fShowExtensions {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to show no confirmation dialog box when deleting items to the Recycle Bin, <b>FALSE</b> to display the confirmation dialog box.
     * @type {Integer}
     */
    fNoConfirmRecycle {
        get => (this._bitfield1 >> 2) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 2) | (this._bitfield1 & ~(0x1 << 2))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to show system files, <b>FALSE</b> to hide them.
     * @type {Integer}
     */
    fShowSysFiles {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to show encrypted or compressed NTFS files in color.
     * @type {Integer}
     */
    fShowCompColor {
        get => (this._bitfield1 >> 4) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 4) | (this._bitfield1 & ~(0x1 << 4))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to require a double-click to open an item when in web view.
     * @type {Integer}
     */
    fDoubleClickInWebView {
        get => (this._bitfield1 >> 5) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 5) | (this._bitfield1 & ~(0x1 << 5))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to use Active Desktop, <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    fDesktopHTML {
        get => (this._bitfield1 >> 6) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 6) | (this._bitfield1 & ~(0x1 << 6))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enforce Windows 95 Shell behavior and restrictions.
     * @type {Integer}
     */
    fWin95Classic {
        get => (this._bitfield1 >> 7) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 7) | (this._bitfield1 & ~(0x1 << 7))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to prevent the conversion of the path to all lowercase characters.
     * @type {Integer}
     */
    fDontPrettyPath {
        get => (this._bitfield1 >> 8) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 8) | (this._bitfield1 & ~(0x1 << 8))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Not used.
     * @type {Integer}
     */
    fShowAttribCol {
        get => (this._bitfield1 >> 9) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 9) | (this._bitfield1 & ~(0x1 << 9))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to display a <b>Map Network Drive</b> button.
     * @type {Integer}
     */
    fMapNetDrvBtn {
        get => (this._bitfield1 >> 10) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 10) | (this._bitfield1 & ~(0x1 << 10))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to show a pop-up description for folders and files.
     * @type {Integer}
     */
    fShowInfoTip {
        get => (this._bitfield1 >> 11) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 11) | (this._bitfield1 & ~(0x1 << 11))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to hide desktop icons, <b>FALSE</b> to show them.
     * @type {Integer}
     */
    fHideIcons {
        get => (this._bitfield1 >> 12) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 12) | (this._bitfield1 & ~(0x1 << 12))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to display as a web view.
     * @type {Integer}
     */
    fWebView {
        get => (this._bitfield1 >> 13) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 13) | (this._bitfield1 & ~(0x1 << 13))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Not used.
     * @type {Integer}
     */
    fFilter {
        get => (this._bitfield1 >> 14) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 14) | (this._bitfield1 & ~(0x1 << 14))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to show operating system files.
     * @type {Integer}
     */
    fShowSuperHidden {
        get => (this._bitfield1 >> 15) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 15) | (this._bitfield1 & ~(0x1 << 15))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to disable automatic searching for network folders and printers.
     * @type {Integer}
     */
    fNoNetCrawling {
        get => (this._bitfield1 >> 16) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 16) | (this._bitfield1 & ~(0x1 << 16))
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Not used.
     * @type {Integer}
     */
    dwWin95Unused {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Not used.
     * @type {Integer}
     */
    uWin95Unused {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * The column to sort by.
     * @type {Integer}
     */
    lParamSort {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>int</b>
     * 
     * Alphabetical sort direction for the column specified by <b>lParamSort</b>. Use 1 for an ascending sort, -1 for a descending sort.
     * @type {Integer}
     */
    iSortDirection {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Not used.
     * @type {Integer}
     */
    version {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Not used.
     * @type {Integer}
     */
    uNotUsed {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * This bitfield backs the following members:
     * - fSepProcess
     * - fStartPanelOn
     * - fShowStartPage
     * - fAutoCheckSelect
     * - fIconsOnly
     * - fShowTypeOverlay
     * - fShowStatusBar
     * - fSpareFlags
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to launch folder windows in separate processes, <b>FALSE</b> to launch in the same process.
     * @type {Integer}
     */
    fSepProcess {
        get => (this._bitfield2 >> 0) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 0) | (this._bitfield2 & ~(0x1 << 0))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>Windows XP only</b>. <b>TRUE</b> to use the Windows XP-style Start menu, <b>FALSE</b> to use the classic Start menu.
     * @type {Integer}
     */
    fStartPanelOn {
        get => (this._bitfield2 >> 1) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 1) | (this._bitfield2 & ~(0x1 << 1))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Not used.
     * @type {Integer}
     */
    fShowStartPage {
        get => (this._bitfield2 >> 2) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 2) | (this._bitfield2 & ~(0x1 << 2))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>Introduced in Windows Vista</b>. <b>TRUE</b> to use the Windows Vista-style checkbox folder views, <b>FALSE</b> to use the classic views.
     * @type {Integer}
     */
    fAutoCheckSelect {
        get => (this._bitfield2 >> 3) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 3) | (this._bitfield2 & ~(0x1 << 3))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>Introduced in Windows Vista</b>. <b>TRUE</b> to show generic icons only, <b>FALSE</b> to show thumbnail-style icons in folders.
     * @type {Integer}
     */
    fIconsOnly {
        get => (this._bitfield2 >> 4) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 4) | (this._bitfield2 & ~(0x1 << 4))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>Introduced in Windows Vista</b>. <b>TRUE</b> indicates a thumbnail should show the application that would be invoked when opening the item, <b>FALSE</b> indicates that no application will be shown.
     * @type {Integer}
     */
    fShowTypeOverlay {
        get => (this._bitfield2 >> 5) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 5) | (this._bitfield2 & ~(0x1 << 5))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>Introduced in Windows 8</b>. <b>TRUE</b> to show the status bar; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fShowStatusBar {
        get => (this._bitfield2 >> 6) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 6) | (this._bitfield2 & ~(0x1 << 6))
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Not used.
     * @type {Integer}
     */
    fSpareFlags {
        get => (this._bitfield2 >> 7) & 0x1FF
        set => this._bitfield2 := ((value & 0x1FF) << 7) | (this._bitfield2 & ~(0x1FF << 7))
    }
}
