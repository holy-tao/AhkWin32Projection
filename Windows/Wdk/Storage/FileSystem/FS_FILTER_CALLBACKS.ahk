#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FS_FILTER_CALLBACKS {
    #StructPack 8

    SizeOfFsFilterCallbacks : UInt32

    Reserved : UInt32

    PreAcquireForSectionSynchronization : IntPtr

    PostAcquireForSectionSynchronization : IntPtr

    PreReleaseForSectionSynchronization : IntPtr

    PostReleaseForSectionSynchronization : IntPtr

    PreAcquireForCcFlush : IntPtr

    PostAcquireForCcFlush : IntPtr

    PreReleaseForCcFlush : IntPtr

    PostReleaseForCcFlush : IntPtr

    PreAcquireForModifiedPageWriter : IntPtr

    PostAcquireForModifiedPageWriter : IntPtr

    PreReleaseForModifiedPageWriter : IntPtr

    PostReleaseForModifiedPageWriter : IntPtr

    PreQueryOpen : IntPtr

    PostQueryOpen : IntPtr

}
