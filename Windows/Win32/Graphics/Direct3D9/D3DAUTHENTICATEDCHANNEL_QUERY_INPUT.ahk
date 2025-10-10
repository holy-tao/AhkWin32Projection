#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERY_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    QueryType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    hChannel {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
