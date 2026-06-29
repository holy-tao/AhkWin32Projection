#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_REPORT_HW_ERROR_DEVICE_DRIVER_FLAGS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Reserved
     */
    _bitfield : Int32

    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
