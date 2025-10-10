#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * PEERDIST_CONTENT_TAG structure contains a client supplied content tag as an input to the PeerDistClientOpenContent API.
 * @see https://docs.microsoft.com/windows/win32/api//peerdist/ns-peerdist-peerdist_content_tag
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEERDIST_CONTENT_TAG extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * A 16 byte tag associated with the open content.
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
