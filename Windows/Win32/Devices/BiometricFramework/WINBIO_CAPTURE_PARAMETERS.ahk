#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_REGISTERED_FORMAT.ahk" { WINBIO_REGISTERED_FORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_CAPTURE_PARAMETERS {
    #StructPack 4

    PayloadSize : UInt32

    Purpose : Int8

    Format : WINBIO_REGISTERED_FORMAT

    VendorFormat : Guid

    Flags : Int8

}
