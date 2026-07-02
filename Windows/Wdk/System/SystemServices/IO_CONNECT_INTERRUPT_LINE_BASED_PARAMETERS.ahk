#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PKINTERRUPT.ahk" { PKINTERRUPT }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\PKSERVICE_ROUTINE.ahk" { PKSERVICE_ROUTINE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_CONNECT_INTERRUPT_LINE_BASED_PARAMETERS {
    #StructPack 8

    PhysicalDeviceObject : DEVICE_OBJECT.Ptr

    InterruptObject : PKINTERRUPT.Ptr

    ServiceRoutine : PKSERVICE_ROUTINE

    ServiceContext : IntPtr

    SpinLock : IntPtr

    SynchronizeIrql : Int8

    FloatingSave : BOOLEAN

}
