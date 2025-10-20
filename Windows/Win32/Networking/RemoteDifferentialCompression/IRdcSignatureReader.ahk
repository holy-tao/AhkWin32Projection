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
     * 
     * @param {Pointer<Int32>} rdc_ErrorCode 
     * @returns {HRESULT} 
     */
    ReadHeader(rdc_ErrorCode) {
        result := ComCall(3, this, "int*", rdc_ErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RdcSignaturePointer>} rdcSignaturePointer 
     * @param {Pointer<BOOL>} endOfOutput 
     * @returns {HRESULT} 
     */
    ReadSignatures(rdcSignaturePointer, endOfOutput) {
        result := ComCall(4, this, "ptr", rdcSignaturePointer, "ptr", endOfOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
