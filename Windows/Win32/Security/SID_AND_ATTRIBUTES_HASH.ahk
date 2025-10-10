#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies a hash values for the specified array of security identifiers (SIDs).
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-sid_and_attributes_hash
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SID_AND_ATTRIBUTES_HASH extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * The number of SIDs pointed to by the <i>SidAttr</i> parameter.
     * @type {Integer}
     */
    SidCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures that represent SIDs and their attributes.
     * @type {Pointer<SID_AND_ATTRIBUTES>}
     */
    SidAttr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * An array of pointers to hash values. These values correspond to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures pointed to by the <i>SidAttr</i> parameter.
     * 
     * The <b>SID_HASH_ENTRY</b> data type is defined in Winnt.h as a <b>ULONG_PTR</b>.
     * 
     * The <b>SID_HASH_SIZE</b> array dimension is defined in Winnt.h as 32.
     * @type {Array<UIntPtr>}
     */
    Hash{
        get {
            if(!this.HasProp("__HashProxyArray"))
                this.__HashProxyArray := Win32FixedArray(this.ptr + 16, 32, Primitive, "ptr")
            return this.__HashProxyArray
        }
    }
}
