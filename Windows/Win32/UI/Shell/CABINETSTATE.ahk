#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * CABINETSTATE may be altered or unavailable.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-cabinetstate
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CABINETSTATE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>WORD</b>
     * 
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * @type {Integer}
     */
    nVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * This bitfield backs the following members:
     * - fFullPathTitle
     * - fSaveLocalView
     * - fNotShell
     * - fSimpleDefault
     * - fDontShowDescBar
     * - fNewWindowMode
     * - fShowCompColor
     * - fDontPrettyNames
     * - fAdminsCreateCommonGroups
     * - fUnusedFlags
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>BOOL</b>
     * @type {Integer}
     */
    fFullPathTitle {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * Type: <b>BOOL</b>
     * @type {Integer}
     */
    fSaveLocalView {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Not used.
     * @type {Integer}
     */
    fNotShell {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Not used.
     * @type {Integer}
     */
    fSimpleDefault {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Not used.
     * @type {Integer}
     */
    fDontShowDescBar {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * Type: <b>BOOL</b>
     * @type {Integer}
     */
    fNewWindowMode {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * Type: <b>BOOL</b>
     * @type {Integer}
     */
    fShowCompColor {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Not used.
     * @type {Integer}
     */
    fDontPrettyNames {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Used when an administrator installs an application that places an icon in the <b>Start</b> menu.
     * @type {Integer}
     */
    fAdminsCreateCommonGroups {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Not used.
     * @type {Integer}
     */
    fUnusedFlags {
        get => (this._bitfield >> 9) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 9) | (this._bitfield & ~(0x7F << 9))
    }

    /**
     * Type: <b>UINT</b>
     * 
     * One or both of the following flags.
     * @type {Integer}
     */
    fMenuEnumFilter {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
