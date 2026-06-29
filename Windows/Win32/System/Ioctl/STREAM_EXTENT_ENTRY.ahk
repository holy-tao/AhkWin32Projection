#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RETRIEVAL_POINTERS_BUFFER.ahk" { RETRIEVAL_POINTERS_BUFFER }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STREAM_EXTENT_ENTRY {
    #StructPack 8


    struct _ExtentInformation {
        RetrievalPointers : RETRIEVAL_POINTERS_BUFFER

    }

    Flags : UInt32

    ExtentInformation : STREAM_EXTENT_ENTRY._ExtentInformation

}
