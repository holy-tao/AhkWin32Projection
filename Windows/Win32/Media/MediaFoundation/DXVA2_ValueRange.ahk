#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVA2_Fixed32.ahk

/**
 * Defines the range of supported values for a DirectX Video Acceleration (DXVA) operation.
 * @remarks
 * All values in this structure are specified as <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_fixed32">DXVA2_Fixed32</a> structures.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_valuerange
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_ValueRange extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Minimum supported value.
     * @type {DXVA2_Fixed32}
     */
    MinValue{
        get {
            if(!this.HasProp("__MinValue"))
                this.__MinValue := DXVA2_Fixed32(this.ptr + 0)
            return this.__MinValue
        }
    }

    /**
     * Maximum supported value.
     * @type {DXVA2_Fixed32}
     */
    MaxValue{
        get {
            if(!this.HasProp("__MaxValue"))
                this.__MaxValue := DXVA2_Fixed32(this.ptr + 4)
            return this.__MaxValue
        }
    }

    /**
     * Default value.
     * @type {DXVA2_Fixed32}
     */
    DefaultValue{
        get {
            if(!this.HasProp("__DefaultValue"))
                this.__DefaultValue := DXVA2_Fixed32(this.ptr + 8)
            return this.__DefaultValue
        }
    }

    /**
     * Minimum increment between values.
     * @type {DXVA2_Fixed32}
     */
    StepSize{
        get {
            if(!this.HasProp("__StepSize"))
                this.__StepSize := DXVA2_Fixed32(this.ptr + 12)
            return this.__StepSize
        }
    }
}
