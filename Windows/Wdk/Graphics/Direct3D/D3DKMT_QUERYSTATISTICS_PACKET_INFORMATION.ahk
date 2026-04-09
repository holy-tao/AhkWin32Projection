#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERYSTATISTICS_PACKET_INFORMATION extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Array<Pointer>}
     */
    QueuePacket {
        get {
            if(!this.HasProp("__QueuePacketProxyArray"))
                this.__QueuePacketProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "ptr")
            return this.__QueuePacketProxyArray
        }
    }

    /**
     * @type {Array<Pointer>}
     */
    DmaPacket {
        get {
            if(!this.HasProp("__DmaPacketProxyArray"))
                this.__DmaPacketProxyArray := Win32FixedArray(this.ptr + 64, 4, Primitive, "ptr")
            return this.__DmaPacketProxyArray
        }
    }
}
