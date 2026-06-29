#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKsDataTypeHandler.ahk" { IKsDataTypeHandler }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\KSIOOPERATION.ahk" { KSIOOPERATION }
#Import ".\IKsInterfaceHandler.ahk" { IKsInterfaceHandler }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSSTREAM_SEGMENT {
    #StructPack 8

    KsInterfaceHandler : IKsInterfaceHandler

    KsDataTypeHandler : IKsDataTypeHandler

    IoOperation : KSIOOPERATION

    CompletionEvent : HANDLE

}
