#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1599 extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    sv1598_enforcekerberosreauthentication{
        get {
            if(!this.HasProp("__sv1598_enforcekerberosreauthentication"))
                this.__sv1598_enforcekerberosreauthentication := BOOLEAN(this.ptr + 0)
            return this.__sv1598_enforcekerberosreauthentication
        }
    }
}
