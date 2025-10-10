#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AM_COPY_MACROVISION structure specifies the analog copy protection level for an NTSC encoder.
 * @remarks
 * 
  * The AM_PROPERTY_COPY_MACROVISION property of the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-copy-protection-property-set">DVD Copy Protection</a> property set uses this structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ns-dvdmedia-am_copy_macrovision
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_COPY_MACROVISION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Analog copy protection level for the NTSC encoder. Member of the <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_copy_macrovision_level">AM_COPY_MACROVISION_LEVEL</a> enumerated data type.
     * @type {Integer}
     */
    MACROVISIONLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
