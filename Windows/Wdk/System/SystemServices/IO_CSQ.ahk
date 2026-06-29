#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_CSQ {
    #StructPack 8

    Type : UInt32

    CsqInsertIrp : IntPtr

    CsqRemoveIrp : IntPtr

    CsqPeekNextIrp : IntPtr

    CsqAcquireLock : IntPtr

    CsqReleaseLock : IntPtr

    CsqCompleteCanceledIrp : IntPtr

    ReservePointer : IntPtr

}
