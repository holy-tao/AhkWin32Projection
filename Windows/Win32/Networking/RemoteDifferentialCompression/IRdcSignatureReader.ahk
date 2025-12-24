#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Reads the signatures and the parameters used to generate the signatures.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdcsignaturereader
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcSignatureReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRdcSignatureReader
     * @type {Guid}
     */
    static IID => Guid("{96236a76-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcSignatureReader
     * @type {Guid}
     */
    static CLSID => Guid("{96236a8a-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadHeader", "ReadSignatures"]

    /**
     * Reads the signature header and returns a copy of the parameters used to generate the signatures.
     * @returns {Integer} Address of a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdc_errorcode">RDC_ErrorCode</a> enumeration that will 
     *       receive any RDC-specific error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcsignaturereader-readheader
     */
    ReadHeader() {
        result := ComCall(3, this, "int*", &rdc_ErrorCode := 0, "HRESULT")
        return rdc_ErrorCode
    }

    /**
     * Reads a block of signatures from the current position.
     * @param {Pointer<RdcSignaturePointer>} rdcSignaturePointer Address of a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignaturepointer">RdcSignaturePointer</a> structure. On 
     *       input the <b>m_Size</b> member of this structure must contain the number of 
     *       <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignature">RdcSignature</a> structures in the array pointed to by the 
     *       <b>m_Data</b> member, and the <b>m_Used</b> member must be zero. On 
     *       output the <b>m_Used</b> member will contain the number of 
     *       <b>RdcSignature</b> structures in the array pointed to by the 
     *       <b>m_Data</b> member.
     * @returns {BOOL} Address of a <b>BOOL</b> that is set to <b>TRUE</b> if the end of 
     *       the signatures has been read.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcsignaturereader-readsignatures
     */
    ReadSignatures(rdcSignaturePointer) {
        result := ComCall(4, this, "ptr", rdcSignaturePointer, "int*", &endOfOutput := 0, "HRESULT")
        return endOfOutput
    }
}
