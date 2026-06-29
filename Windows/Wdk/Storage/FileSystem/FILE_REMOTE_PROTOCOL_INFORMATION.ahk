#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_REMOTE_PROTOCOL_INFORMATION {
    #StructPack 4


    struct _GenericReserved {
        Reserved : UInt32[8]

    }

    struct _ProtocolSpecific {

        struct _Smb2 {

            struct _Server {
                Capabilities : UInt32

            }

            struct _Share {
                Capabilities : UInt32

                ShareFlags : UInt32

                ShareType : Int8

                Reserved0 : Int8[3]

                Reserved1 : UInt32

            }

            Server : FILE_REMOTE_PROTOCOL_INFORMATION._ProtocolSpecific._Smb2._Server

            Share : FILE_REMOTE_PROTOCOL_INFORMATION._ProtocolSpecific._Smb2._Share

        }

        Smb2 : FILE_REMOTE_PROTOCOL_INFORMATION._ProtocolSpecific._Smb2

        static __New() {
            DefineProp(this.Prototype, 'Reserved', { type: UInt32[16], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    StructureVersion : UInt16

    StructureSize : UInt16

    Protocol : UInt32

    ProtocolMajorVersion : UInt16

    ProtocolMinorVersion : UInt16

    ProtocolRevision : UInt16

    Reserved : UInt16

    Flags : UInt32

    GenericReserved : FILE_REMOTE_PROTOCOL_INFORMATION._GenericReserved

    ProtocolSpecific : FILE_REMOTE_PROTOCOL_INFORMATION._ProtocolSpecific

}
