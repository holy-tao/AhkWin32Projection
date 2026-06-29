#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IO_STACK_LOCATION.ahk" { IO_STACK_LOCATION }
#Import ".\KEVENT.ahk" { KEVENT }
#Import ".\_IORING_OBJECT.ahk" { _IORING_OBJECT }
#Import ".\PETHREAD.ahk" { PETHREAD }
#Import "..\..\Win32\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }
#Import "..\..\Win32\Foundation\CHAR.ahk" { CHAR }
#Import ".\MDL.ahk" { MDL }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct IRP {
    #StructPack 8


    struct _AssociatedIrp {
        MasterIrp : IRP.Ptr

        static __New() {
            DefineProp(this.Prototype, 'IrpCount', { type: Int32, offset: 0 })
            DefineProp(this.Prototype, 'SystemBuffer', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Overlay {

        struct _AsynchronousParameters {
            UserApcRoutine : IntPtr

            UserApcContext : IntPtr

            static __New() {
                DefineProp(this.Prototype, 'IssuingProcess', { type: IntPtr, offset: 0 })
                DefineProp(this.Prototype, 'IoRing', { type: _IORING_OBJECT.Ptr, offset: 8 })
                this.DeleteProp("__New")
            }
        }

        AsynchronousParameters : IRP._Overlay._AsynchronousParameters

        static __New() {
            DefineProp(this.Prototype, 'AllocationSize', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Tail {

        struct _Overlay {
            DeviceQueueEntry : IntPtr

            Thread : PETHREAD

            AuxiliaryBuffer : PSTR

            ListEntry : IntPtr

            __CurrentStackLocation_ptr : IntPtr
            CurrentStackLocation {
                get => (addr := this.__CurrentStackLocation_ptr) ? IO_STACK_LOCATION.At(addr) : unset
                set => this.__CurrentStackLocation_ptr := (IsSet(value) && value) ? value.Ptr : 0
            }

            __OriginalFileObject_ptr : IntPtr
            OriginalFileObject {
                get => (addr := this.__OriginalFileObject_ptr) ? FILE_OBJECT.At(addr) : unset
                set => this.__OriginalFileObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
            }

            static __New() {
                DefineProp(this.Prototype, 'DriverContext', { type: IntPtr[4], offset: 0 })
                DefineProp(this.Prototype, 'PacketType', { type: UInt32, offset: 56 })
                this.DeleteProp("__New")
            }
        }

        Overlay : IRP._Tail._Overlay

        static __New() {
            DefineProp(this.Prototype, 'Apc', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'CompletionKey', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : Int16

    Size : UInt16

    MdlAddress : MDL.Ptr

    Flags : UInt32

    AssociatedIrp : IRP._AssociatedIrp

    ThreadListEntry : IntPtr

    IoStatus : IntPtr

    RequestorMode : Int8

    PendingReturned : BOOLEAN

    StackCount : CHAR

    CurrentLocation : CHAR

    Cancel : BOOLEAN

    CancelIrql : Int8

    ApcEnvironment : Int8

    AllocationFlags : Int8

    UserIosb : IO_STATUS_BLOCK.Ptr

    UserEvent : KEVENT.Ptr

    Overlay : IRP._Overlay

    CancelRoutine : IntPtr

    UserBuffer : IntPtr

    Tail : IRP._Tail

    static __New() {
        DefineProp(this.Prototype, 'IoRingContext', { type: IntPtr, offset: 56 })
        this.DeleteProp("__New")
    }
}
