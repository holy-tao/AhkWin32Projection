#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct OB_POST_OPERATION_PARAMETERS {
    #StructPack 8

    CreateHandleInformation : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'DuplicateHandleInformation', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
