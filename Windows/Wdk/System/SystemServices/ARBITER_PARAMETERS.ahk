#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ARBITER_PARAMETERS {
    #StructPack 8


    struct _Parameters {
        TestAllocation : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'RetestAllocation', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'BootAllocation', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'QueryAllocatedResources', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'QueryConflict', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'QueryArbitrate', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'AddReserved', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Parameters : ARBITER_PARAMETERS._Parameters

}
