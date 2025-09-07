#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_COPPSignature extends Win32Struct
{
    static sizeof => 256

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Signature{
        get {
            if(!this.HasProp("__SignatureProxyArray"))
                this.__SignatureProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__SignatureProxyArray
        }
    }
}
