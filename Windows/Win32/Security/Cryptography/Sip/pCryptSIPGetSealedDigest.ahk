#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class pCryptSIPGetSealedDigest extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<SIP_SUBJECTINFO>} pSubjectInfo 
     * @param {Pointer<Integer>} pSig 
     * @param {Integer} dwSig 
     * @param {Pointer<Integer>} pbDigest 
     * @param {Pointer<Integer>} pcbDigest 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pSubjectInfo, pSig, dwSig, pbDigest, pcbDigest) {
        pSigMarshal := pSig is VarRef ? "char*" : "ptr"
        pbDigestMarshal := pbDigest is VarRef ? "char*" : "ptr"
        pcbDigestMarshal := pcbDigest is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pSubjectInfo, pSigMarshal, pSig, "uint", dwSig, pbDigestMarshal, pbDigest, pcbDigestMarshal, pcbDigest, "int")
        return result
    }
}
