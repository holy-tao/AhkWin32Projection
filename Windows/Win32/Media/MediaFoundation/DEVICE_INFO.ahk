#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * Contains information about a media sharing device.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/ns-mfsharingengine-device_info
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DEVICE_INFO {
    #StructPack 8

    /**
     * The friendly name of the device.
     */
    pFriendlyDeviceName : BSTR

    /**
     * A string that uniquely identifies the device.
     */
    pUniqueDeviceName : BSTR

    /**
     * The manufacturer name.
     */
    pManufacturerName : BSTR

    /**
     * The model name.
     */
    pModelName : BSTR

    /**
     * The URL of an icon for the device.
     */
    pIconURL : BSTR

}
