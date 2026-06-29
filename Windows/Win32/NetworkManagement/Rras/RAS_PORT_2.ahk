#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\RAS_HARDWARE_CONDITION.ahk" { RAS_HARDWARE_CONDITION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_PORT_2 {
    #StructPack 8

    hPort : HANDLE

    hConnection : HANDLE

    dwConn_State : UInt32

    wszPortName : WCHAR[17]

    wszMediaName : WCHAR[17]

    wszDeviceName : WCHAR[129]

    wszDeviceType : WCHAR[17]

    dwHardwareCondition : RAS_HARDWARE_CONDITION

    dwLineSpeed : UInt32

    dwCrcErr : UInt32

    dwSerialOverRunErrs : UInt32

    dwTimeoutErr : UInt32

    dwAlignmentErr : UInt32

    dwHardwareOverrunErr : UInt32

    dwFramingErr : UInt32

    dwBufferOverrunErr : UInt32

    dwCompressionRatioIn : UInt32

    dwCompressionRatioOut : UInt32

    dwTotalErrors : UInt32

    ullBytesXmited : Int64

    ullBytesRcved : Int64

    ullFramesXmited : Int64

    ullFramesRcved : Int64

    ullBytesTxUncompressed : Int64

    ullBytesTxCompressed : Int64

    ullBytesRcvUncompressed : Int64

    ullBytesRcvCompressed : Int64

}
