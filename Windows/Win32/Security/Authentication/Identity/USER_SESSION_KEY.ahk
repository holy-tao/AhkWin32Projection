#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\System\PasswordManagement\CYPHER_BLOCK.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class USER_SESSION_KEY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Array<CYPHER_BLOCK>}
     */
    data{
        get {
            if(!this.HasProp("__dataProxyArray"))
                this.__dataProxyArray := Win32FixedArray(this.ptr + 0, 8, CYPHER_BLOCK, "")
            return this.__dataProxyArray
        }
    }
}
