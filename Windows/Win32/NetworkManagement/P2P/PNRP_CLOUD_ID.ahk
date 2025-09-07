#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PNRP_CLOUD_ID structure contains the values that define a network cloud.
 * @see https://learn.microsoft.com/windows/win32/api/pnrpdef/ns-pnrpdef-pnrp_cloud_id
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PNRP_CLOUD_ID extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Must be AF_INET6.
     * @type {Integer}
     */
    AddressFamily {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Scope {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies the ID for this scope.
     * @type {Integer}
     */
    ScopeId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
