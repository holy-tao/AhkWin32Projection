#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store and retrieve opaque data blobs.
 * @remarks
 * The <b>PrivateData</b> structure is used to store state information for the NapAgent and enforcement clients. It is queried and set by the <a href="https://docs.microsoft.com/windows/desktop/NAP/inapsystemhealthvalidationrequest">INapSystemHealthValidationRequest</a> and <a href="https://docs.microsoft.com/windows/desktop/NAP/inapenforcementclientconnection">INapEnforcementClientConnection</a> interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-privatedata
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class PrivateData extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes,  of  <b>data</b> in the range 0 to <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">maxPrivateDataSize</a>.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A pointer to the opaque data blob.
     * @type {Pointer<Byte>}
     */
    data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
