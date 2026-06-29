#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFFRAMETYPE.ahk" { PFFRAMETYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PFLOGFRAME {
    #StructPack 8

    Timestamp : Int64

    pfeTypeOfFrame : PFFRAMETYPE

    dwTotalSizeUsed : UInt32

    dwFilterRule : UInt32

    wSizeOfAdditionalData : UInt16

    wSizeOfIpHeader : UInt16

    dwInterfaceName : UInt32

    dwIPIndex : UInt32

    bPacketData : Int8[1]

}
