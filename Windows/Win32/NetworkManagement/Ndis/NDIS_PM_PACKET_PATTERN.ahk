#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_PM_PACKET_PATTERN {
    #StructPack 4

    Priority : UInt32

    Reserved : UInt32

    MaskSize : UInt32

    PatternOffset : UInt32

    PatternSize : UInt32

    PatternFlags : UInt32

}
