#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_STORAGE_TIER_CLASS.ahk" { FILE_STORAGE_TIER_CLASS }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STREAM_INFORMATION_ENTRY {
    #StructPack 8


    struct _StreamInformation {

        struct _DesiredStorageClass {
            Class : FILE_STORAGE_TIER_CLASS

            Flags : UInt32

        }

        struct _DataStream {
            Length : UInt16

            Flags : UInt16

            Reserved : UInt32

            Vdl : Int64

        }

        struct _Reparse {
            Length : UInt16

            Flags : UInt16

            ReparseDataSize : UInt32

            ReparseDataOffset : UInt32

        }

        struct _Ea {
            Length : UInt16

            Flags : UInt16

            EaSize : UInt32

            EaInformationOffset : UInt32

        }

        DesiredStorageClass : STREAM_INFORMATION_ENTRY._StreamInformation._DesiredStorageClass

        static __New() {
            DefineProp(this.Prototype, 'DataStream', { type: STREAM_INFORMATION_ENTRY._StreamInformation._DataStream, offset: 0 })
            DefineProp(this.Prototype, 'Reparse', { type: STREAM_INFORMATION_ENTRY._StreamInformation._Reparse, offset: 0 })
            DefineProp(this.Prototype, 'Ea', { type: STREAM_INFORMATION_ENTRY._StreamInformation._Ea, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Version : UInt32

    Flags : UInt32

    StreamInformation : STREAM_INFORMATION_ENTRY._StreamInformation

}
