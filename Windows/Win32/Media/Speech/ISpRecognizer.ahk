#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpProperties.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecognizer extends ISpProperties{
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
     * 
     * @param {Pointer<ISpObjectToken>} pRecognizer 
     * @returns {HRESULT} 
     */
    SetRecognizer(pRecognizer) {
        result := ComCall(7, this, "ptr", pRecognizer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpObjectToken>} ppRecognizer 
     * @returns {HRESULT} 
     */
    GetRecognizer(ppRecognizer) {
        result := ComCall(8, this, "ptr", ppRecognizer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkInput 
     * @param {BOOL} fAllowFormatChanges 
     * @returns {HRESULT} 
     */
    SetInput(pUnkInput, fAllowFormatChanges) {
        result := ComCall(9, this, "ptr", pUnkInput, "int", fAllowFormatChanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpObjectToken>} ppToken 
     * @returns {HRESULT} 
     */
    GetInputObjectToken(ppToken) {
        result := ComCall(10, this, "ptr", ppToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpStreamFormat>} ppStream 
     * @returns {HRESULT} 
     */
    GetInputStream(ppStream) {
        result := ComCall(11, this, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpRecoContext>} ppNewCtxt 
     * @returns {HRESULT} 
     */
    CreateRecoContext(ppNewCtxt) {
        result := ComCall(12, this, "ptr", ppNewCtxt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpObjectToken>} ppToken 
     * @returns {HRESULT} 
     */
    GetRecoProfile(ppToken) {
        result := ComCall(13, this, "ptr", ppToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpObjectToken>} pToken 
     * @returns {HRESULT} 
     */
    SetRecoProfile(pToken) {
        result := ComCall(14, this, "ptr", pToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsSharedInstance() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    GetRecoState(pState) {
        result := ComCall(16, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewState 
     * @returns {HRESULT} 
     */
    SetRecoState(NewState) {
        result := ComCall(17, this, "int", NewState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPRECOGNIZERSTATUS>} pStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus) {
        result := ComCall(18, this, "ptr", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} WaveFormatType 
     * @param {Pointer<Guid>} pFormatId 
     * @param {Pointer<WAVEFORMATEX>} ppCoMemWFEX 
     * @returns {HRESULT} 
     */
    GetFormat(WaveFormatType, pFormatId, ppCoMemWFEX) {
        result := ComCall(19, this, "int", WaveFormatType, "ptr", pFormatId, "ptr", ppCoMemWFEX, "int")
        if(result != 0)
            throw OSError(result)

        return result
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

        result := ComCall(20, this, "ptr", pszTypeOfUI, "ptr", pvExtraData, "uint", cbExtraData, "ptr", pfSupported, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(21, this, "ptr", hwndParent, "ptr", pszTitle, "ptr", pszTypeOfUI, "ptr", pvExtraData, "uint", cbExtraData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpPhrase>} pPhrase 
     * @returns {HRESULT} 
     */
    EmulateRecognition(pPhrase) {
        result := ComCall(22, this, "ptr", pPhrase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
