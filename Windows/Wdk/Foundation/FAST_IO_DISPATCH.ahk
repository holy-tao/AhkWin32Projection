#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_DISPATCH {
    #StructPack 8

    SizeOfFastIoDispatch : UInt32

    FastIoCheckIfPossible : IntPtr

    FastIoRead : IntPtr

    FastIoWrite : IntPtr

    FastIoQueryBasicInfo : IntPtr

    FastIoQueryStandardInfo : IntPtr

    FastIoLock : IntPtr

    FastIoUnlockSingle : IntPtr

    FastIoUnlockAll : IntPtr

    FastIoUnlockAllByKey : IntPtr

    FastIoDeviceControl : IntPtr

    AcquireFileForNtCreateSection : IntPtr

    ReleaseFileForNtCreateSection : IntPtr

    FastIoDetachDevice : IntPtr

    FastIoQueryNetworkOpenInfo : IntPtr

    AcquireForModWrite : IntPtr

    MdlRead : IntPtr

    MdlReadComplete : IntPtr

    PrepareMdlWrite : IntPtr

    MdlWriteComplete : IntPtr

    FastIoReadCompressed : IntPtr

    FastIoWriteCompressed : IntPtr

    MdlReadCompleteCompressed : IntPtr

    MdlWriteCompleteCompressed : IntPtr

    FastIoQueryOpen : IntPtr

    ReleaseForModWrite : IntPtr

    AcquireForCcFlush : IntPtr

    ReleaseForCcFlush : IntPtr

}
