#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCW_CALLBACK_INFORMATION {
    #StructPack 8

    AddCounter : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'RemoveCounter', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'EnumerateInstances', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'CollectData', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
