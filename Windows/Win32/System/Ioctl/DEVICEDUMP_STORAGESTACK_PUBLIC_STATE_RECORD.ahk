#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD {
    #StructPack 8


    struct _StackSpecific {

        struct _ExternalStack {
            dwReserved : UInt32

        }

        struct _AtaPort {
            dwAtaPortSpecific : UInt32

        }

        struct _StorPort {
            SrbTag : UInt32

        }

        ExternalStack : DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD._StackSpecific._ExternalStack

        static __New() {
            DefineProp(this.Prototype, 'AtaPort', { type: DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD._StackSpecific._AtaPort, offset: 0 })
            DefineProp(this.Prototype, 'StorPort', { type: DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD._StackSpecific._StorPort, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Cdb : Int8[16]

    Command : Int8[16]

    StartTime : Int64

    EndTime : Int64

    OperationStatus : UInt32

    OperationError : UInt32

    StackSpecific : DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD._StackSpecific

}
