#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the version of the TBS context implementation. You must use this structure if your application works with both versions of TPM.
 * @see https://learn.microsoft.com/windows/win32/api/tbs/ns-tbs-tbs_context_params2
 * @namespace Windows.Win32.System.TpmBaseServices
 */
export default struct TBS_CONTEXT_PARAMS2 {
    #StructPack 4

    /**
     * The version of the TBS context implementation. This must be set to 	TPM_VERSION_20.
     */
    version : UInt32

    /**
     * This bitfield backs the following members:
     * - requestRaw
     * - includeTpm12
     * - includeTpm20
     */
    _bitfield : Int32


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
    static __New() {
        DefineProp(this.Prototype, 'asUINT32', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
