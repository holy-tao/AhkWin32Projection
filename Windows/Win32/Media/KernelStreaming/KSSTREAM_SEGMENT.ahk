#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IKsDataTypeHandler.ahk" { IKsDataTypeHandler }
#Import ".\IKsInterfaceHandler.ahk" { IKsInterfaceHandler }
#Import ".\KSIOOPERATION.ahk" { KSIOOPERATION }

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
