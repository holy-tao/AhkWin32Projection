#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the version of the TBS context implementation. You must use this structure if your application works with both versions of TPM.
 * @see https://docs.microsoft.com/windows/win32/api//tbs/ns-tbs-tbs_context_params2
 * @namespace Windows.Win32.System.TpmBaseServices
 * @version v4.0.30319
 */
class TBS_CONTEXT_PARAMS2 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The version of the TBS context implementation. This must be set to 	TPM_VERSION_20.
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - requestRaw
     * - includeTpm12
     * - includeTpm20
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    requestRaw {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    includeTpm12 {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    includeTpm20 {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    asUINT32 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
