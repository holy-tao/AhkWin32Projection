#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DATA_SET_LB_PROVISIONING_STATE_V2 {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    SlabSizeInBytes : Int64

    SlabOffsetDeltaInBytes : Int64

    SlabAllocationBitMapBitCount : UInt32

    SlabAllocationBitMapLength : UInt32

    SlabAllocationBitMap : UInt32[1]

}
