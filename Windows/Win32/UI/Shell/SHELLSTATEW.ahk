#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains settings for the Shell's state. This structure is used with the SHGetSetSettings function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The shlobj_core.h header defines SHELLSTATE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shellstatew
 * @namespace Windows.Win32.UI.Shell
 * @charset Unicode
 */
export default struct SHELLSTATEW {
    #StructPack 4

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
     */
    _bitfield1 : Int32


    /**
     * @type {Integer}
     */
    fShowAllObjects {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fShowExtensions {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    fNoConfirmRecycle {
        get => (this._bitfield1 >> 2) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 2) | (this._bitfield1 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    fShowSysFiles {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    fShowCompColor {
        get => (this._bitfield1 >> 4) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 4) | (this._bitfield1 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    fDoubleClickInWebView {
        get => (this._bitfield1 >> 5) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 5) | (this._bitfield1 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    fDesktopHTML {
        get => (this._bitfield1 >> 6) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 6) | (this._bitfield1 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    fWin95Classic {
        get => (this._bitfield1 >> 7) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 7) | (this._bitfield1 & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    fDontPrettyPath {
        get => (this._bitfield1 >> 8) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 8) | (this._bitfield1 & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    fShowAttribCol {
        get => (this._bitfield1 >> 9) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 9) | (this._bitfield1 & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    fMapNetDrvBtn {
        get => (this._bitfield1 >> 10) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 10) | (this._bitfield1 & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    fShowInfoTip {
        get => (this._bitfield1 >> 11) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 11) | (this._bitfield1 & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    fHideIcons {
        get => (this._bitfield1 >> 12) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 12) | (this._bitfield1 & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    fWebView {
        get => (this._bitfield1 >> 13) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 13) | (this._bitfield1 & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    fFilter {
        get => (this._bitfield1 >> 14) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 14) | (this._bitfield1 & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    fShowSuperHidden {
        get => (this._bitfield1 >> 15) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 15) | (this._bitfield1 & ~(0x1 << 15))
    }

    /**
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
     */
    dwWin95Unused : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * Not used.
     */
    uWin95Unused : UInt32

    /**
     * Type: <b>LONG</b>
     * 
     * The column to sort by.
     */
    lParamSort : Int32

    /**
     * Type: <b>int</b>
     * 
     * Alphabetical sort direction for the column specified by <b>lParamSort</b>. Use 1 for an ascending sort, -1 for a descending sort.
     */
    iSortDirection : Int32

    /**
     * Type: <b>UINT</b>
     * 
     * Not used.
     */
    version : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * Not used.
     */
    uNotUsed : UInt32

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
     */
    _bitfield2 : Int32


    /**
     * @type {Integer}
     */
    fSepProcess {
        get => (this._bitfield2 >> 0) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 0) | (this._bitfield2 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fStartPanelOn {
        get => (this._bitfield2 >> 1) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 1) | (this._bitfield2 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    fShowStartPage {
        get => (this._bitfield2 >> 2) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 2) | (this._bitfield2 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    fAutoCheckSelect {
        get => (this._bitfield2 >> 3) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 3) | (this._bitfield2 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    fIconsOnly {
        get => (this._bitfield2 >> 4) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 4) | (this._bitfield2 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    fShowTypeOverlay {
        get => (this._bitfield2 >> 5) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 5) | (this._bitfield2 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    fShowStatusBar {
        get => (this._bitfield2 >> 6) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 6) | (this._bitfield2 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    fSpareFlags {
        get => (this._bitfield2 >> 7) & 0x1FF
        set => this._bitfield2 := ((value & 0x1FF) << 7) | (this._bitfield2 & ~(0x1FF << 7))
    }
}
