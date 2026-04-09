#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Direct3D9\D3DFORMAT.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_ProcAmpControlCaps extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    InputPool {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {D3DFORMAT}
     */
    d3dOutputFormat {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ProcAmpControlProps {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    VideoProcessingCaps {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
