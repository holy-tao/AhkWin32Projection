#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a pen flick.
 * @remarks
 * Windows Vista sends the <b>FLICK_DATA</b> structure to an application along with the <a href="https://docs.microsoft.com/windows/desktop/tablet/wm-tablet-flick-message">WM_TABLET_FLICK Message</a> when a pen flick occurs.
 * 
 * The value of <i>iActionArgument</i> depends on the value of <i>iFlickActionCommandCode</i>. For example, if <i>iFlickCommandCode</i> is FLICKACTION_COMMANDCODE_SCROLL, the value of <i>iActionArgument</i> is one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/tabflicks/ne-tabflicks-scrolldirection">SCROLLDIRECTION Enumeration</a>.
 * 
 * If <i>iFlickCommandCode</i> is <b>FLICKACTION_COMMANDCODE_CUSTOMKEY</b>, the value of <i>iActionArgument</i> indicates the key stroke. The <i>fControlModifier</i>, <i>fMenuModifier</i>, <i>fAltGRModifier</i>, <i>fWinModifier</i>, and <i>fShiftModifier</i> fields indicate whether the pen action activates a modifier key. For example, if the user assigns a pen flick to the key stroke, CTRL+N, <i>fControlModifier</i> is <b>true</b> and <i>iActionArgument</i> is the virtual code key, VK_N.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ns-tabflicks-flick_data
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct FLICK_DATA {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - iFlickActionCommandCode
     * - iFlickDirection
     * - fControlModifier
     * - fMenuModifier
     * - fAltGRModifier
     * - fWinModifier
     * - fShiftModifier
     * - iReserved
     * - fOnInkingSurface
     * - iActionArgument
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    iFlickActionCommandCode {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    iFlickDirection {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Integer}
     */
    fControlModifier {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    fMenuModifier {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    fAltGRModifier {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    fWinModifier {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    fShiftModifier {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    iReserved {
        get => (this._bitfield >> 13) & 0x3
        set => this._bitfield := ((value & 0x3) << 13) | (this._bitfield & ~(0x3 << 13))
    }

    /**
     * @type {Integer}
     */
    fOnInkingSurface {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    iActionArgument {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
}
