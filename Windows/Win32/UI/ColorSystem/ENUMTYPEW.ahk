#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that defines the profile enumeration constraints.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//icm/ns-icm-enumtypew
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class ENUMTYPEW extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The size of this structure in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The version number of the **ENUMTYPE** structure. Should be set to ENUM\_TYPE\_VERSION.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

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
     * @type {Integer}
     */
    dwFields {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * User friendly name of the device.
     * @type {PWSTR}
     */
    pDeviceName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Indicates which type of media is associated with the profile, such as a printer or screen.
     * @type {Integer}
     */
    dwMediaType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Indicates the style of dithering that will be used when an image is displayed.
     * @type {Integer}
     */
    dwDitheringMode {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The horizontal (x) and vertical (y) resolution in pixels of the device on which the image will be displayed. The x resolution is stored in **dwResolution\[0\]**, and the y resolution is kept in **dwResolution\[1\]**.
     * @type {Array<UInt32>}
     */
    dwResolution{
        get {
            if(!this.HasProp("__dwResolutionProxyArray"))
                this.__dwResolutionProxyArray := Win32FixedArray(this.ptr + 32, 2, Primitive, "uint")
            return this.__dwResolutionProxyArray
        }
    }

    /**
     * The identification number of the CMM that is used in the profile. Identification numbers are registered with the ICC.
     * @type {Integer}
     */
    dwCMMType {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * 
     * @type {Integer}
     */
    dwClass {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * A signature value that indicates the color space in which the profile data is defined. Can be any value from the [Color Space Constants](/windows/win32/wcs/color-space-constants).
     * @type {Integer}
     */
    dwDataColorSpace {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    dwConnectionSpace {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Reserved for internal use.
     * @type {Integer}
     */
    dwSignature {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * 
     * @type {Integer}
     */
    dwPlatform {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * 
     * @type {Integer}
     */
    dwProfileFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The identification number of the device profile manufacturer. All manufacturer identification numbers are registered with the ICC.
     * @type {Integer}
     */
    dwManufacturer {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The device manufacturer's device model number. All model identification numbers are registered with the ICC.
     * @type {Integer}
     */
    dwModel {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * 
     * @type {Array<UInt32>}
     */
    dwAttributes{
        get {
            if(!this.HasProp("__dwAttributesProxyArray"))
                this.__dwAttributesProxyArray := Win32FixedArray(this.ptr + 76, 2, Primitive, "uint")
            return this.__dwAttributesProxyArray
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwRenderingIntent {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Signature of the software that created the profile. Signatures are registered with the ICC.
     * @type {Integer}
     */
    dwCreator {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * 
     * @type {Integer}
     */
    dwDeviceClass {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }
}
