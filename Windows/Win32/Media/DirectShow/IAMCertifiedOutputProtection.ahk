#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMCertifiedOutputProtection interface sends Certified Output Protection Protocol (COPP) messages to the graphics driver.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamcertifiedoutputprotection
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMCertifiedOutputProtection extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} pRandom 
     * @param {Pointer<Byte>} VarLenCertGH 
     * @param {Pointer<UInt32>} pdwLengthCertGH 
     * @returns {HRESULT} 
     */
    KeyExchange(pRandom, VarLenCertGH, pdwLengthCertGH) {
        result := ComCall(3, this, "ptr", pRandom, "char*", VarLenCertGH, "uint*", pdwLengthCertGH, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AMCOPPSignature>} pSig 
     * @returns {HRESULT} 
     */
    SessionSequenceStart(pSig) {
        result := ComCall(4, this, "ptr", pSig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AMCOPPCommand>} cmd 
     * @returns {HRESULT} 
     */
    ProtectionCommand(cmd) {
        result := ComCall(5, this, "ptr", cmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AMCOPPStatusInput>} pStatusInput 
     * @param {Pointer<AMCOPPStatusOutput>} pStatusOutput 
     * @returns {HRESULT} 
     */
    ProtectionStatus(pStatusInput, pStatusOutput) {
        result := ComCall(6, this, "ptr", pStatusInput, "ptr", pStatusOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
