#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * SID_IDENTIFIER_AUTHORITY IDL Definition
 * @see https://learn.microsoft.com/windows/win32/NetMgmt/odj-sid_identifier_authority
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SID_IDENTIFIER_AUTHORITY extends Win32Struct
{
    static sizeof => 6

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Value{
        get {
            if(!this.HasProp("__ValueProxyArray"))
                this.__ValueProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__ValueProxyArray
        }
    }
}
