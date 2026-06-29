#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_CWTESTDATA {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    TestResultStatus : NTSTATUS

    SignalToNoiseRatio : Float64

    Frequency : Float64

    Unused : Int8[512]

}
