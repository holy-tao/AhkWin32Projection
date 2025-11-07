#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DVINFO structure describes the format of a digital video (DV) stream.
 * @remarks
 * 
 * The AAUX and VAUX packs are defined in IEC 61834-4.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-dvinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Specifies the audio auxiliary (AAUX) source pack for the first audio block.
     * @type {Integer}
     */
    dwDVAAuxSrc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the AAUX source control Pack for the first audio block.
     * @type {Integer}
     */
    dwDVAAuxCtl {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the AAUX source pack for the second audio block.
     * @type {Integer}
     */
    dwDVAAuxSrc1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the AAUX source control pack for the second audio block.
     * @type {Integer}
     */
    dwDVAAuxCtl1 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the video auxiliary (VAUX) source pack.
     * @type {Integer}
     */
    dwDVVAuxSrc {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the VAUX source control pack.
     * @type {Integer}
     */
    dwDVVAuxCtl {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved. Set this array to zero.
     * @type {Array<UInt32>}
     */
    dwDVReserved{
        get {
            if(!this.HasProp("__dwDVReservedProxyArray"))
                this.__dwDVReservedProxyArray := Win32FixedArray(this.ptr + 24, 2, Primitive, "uint")
            return this.__dwDVReservedProxyArray
        }
    }
}
