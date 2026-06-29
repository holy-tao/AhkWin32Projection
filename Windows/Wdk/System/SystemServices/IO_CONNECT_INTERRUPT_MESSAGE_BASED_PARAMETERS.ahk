#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\PKINTERRUPT.ahk" { PKINTERRUPT }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\IO_INTERRUPT_MESSAGE_INFO.ahk" { IO_INTERRUPT_MESSAGE_INFO }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_CONNECT_INTERRUPT_MESSAGE_BASED_PARAMETERS {
    #StructPack 8


    struct _ConnectionContext {
        Generic : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'InterruptMessageTable', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'InterruptObject', { type: PKINTERRUPT.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    PhysicalDeviceObject : DEVICE_OBJECT.Ptr

    ConnectionContext : IO_CONNECT_INTERRUPT_MESSAGE_BASED_PARAMETERS._ConnectionContext

    MessageServiceRoutine : IntPtr

    ServiceContext : IntPtr

    SpinLock : IntPtr

    SynchronizeIrql : Int8

    FloatingSave : BOOLEAN

    FallBackServiceRoutine : IntPtr

}
