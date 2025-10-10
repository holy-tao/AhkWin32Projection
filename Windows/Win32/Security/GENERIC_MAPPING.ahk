#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Defines the mapping of generic access rights to specific and standard access rights for an object.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-generic_mapping
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class GENERIC_MAPPING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> defining read access to an object.
     * @type {Integer}
     */
    GenericRead {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies an access mask defining write access to an object.
     * @type {Integer}
     */
    GenericWrite {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies an access mask defining execute access to an object.
     * @type {Integer}
     */
    GenericExecute {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies an access mask defining all possible types of access to an object.
     * @type {Integer}
     */
    GenericAll {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
