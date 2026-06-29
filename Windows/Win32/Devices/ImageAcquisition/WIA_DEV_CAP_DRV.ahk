#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_DEV_CAP_DRV {
    #StructPack 8

    guid : Guid.Ptr

    ulFlags : UInt32

    wszName : PWSTR

    wszDescription : PWSTR

    wszIcon : PWSTR

}
