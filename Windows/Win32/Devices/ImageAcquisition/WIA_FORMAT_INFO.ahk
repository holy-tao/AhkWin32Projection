#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The WIA_FORMAT_INFO structure specifies valid format and media type pairs for a device.
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/ns-wia_xp-wia_format_info
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_FORMAT_INFO {
    #StructPack 4

    /**
     * Type: <b>GUID</b>
     * 
     * GUID that identifies the format.
     */
    guidFormatID : Guid

    /**
     * Type: <b>LONG</b>
     * 
     * The media type that corresponds to the <b>guidFormatID</b> member.
     */
    lTymed : Int32

}
