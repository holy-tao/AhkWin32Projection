#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\PKINTERRUPT.ahk" { PKINTERRUPT }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\KINTERRUPT_MODE.ahk" { KINTERRUPT_MODE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_CONNECT_INTERRUPT_FULLY_SPECIFIED_PARAMETERS {
    #StructPack 8

    PhysicalDeviceObject : DEVICE_OBJECT.Ptr

    InterruptObject : PKINTERRUPT.Ptr

    ServiceRoutine : IntPtr

    ServiceContext : IntPtr

    SpinLock : IntPtr

    SynchronizeIrql : Int8

    FloatingSave : BOOLEAN

    ShareVector : BOOLEAN

    Vector : UInt32

    Irql : Int8

    InterruptMode : KINTERRUPT_MODE

    ProcessorEnableMask : IntPtr

    Group : UInt16

}
