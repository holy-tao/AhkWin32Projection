#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINECALLTREATMENTENTRY structure provides information on the type of call treatment, such as music, recorded announcement, or silence, on the current call. The LINEADDRESSCAPS structure can contain an array of LINECALLTREATMENTENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linecalltreatmententry
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINECALLTREATMENTENTRY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecalltreatment--constants">LINECALLTREATMENT_ Constants</a> (if the treatment is of a predefined type) or a service provider-specific value.
     * @type {Integer}
     */
    dwCallTreatmentID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the call treatment name string, in bytes, including the null-terminating character.
     * @type {Integer}
     */
    dwCallTreatmentNameSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Offset from the beginning of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddresscaps">LINEADDRESSCAPS</a> to a null-terminated string identifying the treatment. This would ordinarily describe the content of the music or recorded announcement. If the treatment is of a predefined type, a meaningful name should still be specified, for example, "Silence\0", "Busy Signal\0", "Ringback\0", or "Music\0". The size of the string is specified by <b>dwCallTreatmentNameOffset</b>.
     * @type {Integer}
     */
    dwCallTreatmentNameOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
