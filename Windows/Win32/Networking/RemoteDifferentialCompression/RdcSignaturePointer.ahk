#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an array of RdcSignature structures.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/ns-msrdc-rdcsignaturepointer
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class RdcSignaturePointer extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignature">RdcSignature</a> structures in 
     *       array pointed to by <b>m_Data</b>.
     * @type {Integer}
     */
    m_Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * When the structure is passed to the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdcsignaturereader-readsignatures">IRdcSignatureReader::ReadSignatures</a> 
     *       method, this member should be zero. On return this member will contain the number of 
     *       <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignature">RdcSignature</a> structures that were filled.
     * @type {Integer}
     */
    m_Used {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Address of an array of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignature">RdcSignature</a> structures.
     * @type {Pointer<RdcSignature>}
     */
    m_Data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
