#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CC_ERROR_CALLBACK_CONTEXT {
    #StructPack 4

    NodeByteSize : Int16

    ErrorCode : NTSTATUS

}
