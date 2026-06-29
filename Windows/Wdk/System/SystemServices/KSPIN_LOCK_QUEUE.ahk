#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KSPIN_LOCK_QUEUE {
    #StructPack 8

    Next : KSPIN_LOCK_QUEUE.Ptr

    Lock : IntPtr

}
