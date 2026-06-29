#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct VPB {
    #StructPack 8

    Type : Int16

    Size : Int16

    Flags : UInt16

    VolumeLabelLength : UInt16

    __DeviceObject_ptr : IntPtr
    DeviceObject {
        get => (addr := this.__DeviceObject_ptr) ? DEVICE_OBJECT.At(addr) : unset
        set => this.__DeviceObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __RealDevice_ptr : IntPtr
    RealDevice {
        get => (addr := this.__RealDevice_ptr) ? DEVICE_OBJECT.At(addr) : unset
        set => this.__RealDevice_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    SerialNumber : UInt32

    ReferenceCount : UInt32

    VolumeLabel : WCHAR[32]

}
