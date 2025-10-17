#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KS_AMVPSIZE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSVPSIZE_PROP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(0, this)
            return this.__Property
        }
    }

    /**
     * @type {KS_AMVPSIZE}
     */
    Size{
        get {
            if(!this.HasProp("__Size"))
                this.__Size := KS_AMVPSIZE(16, this)
            return this.__Size
        }
    }
}
