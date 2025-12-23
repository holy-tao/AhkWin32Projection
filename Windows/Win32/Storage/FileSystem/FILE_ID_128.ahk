#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a 128-bit file identifier.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_id_128
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ID_128 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * A byte array containing  the 128 bit identifier.
     * @type {Array<Byte>}
     */
    Identifier{
        get {
            if(!this.HasProp("__IdentifierProxyArray"))
                this.__IdentifierProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__IdentifierProxyArray
        }
    }
}
