#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_LOCAL_INFORMATION {
    #StructPack 4

    NamedPipeType : UInt32

    NamedPipeConfiguration : UInt32

    MaximumInstances : UInt32

    CurrentInstances : UInt32

    InboundQuota : UInt32

    ReadDataAvailable : UInt32

    OutboundQuota : UInt32

    WriteQuotaAvailable : UInt32

    NamedPipeState : UInt32

    NamedPipeEnd : UInt32

}
