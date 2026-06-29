#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINECALLTREATMENTENTRY structure provides information on the type of call treatment, such as music, recorded announcement, or silence, on the current call. The LINEADDRESSCAPS structure can contain an array of LINECALLTREATMENTENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linecalltreatmententry
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINECALLTREATMENTENTRY {
    #StructPack 4

    /**
     * One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecalltreatment--constants">LINECALLTREATMENT_ Constants</a> (if the treatment is of a predefined type) or a service provider-specific value.
     */
    dwCallTreatmentID : UInt32

    /**
     * Size of the call treatment name string, in bytes, including the null-terminating character.
     */
    dwCallTreatmentNameSize : UInt32

    /**
     * Offset from the beginning of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddresscaps">LINEADDRESSCAPS</a> to a null-terminated string identifying the treatment. This would ordinarily describe the content of the music or recorded announcement. If the treatment is of a predefined type, a meaningful name should still be specified, for example, "Silence\0", "Busy Signal\0", "Ringback\0", or "Music\0". The size of the string is specified by <b>dwCallTreatmentNameOffset</b>.
     */
    dwCallTreatmentNameOffset : UInt32

}
