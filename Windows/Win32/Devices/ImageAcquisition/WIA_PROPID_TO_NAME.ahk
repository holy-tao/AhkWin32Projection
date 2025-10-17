#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides a quick means by which applications can look up the standard Windows Image Acquisition (WIA) property name from the WIA property ID (or vice versa).
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/ns-wia_xp-wia_propid_to_name
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIA_PROPID_TO_NAME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>PROPID</b>
     * 
     * WIA property ID.
     * @type {Integer}
     */
    propid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPOLESTR</b>
     * 
     * WIA property name. 
     * 
     * <div class="alert"><b>Note</b>  Property names are not localized. They are primarily used to support scripting languages; therefore, they are always the same on any system.</div>
     * <div> </div>
     * @type {PWSTR}
     */
    pszName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
