#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\ISpEventSource.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpVoice extends ISpEventSource{
    /**
     * The interface identifier for ISpVoice
     * @type {Guid}
     */
    static IID => Guid("{6c44df74-72b9-4992-a1ec-ef996e0422d4}")

    /**
     * The class identifier for SpVoice
     * @type {Guid}
     */
    static CLSID => Guid("{96749377-3391-11d2-9ee3-00c04f797396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOutput 
     * @param {BOOL} fAllowFormatChanges 
     * @returns {HRESULT} 
     */
    SetOutput(pUnkOutput, fAllowFormatChanges) {
        result := ComCall(13, this, "ptr", pUnkOutput, "int", fAllowFormatChanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpObjectToken>} ppObjectToken 
     * @returns {HRESULT} 
     */
    GetOutputObjectToken(ppObjectToken) {
        result := ComCall(14, this, "ptr", ppObjectToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpStreamFormat>} ppStream 
     * @returns {HRESULT} 
     */
    GetOutputStream(ppStream) {
        result := ComCall(15, this, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpObjectToken>} pToken 
     * @returns {HRESULT} 
     */
    SetVoice(pToken) {
        result := ComCall(18, this, "ptr", pToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpObjectToken>} ppToken 
     * @returns {HRESULT} 
     */
    GetVoice(ppToken) {
        result := ComCall(19, this, "ptr", ppToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwcs 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pulStreamNumber 
     * @returns {HRESULT} 
     */
    Speak(pwcs, dwFlags, pulStreamNumber) {
        pwcs := pwcs is String ? StrPtr(pwcs) : pwcs

        result := ComCall(20, this, "ptr", pwcs, "uint", dwFlags, "uint*", pulStreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pulStreamNumber 
     * @returns {HRESULT} 
     */
    SpeakStream(pStream, dwFlags, pulStreamNumber) {
        result := ComCall(21, this, "ptr", pStream, "uint", dwFlags, "uint*", pulStreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPVOICESTATUS>} pStatus 
     * @param {Pointer<PWSTR>} ppszLastBookmark 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus, ppszLastBookmark) {
        result := ComCall(22, this, "ptr", pStatus, "ptr", ppszLastBookmark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pItemType 
     * @param {Integer} lNumItems 
     * @param {Pointer<UInt32>} pulNumSkipped 
     * @returns {HRESULT} 
     */
    Skip(pItemType, lNumItems, pulNumSkipped) {
        pItemType := pItemType is String ? StrPtr(pItemType) : pItemType

        result := ComCall(23, this, "ptr", pItemType, "int", lNumItems, "uint*", pulNumSkipped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ePriority 
     * @returns {HRESULT} 
     */
    SetPriority(ePriority) {
        result := ComCall(24, this, "int", ePriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pePriority 
     * @returns {HRESULT} 
     */
    GetPriority(pePriority) {
        result := ComCall(25, this, "int*", pePriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eBoundary 
     * @returns {HRESULT} 
     */
    SetAlertBoundary(eBoundary) {
        result := ComCall(26, this, "int", eBoundary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peBoundary 
     * @returns {HRESULT} 
     */
    GetAlertBoundary(peBoundary) {
        result := ComCall(27, this, "int*", peBoundary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RateAdjust 
     * @returns {HRESULT} 
     */
    SetRate(RateAdjust) {
        result := ComCall(28, this, "int", RateAdjust, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRateAdjust 
     * @returns {HRESULT} 
     */
    GetRate(pRateAdjust) {
        result := ComCall(29, this, "int*", pRateAdjust, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} usVolume 
     * @returns {HRESULT} 
     */
    SetVolume(usVolume) {
        result := ComCall(30, this, "ushort", usVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pusVolume 
     * @returns {HRESULT} 
     */
    GetVolume(pusVolume) {
        result := ComCall(31, this, "ushort*", pusVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    WaitUntilDone(msTimeout) {
        result := ComCall(32, this, "uint", msTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    SetSyncSpeakTimeout(msTimeout) {
        result := ComCall(33, this, "uint", msTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pmsTimeout 
     * @returns {HRESULT} 
     */
    GetSyncSpeakTimeout(pmsTimeout) {
        result := ComCall(34, this, "uint*", pmsTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    SpeakCompleteEvent() {
        result := ComCall(35, this, "ptr")
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

        result := ComCall(36, this, "ptr", pszTypeOfUI, "ptr", pvExtraData, "uint", cbExtraData, "ptr", pfSupported, "int")
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

        result := ComCall(37, this, "ptr", hwndParent, "ptr", pszTitle, "ptr", pszTypeOfUI, "ptr", pvExtraData, "uint", cbExtraData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
