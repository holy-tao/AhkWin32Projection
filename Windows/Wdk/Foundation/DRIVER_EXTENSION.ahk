#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_EXTENSION {
    #StructPack 8

    __DriverObject_ptr : IntPtr
    DriverObject {
        get => (addr := this.__DriverObject_ptr) ? DRIVER_OBJECT.At(addr) : unset
        set => this.__DriverObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    AddDevice : IntPtr

    Count : UInt32

    ServiceKeyName : IntPtr

}
