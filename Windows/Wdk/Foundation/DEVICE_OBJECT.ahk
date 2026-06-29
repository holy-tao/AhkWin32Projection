#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VPB.ahk" { VPB }
#Import ".\DEVOBJ_EXTENSION.ahk" { DEVOBJ_EXTENSION }
#Import ".\PIO_TIMER.ahk" { PIO_TIMER }
#Import ".\IRP.ahk" { IRP }
#Import "..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import ".\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DEVICE_OBJECT {
    #StructPack 8


    struct _Queue {
        ListEntry : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'Wcb', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : Int16

    Size : UInt16

    ReferenceCount : Int32

    __DriverObject_ptr : IntPtr
    DriverObject {
        get => (addr := this.__DriverObject_ptr) ? DRIVER_OBJECT.At(addr) : unset
        set => this.__DriverObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    NextDevice : DEVICE_OBJECT.Ptr

    AttachedDevice : DEVICE_OBJECT.Ptr

    __CurrentIrp_ptr : IntPtr
    CurrentIrp {
        get => (addr := this.__CurrentIrp_ptr) ? IRP.At(addr) : unset
        set => this.__CurrentIrp_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    Timer : PIO_TIMER

    Flags : UInt32

    Characteristics : UInt32

    __Vpb_ptr : IntPtr
    Vpb {
        get => (addr := this.__Vpb_ptr) ? VPB.At(addr) : unset
        set => this.__Vpb_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    DeviceExtension : IntPtr

    DeviceType : UInt32

    StackSize : Int8

    Queue : DEVICE_OBJECT._Queue

    AlignmentRequirement : UInt32

    DeviceQueue : IntPtr

    Dpc : IntPtr

    ActiveThreadCount : UInt32

    SecurityDescriptor : PSECURITY_DESCRIPTOR

    DeviceLock : IntPtr

    SectorSize : UInt16

    Spare1 : UInt16

    __DeviceObjectExtension_ptr : IntPtr
    DeviceObjectExtension {
        get => (addr := this.__DeviceObjectExtension_ptr) ? DEVOBJ_EXTENSION.At(addr) : unset
        set => this.__DeviceObjectExtension_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    Reserved : IntPtr

}
