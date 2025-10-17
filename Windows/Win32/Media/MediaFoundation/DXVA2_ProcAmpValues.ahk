#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVA2_Fixed32.ahk

/**
 * Contains values for DirectX Video Acceleration (DXVA) video processing operations.
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ns-dxva2api-dxva2_procampvalues
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_ProcAmpValues extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Brightness value.
     * @type {DXVA2_Fixed32}
     */
    Brightness{
        get {
            if(!this.HasProp("__Brightness"))
                this.__Brightness := DXVA2_Fixed32(0, this)
            return this.__Brightness
        }
    }

    /**
     * Contrast value.
     * @type {DXVA2_Fixed32}
     */
    Contrast{
        get {
            if(!this.HasProp("__Contrast"))
                this.__Contrast := DXVA2_Fixed32(4, this)
            return this.__Contrast
        }
    }

    /**
     * Hue value.
     * @type {DXVA2_Fixed32}
     */
    Hue{
        get {
            if(!this.HasProp("__Hue"))
                this.__Hue := DXVA2_Fixed32(8, this)
            return this.__Hue
        }
    }

    /**
     * Saturation value.
     * @type {DXVA2_Fixed32}
     */
    Saturation{
        get {
            if(!this.HasProp("__Saturation"))
                this.__Saturation := DXVA2_Fixed32(12, this)
            return this.__Saturation
        }
    }
}
