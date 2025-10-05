#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_INTERLEAVE_S extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    InterleavedCapPossible {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
