#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information that defines the profile enumeration constraints. (ANSI)
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-enumtypea
 * @namespace Windows.Win32.UI.ColorSystem
 * @charset ANSI
 */
export default struct ENUMTYPEA {
    #StructPack 8

    /**
     * The size of this structure in bytes.
     */
    dwSize : UInt32

    /**
     * The version number of the **ENUMTYPE** structure. Should be set to ENUM\_TYPE\_VERSION.
     */
    dwVersion : UInt32

    /**
     * Indicates which fields in this structure are being used. Can be set to any combination of the following constant values.
     * 
     * ET\_DEVICENAME
     * 
     * ET\_MEDIATYPE
     * 
     * ET\_DITHERMODE
     * 
     * ET\_RESOLUTION
     * 
     * ET\_CMMTYPE
     * 
     * ET\_CLASS
     * 
     * ET\_DATACOLORSPACE
     * 
     * ET\_CONNECTIONSPACE
     * 
     * ET\_SIGNATURE
     * 
     * ET\_PLATFORM
     * 
     * ET\_PROFILEFLAGS
     * 
     * ET\_MANUFACTURER
     * 
     * ET\_MODEL
     * 
     * ET\_ATTRIBUTES
     * 
     * ET\_RENDERINGINTENT
     * 
     * ET\_CREATOR
     * 
     * ET\_DEVICECLASS
     */
    dwFields : UInt32

    /**
     * User friendly name of the device.
     */
    pDeviceName : PSTR

    /**
     * Indicates which type of media is associated with the profile, such as a printer or screen.
     */
    dwMediaType : UInt32

    /**
     * Indicates the style of dithering that will be used when an image is displayed.
     */
    dwDitheringMode : UInt32

    /**
     * The horizontal (x) and vertical (y) resolution in pixels of the device on which the image will be displayed. The x resolution is stored in **dwResolution\[0\]**, and the y resolution is kept in **dwResolution\[1\]**.
     */
    dwResolution : UInt32[2]

    /**
     * The identification number of the CMM that is used in the profile. Identification numbers are registered with the ICC.
     */
    dwCMMType : UInt32

    dwClass : UInt32

    /**
     * A signature value that indicates the color space in which the profile data is defined. Can be any value from the [Color Space Constants](/windows/win32/wcs/color-space-constants).
     */
    dwDataColorSpace : UInt32

    dwConnectionSpace : UInt32

    /**
     * Reserved for internal use.
     */
    dwSignature : UInt32

    dwPlatform : UInt32

    dwProfileFlags : UInt32

    /**
     * The identification number of the device profile manufacturer. All manufacturer identification numbers are registered with the ICC.
     */
    dwManufacturer : UInt32

    /**
     * The device manufacturer's device model number. All model identification numbers are registered with the ICC.
     */
    dwModel : UInt32

    dwAttributes : UInt32[2]

    dwRenderingIntent : UInt32

    /**
     * Signature of the software that created the profile. Signatures are registered with the ICC.
     */
    dwCreator : UInt32

    dwDeviceClass : UInt32

}
