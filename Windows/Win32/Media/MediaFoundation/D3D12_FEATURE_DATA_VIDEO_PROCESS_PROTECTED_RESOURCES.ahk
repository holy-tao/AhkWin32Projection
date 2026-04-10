#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_FEATURE_DATA_VIDEO_PROCESS_PROTECTED_RESOURCES extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS}
     */
    SupportFlags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
