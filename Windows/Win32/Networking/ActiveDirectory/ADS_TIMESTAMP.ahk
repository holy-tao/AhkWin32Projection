#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ADS_TIMESTAMP structure is an ADSI representation of the Timestamp attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_timestamp
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_TIMESTAMP {
    #StructPack 4

    /**
     * Number of seconds, with zero value being equal to 12:00 AM, January, 1970, UTC.
     */
    WholeSeconds : UInt32

    /**
     * An event identifier, in the order of occurrence, within the period specified by <b>WholeSeconds</b>.
     */
    EventID : UInt32

}
