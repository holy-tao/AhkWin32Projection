#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFLT_VOLUME.ahk" { PFLT_VOLUME }
#Import ".\PFLT_FILTER.ahk" { PFLT_FILTER }
#Import "..\..\..\Foundation\KTRANSACTION.ahk" { KTRANSACTION }
#Import ".\PFLT_INSTANCE.ahk" { PFLT_INSTANCE }
#Import "..\..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_RELATED_OBJECTS {
    #StructPack 8

    Size : UInt16

    TransactionContext : UInt16

    Filter : PFLT_FILTER

    Volume : PFLT_VOLUME

    Instance : PFLT_INSTANCE

    FileObject : FILE_OBJECT.Ptr

    Transaction : KTRANSACTION.Ptr

}
