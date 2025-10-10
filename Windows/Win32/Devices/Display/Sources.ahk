#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Sources structure contains a Video Present Network (VidPN) topology.
 * @see https://docs.microsoft.com/windows/win32/api//cloneviewhelper/ns-cloneviewhelper-sources
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class Sources extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The source identifier for the video present source in the VidPN topology.
     * @type {Integer}
     */
    sourceId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of video present targets in the array that the <b>aTargets</b> member specifies, which is the number of video present targets in the VidPN topology.
     * @type {Integer}
     */
    numTargets {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * An array of identifiers for the video present targets in the VidPN topology.
     * @type {Array<UInt32>}
     */
    aTargets{
        get {
            if(!this.HasProp("__aTargetsProxyArray"))
                this.__aTargetsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "uint")
            return this.__aTargetsProxyArray
        }
    }
}
