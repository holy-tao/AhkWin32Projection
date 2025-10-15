#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains process mitigation policy settings for the loading of non-system fonts.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-process_mitigation_font_disable_policy
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_MITIGATION_FONT_DISABLE_POLICY extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - DisableNonSystemFonts
     * - AuditNonSystemFontLoading
     * - ReservedFlags
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DisableNonSystemFonts {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    AuditNonSystemFontLoading {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ReservedFlags {
        get => (this._bitfield >> 2) & 0x3FFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFF) << 2) | (this._bitfield & ~(0x3FFFFFFF << 2))
    }
}
