#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSTOPOLOGY_ENDPOINTID extends Win32Struct
{
    static sizeof => 524

    static packingSize => 4

    /**
     * @type {String}
     */
    TopologyName {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    PinId {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }
}
