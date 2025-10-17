#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\WAVEFORMATEX.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class TRUESPEECHWAVEFORMAT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {WAVEFORMATEX}
     */
    wfx{
        get {
            if(!this.HasProp("__wfx"))
                this.__wfx := WAVEFORMATEX(0, this)
            return this.__wfx
        }
    }

    /**
     * @type {Integer}
     */
    wRevision {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    nSamplesPerBlock {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Array<Byte>}
     */
    abReserved{
        get {
            if(!this.HasProp("__abReservedProxyArray"))
                this.__abReservedProxyArray := Win32FixedArray(this.ptr + 24, 28, Primitive, "char")
            return this.__abReservedProxyArray
        }
    }
}
