#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CYPHER_BLOCK is the basic unit of storage for the one-way function (OWF) password hashes.
 * @see https://learn.microsoft.com/windows/win32/api/mschapp/ns-mschapp-cypher_block
 * @namespace Windows.Win32.System.PasswordManagement
 * @version v4.0.30319
 */
class CYPHER_BLOCK extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * An array of CHAR used to store the password hashes and cipher text passed by the MS-CHAP password management API.
     * @type {Array<SByte>}
     */
    data{
        get {
            if(!this.HasProp("__dataProxyArray"))
                this.__dataProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__dataProxyArray
        }
    }
}
