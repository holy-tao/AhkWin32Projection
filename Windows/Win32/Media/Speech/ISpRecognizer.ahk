#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpObjectToken.ahk
#Include .\ISpStreamFormat.ahk
#Include .\ISpRecoContext.ahk
#Include .\ISpProperties.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecognizer extends ISpProperties{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpRecognizer
     * @type {Guid}
     */
    static IID => Guid("{c2b5f241-daa0-4507-9e16-5a1eaa2b7a5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRecognizer", "GetRecognizer", "SetInput", "GetInputObjectToken", "GetInputStream", "CreateRecoContext", "GetRecoProfile", "SetRecoProfile", "IsSharedInstance", "GetRecoState", "SetRecoState", "GetStatus", "GetFormat", "IsUISupported", "DisplayUI", "EmulateRecognition"]

    /**
     * 
     * @param {ISpObjectToken} pRecognizer 
     * @returns {HRESULT} 
     */
    SetRecognizer(pRecognizer) {
        result := ComCall(7, this, "ptr", pRecognizer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpObjectToken} 
     */
    GetRecognizer() {
        result := ComCall(8, this, "ptr*", &ppRecognizer := 0, "HRESULT")
        return ISpObjectToken(ppRecognizer)
    }

    /**
     * 
     * @param {IUnknown} pUnkInput 
     * @param {BOOL} fAllowFormatChanges 
     * @returns {HRESULT} 
     */
    SetInput(pUnkInput, fAllowFormatChanges) {
        result := ComCall(9, this, "ptr", pUnkInput, "int", fAllowFormatChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpObjectToken} 
     */
    GetInputObjectToken() {
        result := ComCall(10, this, "ptr*", &ppToken := 0, "HRESULT")
        return ISpObjectToken(ppToken)
    }

    /**
     * 
     * @returns {ISpStreamFormat} 
     */
    GetInputStream() {
        result := ComCall(11, this, "ptr*", &ppStream := 0, "HRESULT")
        return ISpStreamFormat(ppStream)
    }

    /**
     * 
     * @returns {ISpRecoContext} 
     */
    CreateRecoContext() {
        result := ComCall(12, this, "ptr*", &ppNewCtxt := 0, "HRESULT")
        return ISpRecoContext(ppNewCtxt)
    }

    /**
     * 
     * @returns {ISpObjectToken} 
     */
    GetRecoProfile() {
        result := ComCall(13, this, "ptr*", &ppToken := 0, "HRESULT")
        return ISpObjectToken(ppToken)
    }

    /**
     * 
     * @param {ISpObjectToken} pToken 
     * @returns {HRESULT} 
     */
    SetRecoProfile(pToken) {
        result := ComCall(14, this, "ptr", pToken, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsSharedInstance() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     */
    GetRecoState(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pStateMarshal, pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NewState 
     * @returns {HRESULT} 
     */
    SetRecoState(NewState) {
        result := ComCall(17, this, "int", NewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPRECOGNIZERSTATUS>} pStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus) {
        result := ComCall(18, this, "ptr", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} WaveFormatType 
     * @param {Pointer<Guid>} pFormatId 
     * @returns {Pointer<WAVEFORMATEX>} 
     */
    GetFormat(WaveFormatType, pFormatId) {
        result := ComCall(19, this, "int", WaveFormatType, "ptr", pFormatId, "ptr*", &ppCoMemWFEX := 0, "HRESULT")
        return ppCoMemWFEX
    }

    /**
     * 
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @param {Pointer<BOOL>} pfSupported 
     * @returns {HRESULT} 
     */
    IsUISupported(pszTypeOfUI, pvExtraData, cbExtraData, pfSupported) {
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : "ptr"
        pfSupportedMarshal := pfSupported is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, "uint", cbExtraData, pfSupportedMarshal, pfSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {PWSTR} pszTitle 
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @returns {HRESULT} 
     */
    DisplayUI(hwndParent, pszTitle, pszTypeOfUI, pvExtraData, cbExtraData) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : "ptr"

        result := ComCall(21, this, "ptr", hwndParent, "ptr", pszTitle, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, "uint", cbExtraData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpPhrase} pPhrase 
     * @returns {HRESULT} 
     */
    EmulateRecognition(pPhrase) {
        result := ComCall(22, this, "ptr", pPhrase, "HRESULT")
        return result
    }
}
