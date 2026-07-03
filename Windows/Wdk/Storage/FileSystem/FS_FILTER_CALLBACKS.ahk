#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFS_FILTER_CALLBACK.ahk" { PFS_FILTER_CALLBACK }
#Import ".\PFS_FILTER_COMPLETION_CALLBACK.ahk" { PFS_FILTER_COMPLETION_CALLBACK }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FS_FILTER_CALLBACKS {
    #StructPack 8

    SizeOfFsFilterCallbacks : UInt32

    Reserved : UInt32

    PreAcquireForSectionSynchronization : PFS_FILTER_CALLBACK

    PostAcquireForSectionSynchronization : PFS_FILTER_COMPLETION_CALLBACK

    PreReleaseForSectionSynchronization : PFS_FILTER_CALLBACK

    PostReleaseForSectionSynchronization : PFS_FILTER_COMPLETION_CALLBACK

    PreAcquireForCcFlush : PFS_FILTER_CALLBACK

    PostAcquireForCcFlush : PFS_FILTER_COMPLETION_CALLBACK

    PreReleaseForCcFlush : PFS_FILTER_CALLBACK

    PostReleaseForCcFlush : PFS_FILTER_COMPLETION_CALLBACK

    PreAcquireForModifiedPageWriter : PFS_FILTER_CALLBACK

    PostAcquireForModifiedPageWriter : PFS_FILTER_COMPLETION_CALLBACK

    PreReleaseForModifiedPageWriter : PFS_FILTER_CALLBACK

    PostReleaseForModifiedPageWriter : PFS_FILTER_COMPLETION_CALLBACK

    PreQueryOpen : PFS_FILTER_CALLBACK

    PostQueryOpen : PFS_FILTER_COMPLETION_CALLBACK

}
