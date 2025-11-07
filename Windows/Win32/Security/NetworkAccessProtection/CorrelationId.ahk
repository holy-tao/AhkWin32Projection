#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Is used to pair SoHRequests with SoHResponses and uniquely describes an SoH exchange.
 * @remarks
 * 
 * The
 *    string version, <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-datatypes">StringCorrelationId</a>, is used primarily for logging purposes,
 *    whereas this byte version is used by SHA/SHVs to
 *    match <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRequests</a> to <b>SoHResponses</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//naptypes/ns-naptypes-correlationid
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class CorrelationId extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A globally unique identifier (GUID) that identifies a SoH  exchange.
     * @type {Pointer<Guid>}
     */
    connId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A  unique <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> value that contains the system time at which the <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRequest</a> was generated.
     * @type {FILETIME}
     */
    timeStamp{
        get {
            if(!this.HasProp("__timeStamp"))
                this.__timeStamp := FILETIME(8, this)
            return this.__timeStamp
        }
    }
}
