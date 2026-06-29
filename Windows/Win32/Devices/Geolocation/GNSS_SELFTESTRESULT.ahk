#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_SELFTESTRESULT {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    TestResultStatus : NTSTATUS

    Result : UInt32

    PinFailedBitMask : UInt32

    Unused : Int8[512]

    OutBufLen : UInt32

    OutBuffer : Int8[1]

}
