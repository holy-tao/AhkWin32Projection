#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\VBICODECFILTERING_SCANLINES.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VBICODECFILTERING_SCANLINES_S extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {VBICODECFILTERING_SCANLINES}
     */
    Scanlines{
        get {
            if(!this.HasProp("__Scanlines"))
                this.__Scanlines := VBICODECFILTERING_SCANLINES(this.ptr + 16)
            return this.__Scanlines
        }
    }
}
