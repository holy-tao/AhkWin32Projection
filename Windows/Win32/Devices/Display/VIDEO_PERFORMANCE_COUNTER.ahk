#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_PERFORMANCE_COUNTER {
    #StructPack 8

    NbOfAllocationEvicted : Int64[10]

    NbOfAllocationMarked : Int64[10]

    NbOfAllocationRestored : Int64[10]

    KBytesEvicted : Int64[10]

    KBytesMarked : Int64[10]

    KBytesRestored : Int64[10]

    NbProcessCommited : Int64

    NbAllocationCommited : Int64

    NbAllocationMarked : Int64

    KBytesAllocated : Int64

    KBytesAvailable : Int64

    KBytesCurMarked : Int64

    Reference : Int64

    Unreference : Int64

    TrueReference : Int64

    NbOfPageIn : Int64

    KBytesPageIn : Int64

    NbOfPageOut : Int64

    KBytesPageOut : Int64

    NbOfRotateOut : Int64

    KBytesRotateOut : Int64

}
