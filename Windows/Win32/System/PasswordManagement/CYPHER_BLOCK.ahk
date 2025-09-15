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
    static sizeof => 16

    static packingSize => 2

    /**
     * An array of CHAR used to store the password hashes and cipher text passed by the MS-CHAP password management API.
     * @type {String}
     */
    data {
        get => StrGet(this.ptr + 0, 7, "UTF-16")
        set => StrPut(value, this.ptr + 0, 7, "UTF-16")
    }
}
