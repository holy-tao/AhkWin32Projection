#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import ".\DRIVER_EXTENSION.ahk" { DRIVER_EXTENSION }
#Import ".\FAST_IO_DISPATCH.ahk" { FAST_IO_DISPATCH }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_OBJECT {
    #StructPack 8

    Type : Int16

    Size : Int16

    __DeviceObject_ptr : IntPtr
    DeviceObject {
        get => (addr := this.__DeviceObject_ptr) ? DEVICE_OBJECT.At(addr) : unset
        set => this.__DeviceObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    Flags : UInt32

    DriverStart : IntPtr

    DriverSize : UInt32

    DriverSection : IntPtr

    __DriverExtension_ptr : IntPtr
    DriverExtension {
        get => (addr := this.__DriverExtension_ptr) ? DRIVER_EXTENSION.At(addr) : unset
        set => this.__DriverExtension_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    DriverName : IntPtr

    HardwareDatabase : UNICODE_STRING.Ptr

    FastIoDispatch : FAST_IO_DISPATCH.Ptr

    DriverInit : IntPtr

    DriverStartIo : IntPtr

    DriverUnload : IntPtr

    MajorFunction : IntPtr[28]

}
