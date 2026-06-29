#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_HEAP_OBJECT {
    #StructPack 8

    size : UInt32

    objectId : IntPtr

    typeNameId : UInt32

    flags : UInt32

    unused : UInt16

    optionalInfoCount : UInt16

    static __New() {
        DefineProp(this.Prototype, 'externalObjectAddress', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
