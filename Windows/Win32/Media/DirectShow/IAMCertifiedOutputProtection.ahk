#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AMCOPPStatusOutput.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMCertifiedOutputProtection interface sends Certified Output Protection Protocol (COPP) messages to the graphics driver.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamcertifiedoutputprotection
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMCertifiedOutputProtection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMCertifiedOutputProtection
     * @type {Guid}
     */
    static IID => Guid("{6feded3e-0ff1-4901-a2f1-43f7012c8515}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KeyExchange", "SessionSequenceStart", "ProtectionCommand", "ProtectionStatus"]

    /**
     * 
     * @param {Pointer<Guid>} pRandom 
     * @param {Pointer<Pointer<Integer>>} VarLenCertGH 
     * @param {Pointer<Integer>} pdwLengthCertGH 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcertifiedoutputprotection-keyexchange
     */
    KeyExchange(pRandom, VarLenCertGH, pdwLengthCertGH) {
        VarLenCertGHMarshal := VarLenCertGH is VarRef ? "ptr*" : "ptr"
        pdwLengthCertGHMarshal := pdwLengthCertGH is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pRandom, VarLenCertGHMarshal, VarLenCertGH, pdwLengthCertGHMarshal, pdwLengthCertGH, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AMCOPPSignature>} pSig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcertifiedoutputprotection-sessionsequencestart
     */
    SessionSequenceStart(pSig) {
        result := ComCall(4, this, "ptr", pSig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AMCOPPCommand>} cmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcertifiedoutputprotection-protectioncommand
     */
    ProtectionCommand(cmd) {
        result := ComCall(5, this, "ptr", cmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AMCOPPStatusInput>} pStatusInput 
     * @returns {AMCOPPStatusOutput} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcertifiedoutputprotection-protectionstatus
     */
    ProtectionStatus(pStatusInput) {
        pStatusOutput := AMCOPPStatusOutput()
        result := ComCall(6, this, "ptr", pStatusInput, "ptr", pStatusOutput, "HRESULT")
        return pStatusOutput
    }
}
