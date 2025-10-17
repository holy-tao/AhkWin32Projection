#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVA2_Fixed32.ahk

/**
 * Contains parameters for a DirectX Video Acceleration (DXVA) image filter.
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ns-dxva2api-dxva2_filtervalues
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_FilterValues extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Filter level.
     * @type {DXVA2_Fixed32}
     */
    Level{
        get {
            if(!this.HasProp("__Level"))
                this.__Level := DXVA2_Fixed32(0, this)
            return this.__Level
        }
    }

    /**
     * Filter threshold.
     * @type {DXVA2_Fixed32}
     */
    Threshold{
        get {
            if(!this.HasProp("__Threshold"))
                this.__Threshold := DXVA2_Fixed32(4, this)
            return this.__Threshold
        }
    }

    /**
     * Filter radius.
     * @type {DXVA2_Fixed32}
     */
    Radius{
        get {
            if(!this.HasProp("__Radius"))
                this.__Radius := DXVA2_Fixed32(8, this)
            return this.__Radius
        }
    }
}
