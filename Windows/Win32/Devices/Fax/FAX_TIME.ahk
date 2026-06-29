#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FAX_TIME structure represents a time, using individual members for the current hour and minute. The time is expressed in Coordinated Universal Time (UTC).
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_configurationa">FAX_CONFIGURATION</a> structure includes a <b>FAX_TIME</b> structure to describe the discount period that applies when a fax server is sending fax transmissions.
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_time
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_TIME {
    #StructPack 2

    /**
     * Type: <b>WORD</b>
     * 
     * Specifies a 16-bit unsigned integer that is the current hour. Valid values are 0 through 23.
     */
    Hour : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * Specifies a 16-bit unsigned integer that is the current minute. Valid values are 0 through 59.
     */
    Minute : UInt16

}
