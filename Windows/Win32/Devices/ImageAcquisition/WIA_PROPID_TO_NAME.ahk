#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Provides a quick means by which applications can look up the standard Windows Image Acquisition (WIA) property name from the WIA property ID (or vice versa).
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/ns-wia_xp-wia_propid_to_name
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_PROPID_TO_NAME {
    #StructPack 8

    /**
     * Type: <b>PROPID</b>
     * 
     * WIA property ID.
     */
    propid : UInt32

    /**
     * Type: <b>LPOLESTR</b>
     * 
     * WIA property name. 
     * 
     * <div class="alert"><b>Note</b>  Property names are not localized. They are primarily used to support scripting languages; therefore, they are always the same on any system.</div>
     * <div> </div>
     */
    pszName : PWSTR

}
