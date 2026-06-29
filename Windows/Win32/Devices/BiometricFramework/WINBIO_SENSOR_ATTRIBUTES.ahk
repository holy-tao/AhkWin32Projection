#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_REGISTERED_FORMAT.ahk" { WINBIO_REGISTERED_FORMAT }
#Import ".\WINBIO_VERSION.ahk" { WINBIO_VERSION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_SENSOR_ATTRIBUTES {
    #StructPack 4

    PayloadSize : UInt32

    WinBioHresult : HRESULT

    WinBioVersion : WINBIO_VERSION

    SensorType : UInt32

    SensorSubType : UInt32

    Capabilities : UInt32

    ManufacturerName : UInt16[256]

    ModelName : UInt16[256]

    SerialNumber : UInt16[256]

    FirmwareVersion : WINBIO_VERSION

    SupportedFormatEntries : UInt32

    SupportedFormat : WINBIO_REGISTERED_FORMAT[1]

}
