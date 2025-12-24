#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\SID_IDENTIFIER_AUTHORITY.ahk

/**
 * Used to uniquely identify users or groups.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-sid
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SID extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SubAuthorityCount {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {SID_IDENTIFIER_AUTHORITY}
     */
    IdentifierAuthority{
        get {
            if(!this.HasProp("__IdentifierAuthority"))
                this.__IdentifierAuthority := SID_IDENTIFIER_AUTHORITY(2, this)
            return this.__IdentifierAuthority
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    SubAuthority{
        get {
            if(!this.HasProp("__SubAuthorityProxyArray"))
                this.__SubAuthorityProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "uint")
            return this.__SubAuthorityProxyArray
        }
    }
}
