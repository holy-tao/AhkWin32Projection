#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_OPERATION_REGISTRATION.ahk" { FLT_OPERATION_REGISTRATION }
#Import ".\FLT_CONTEXT_REGISTRATION.ahk" { FLT_CONTEXT_REGISTRATION }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_REGISTRATION {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Flags : UInt32

    ContextRegistration : FLT_CONTEXT_REGISTRATION.Ptr

    OperationRegistration : FLT_OPERATION_REGISTRATION.Ptr

    FilterUnloadCallback : IntPtr

    InstanceSetupCallback : IntPtr

    InstanceQueryTeardownCallback : IntPtr

    InstanceTeardownStartCallback : IntPtr

    InstanceTeardownCompleteCallback : IntPtr

    GenerateFileNameCallback : IntPtr

    NormalizeNameComponentCallback : IntPtr

    NormalizeContextCleanupCallback : IntPtr

    TransactionNotificationCallback : IntPtr

    NormalizeNameComponentExCallback : IntPtr

    SectionNotificationCallback : IntPtr

}
