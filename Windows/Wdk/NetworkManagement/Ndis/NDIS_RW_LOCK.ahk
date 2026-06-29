#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_RW_LOCK {
    #StructPack 8

    SpinLock : IntPtr

    Context : IntPtr

    RefCount : IntPtr[32]

    static __New() {
        DefineProp(this.Prototype, 'Reserved', { type: Int8[16], offset: 0 })
        DefineProp(this.Prototype, 'RefCountEx', { type: UInt32[128], offset: 16 })
        DefineProp(this.Prototype, 'RefCountLock', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'SharedRefCount', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'WriterWaiting', { type: BOOLEAN, offset: 28 })
        this.DeleteProp("__New")
    }
}
