#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The UUID_VECTOR structure contains a list of UUIDs.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> vector contains a count member containing the total number of <b>UUID</b>s in the vector, followed by an array of pointers to <b>UUID</b>s.
 * 
 * An application constructs a <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> vector to contain object <b>UUID</b>s to be exported or unexported from the name service.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-uuid_vector
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class UUID_VECTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>s present in the array <b>Uuid</b>.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of pointers to <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>s that contains <b>Count</b> elements.
     * @type {Array<Guid>}
     */
    Uuid{
        get {
            if(!this.HasProp("__UuidProxyArray"))
                this.__UuidProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__UuidProxyArray
        }
    }
}
