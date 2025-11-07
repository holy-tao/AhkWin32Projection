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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcsignaturereader-readheader
     */
    ReadHeader() {
        result := ComCall(3, this, "int*", &rdc_ErrorCode := 0, "HRESULT")
        return rdc_ErrorCode
    }

    /**
     * 
     * @param {Pointer<RdcSignaturePointer>} rdcSignaturePointer 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcsignaturereader-readsignatures
     */
    ReadSignatures(rdcSignaturePointer) {
        result := ComCall(4, this, "ptr", rdcSignaturePointer, "int*", &endOfOutput := 0, "HRESULT")
        return endOfOutput
    }
}
