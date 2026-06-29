#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_DEVICE_OBJECT_POWER_EXTENSION.ahk" { _DEVICE_OBJECT_POWER_EXTENSION }
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\VPB.ahk" { VPB }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DEVOBJ_EXTENSION {
    #StructPack 8

    Type : Int16

    Size : UInt16

    __DeviceObject_ptr : IntPtr
    DeviceObject {
        get => (addr := this.__DeviceObject_ptr) ? DEVICE_OBJECT.At(addr) : unset
        set => this.__DeviceObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    PowerFlags : UInt32

    Dope : _DEVICE_OBJECT_POWER_EXTENSION.Ptr

    ExtensionFlags : UInt32

    DeviceNode : IntPtr

    __AttachedTo_ptr : IntPtr
    AttachedTo {
        get => (addr := this.__AttachedTo_ptr) ? DEVICE_OBJECT.At(addr) : unset
        set => this.__AttachedTo_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    StartIoCount : Int32

    StartIoKey : Int32

    StartIoFlags : UInt32

    __Vpb_ptr : IntPtr
    Vpb {
        get => (addr := this.__Vpb_ptr) ? VPB.At(addr) : unset
        set => this.__Vpb_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    DependencyNode : IntPtr

    InterruptContext : IntPtr

    InterruptCount : Int32

    VerifierContext : IntPtr

}
