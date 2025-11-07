#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a pen flick.
 * @remarks
 * 
 * Windows Vista sends the <b>FLICK_DATA</b> structure to an application along with the <a href="https://docs.microsoft.com/windows/desktop/tablet/wm-tablet-flick-message">WM_TABLET_FLICK Message</a> when a pen flick occurs.
 * 
 * The value of <i>iActionArgument</i> depends on the value of <i>iFlickActionCommandCode</i>. For example, if <i>iFlickCommandCode</i> is FLICKACTION_COMMANDCODE_SCROLL, the value of <i>iActionArgument</i> is one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/tabflicks/ne-tabflicks-scrolldirection">SCROLLDIRECTION Enumeration</a>.
 * 
 * If <i>iFlickCommandCode</i> is <b>FLICKACTION_COMMANDCODE_CUSTOMKEY</b>, the value of <i>iActionArgument</i> indicates the key stroke. The <i>fControlModifier</i>, <i>fMenuModifier</i>, <i>fAltGRModifier</i>, <i>fWinModifier</i>, and <i>fShiftModifier</i> fields indicate whether the pen action activates a modifier key. For example, if the user assigns a pen flick to the key stroke, CTRL+N, <i>fControlModifier</i> is <b>true</b> and <i>iActionArgument</i> is the virtual code key, VK_N.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tabflicks/ns-tabflicks-flick_data
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class FLICK_DATA extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

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
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The flick action assigned to the pen flick.
     * @type {Integer}
     */
    iFlickActionCommandCode {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * The direction of the pen flick.
     * @type {Integer}
     */
    iFlickDirection {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * <b>TRUE</b> if the pen flick action activates the CTRL key; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fControlModifier {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * <b>TRUE</b> if the pen flick action activates the ALT key; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fMenuModifier {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * <b>TRUE</b> if the pen flick action activates the ALT GR key; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fAltGRModifier {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * <b>TRUE</b> if the pen flick action activates the Windows Logo key; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fWinModifier {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * <b>TRUE</b> if the pen flick action activates the SHIFT key; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fShiftModifier {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * Do not use.
     * @type {Integer}
     */
    iReserved {
        get => (this._bitfield >> 13) & 0x3
        set => this._bitfield := ((value & 0x3) << 13) | (this._bitfield & ~(0x3 << 13))
    }

    /**
     * <b>TRUE</b> if the pen flick is sent to an inking surface; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fOnInkingSurface {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * Contains additional information about <b>iFlickActionCommandCode</b>.
     * @type {Integer}
     */
    iActionArgument {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
}
