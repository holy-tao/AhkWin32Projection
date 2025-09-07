#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AMCOPPSignature structure contains the signature needed for the IAMCertifiedOutputProtection::SessionSequenceStart method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-amcoppsignature
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMCOPPSignature extends Win32Struct
{
    static sizeof => 256

    static packingSize => 1

    /**
     * Buffer that contains the signature. For more information, see the Remarks section for the <b>SessionSequenceStart</b> method.
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
