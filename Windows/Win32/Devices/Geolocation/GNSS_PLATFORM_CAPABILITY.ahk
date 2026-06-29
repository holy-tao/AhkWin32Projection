#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_PLATFORM_CAPABILITY {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    SupportAgnssInjection : BOOL

    AgnssFormatSupported : UInt32

    Unused : Int8[516]

}
