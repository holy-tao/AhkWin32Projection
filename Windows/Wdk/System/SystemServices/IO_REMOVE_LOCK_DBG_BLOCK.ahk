#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PIO_REMOVE_LOCK_TRACKING_BLOCK.ahk" { PIO_REMOVE_LOCK_TRACKING_BLOCK }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_REMOVE_LOCK_DBG_BLOCK {
    #StructPack 8

    Signature : Int32

    HighWatermark : UInt32

    MaxLockedTicks : Int64

    AllocateTag : Int32

    LockList : IntPtr

    Spin : IntPtr

    LowMemoryCount : Int32

    Reserved1 : UInt32[4]

    Reserved2 : IntPtr

    Blocks : PIO_REMOVE_LOCK_TRACKING_BLOCK

}
