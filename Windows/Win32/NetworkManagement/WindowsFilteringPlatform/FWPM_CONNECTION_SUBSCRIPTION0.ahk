#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores information used to subscribe to notifications about a connection object.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_connection_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_CONNECTION_SUBSCRIPTION0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[FWPM_CONNECTION_ENUM_TEMPLATE0](/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_connection_enum_template0)**
     * 
     * Enumeration template for limiting the subscription.
     * @type {Pointer<FWPM_CONNECTION_ENUM_TEMPLATE0>}
     */
    enumTemplate {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reserved for system use.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Identifies the session that created the subscription.
     * @type {Pointer<Guid>}
     */
    sessionKey {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
