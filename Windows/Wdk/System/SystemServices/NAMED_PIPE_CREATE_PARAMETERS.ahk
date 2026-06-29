#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct NAMED_PIPE_CREATE_PARAMETERS {
    #StructPack 8

    NamedPipeType : UInt32

    ReadMode : UInt32

    CompletionMode : UInt32

    MaximumInstances : UInt32

    InboundQuota : UInt32

    OutboundQuota : UInt32

    DefaultTimeout : Int64

    TimeoutSpecified : BOOLEAN

}
