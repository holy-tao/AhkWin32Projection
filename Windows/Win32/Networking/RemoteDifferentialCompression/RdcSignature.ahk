#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a single signature and the length of the chunk used to generate it.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignature
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class RdcSignature extends Win32Struct
{
    static sizeof => 18

    static packingSize => 2

    /**
     * Signature of a chunk of data.
     * @type {Array<Byte>}
     */
    m_Signature{
        get {
            if(!this.HasProp("__m_SignatureProxyArray"))
                this.__m_SignatureProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__m_SignatureProxyArray
        }
    }

    /**
     * Length of the chunk represented by this signature.
     * @type {Integer}
     */
    m_BlockLength {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
