#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Is used to pair SoHRequests with SoHResponses and uniquely describes an SoH exchange.
 * @remarks
 * The
 *    string version, <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-datatypes">StringCorrelationId</a>, is used primarily for logging purposes,
 *    whereas this byte version is used by SHA/SHVs to
 *    match <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRequests</a> to <b>SoHResponses</b>.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-correlationid
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct CorrelationId {
    #StructPack 4

    /**
     * A globally unique identifier (GUID) that identifies a SoH  exchange.
     */
    connId : Guid

    /**
     * A  unique <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> value that contains the system time at which the <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRequest</a> was generated.
     */
    timeStamp : FILETIME

}
