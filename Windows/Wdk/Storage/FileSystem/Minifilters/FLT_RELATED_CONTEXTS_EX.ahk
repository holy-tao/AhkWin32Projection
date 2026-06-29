#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFLT_CONTEXT.ahk" { PFLT_CONTEXT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_RELATED_CONTEXTS_EX {
    #StructPack 8

    VolumeContext : PFLT_CONTEXT

    InstanceContext : PFLT_CONTEXT

    FileContext : PFLT_CONTEXT

    StreamContext : PFLT_CONTEXT

    StreamHandleContext : PFLT_CONTEXT

    TransactionContext : PFLT_CONTEXT

    SectionContext : PFLT_CONTEXT

}
