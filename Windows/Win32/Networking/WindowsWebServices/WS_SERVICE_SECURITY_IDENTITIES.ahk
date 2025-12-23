#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A list of Server Principal Names (SPNs) that are used to validate Extended Protection.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_security_identities
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_SECURITY_IDENTITIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A array of strings representing the SPNs accepted by the server. Wildcards are not allowed.
     * @type {Pointer<WS_STRING>}
     */
    serviceIdentities {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of strings in serviceIdentities.
     * @type {Integer}
     */
    serviceIdentityCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
