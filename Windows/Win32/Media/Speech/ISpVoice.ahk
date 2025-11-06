#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpObjectToken.ahk
#Include .\ISpStreamFormat.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\ISpEventSource.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpVoice extends ISpEventSource{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutput", "GetOutputObjectToken", "GetOutputStream", "Pause", "Resume", "SetVoice", "GetVoice", "Speak", "SpeakStream", "GetStatus", "Skip", "SetPriority", "GetPriority", "SetAlertBoundary", "GetAlertBoundary", "SetRate", "GetRate", "SetVolume", "GetVolume", "WaitUntilDone", "SetSyncSpeakTimeout", "GetSyncSpeakTimeout", "SpeakCompleteEvent", "IsUISupported", "DisplayUI"]

    /**
     * 
     * @param {IUnknown} pUnkOutput 
     * @param {BOOL} fAllowFormatChanges 
     * @returns {HRESULT} 
     */
    SetOutput(pUnkOutput, fAllowFormatChanges) {
        result := ComCall(13, this, "ptr", pUnkOutput, "int", fAllowFormatChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpObjectToken} 
     */
    GetOutputObjectToken() {
        result := ComCall(14, this, "ptr*", &ppObjectToken := 0, "HRESULT")
        return ISpObjectToken(ppObjectToken)
    }

    /**
     * 
     * @returns {ISpStreamFormat} 
     */
    GetOutputStream() {
        result := ComCall(15, this, "ptr*", &ppStream := 0, "HRESULT")
        return ISpStreamFormat(ppStream)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpObjectToken} pToken 
     * @returns {HRESULT} 
     */
    SetVoice(pToken) {
        result := ComCall(18, this, "ptr", pToken, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpObjectToken} 
     */
    GetVoice() {
        result := ComCall(19, this, "ptr*", &ppToken := 0, "HRESULT")
        return ISpObjectToken(ppToken)
    }

    /**
     * 
     * @param {PWSTR} pwcs 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Speak(pwcs, dwFlags) {
        pwcs := pwcs is String ? StrPtr(pwcs) : pwcs

        result := ComCall(20, this, "ptr", pwcs, "uint", dwFlags, "uint*", &pulStreamNumber := 0, "HRESULT")
        return pulStreamNumber
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    SpeakStream(pStream, dwFlags) {
        result := ComCall(21, this, "ptr", pStream, "uint", dwFlags, "uint*", &pulStreamNumber := 0, "HRESULT")
        return pulStreamNumber
    }

    /**
     * 
     * @param {Pointer<SPVOICESTATUS>} pStatus 
     * @returns {PWSTR} 
     */
    GetStatus(pStatus) {
        result := ComCall(22, this, "ptr", pStatus, "ptr*", &ppszLastBookmark := 0, "HRESULT")
        return ppszLastBookmark
    }

    /**
     * 
     * @param {PWSTR} pItemType 
     * @param {Integer} lNumItems 
     * @param {Pointer<Integer>} pulNumSkipped 
     * @returns {HRESULT} 
     */
    Skip(pItemType, lNumItems, pulNumSkipped) {
        pItemType := pItemType is String ? StrPtr(pItemType) : pItemType

        pulNumSkippedMarshal := pulNumSkipped is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "ptr", pItemType, "int", lNumItems, pulNumSkippedMarshal, pulNumSkipped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ePriority 
     * @returns {HRESULT} 
     */
    SetPriority(ePriority) {
        result := ComCall(24, this, "int", ePriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pePriority 
     * @returns {HRESULT} 
     */
    GetPriority(pePriority) {
        pePriorityMarshal := pePriority is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pePriorityMarshal, pePriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eBoundary 
     * @returns {HRESULT} 
     */
    SetAlertBoundary(eBoundary) {
        result := ComCall(26, this, "int", eBoundary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peBoundary 
     * @returns {HRESULT} 
     */
    GetAlertBoundary(peBoundary) {
        peBoundaryMarshal := peBoundary is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, peBoundaryMarshal, peBoundary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RateAdjust 
     * @returns {HRESULT} 
     */
    SetRate(RateAdjust) {
        result := ComCall(28, this, "int", RateAdjust, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRateAdjust 
     * @returns {HRESULT} 
     */
    GetRate(pRateAdjust) {
        pRateAdjustMarshal := pRateAdjust is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pRateAdjustMarshal, pRateAdjust, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} usVolume 
     * @returns {HRESULT} 
     */
    SetVolume(usVolume) {
        result := ComCall(30, this, "ushort", usVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pusVolume 
     * @returns {HRESULT} 
     */
    GetVolume(pusVolume) {
        pusVolumeMarshal := pusVolume is VarRef ? "ushort*" : "ptr"

        result := ComCall(31, this, pusVolumeMarshal, pusVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    WaitUntilDone(msTimeout) {
        result := ComCall(32, this, "uint", msTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    SetSyncSpeakTimeout(msTimeout) {
        result := ComCall(33, this, "uint", msTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmsTimeout 
     * @returns {HRESULT} 
     */
    GetSyncSpeakTimeout(pmsTimeout) {
        pmsTimeoutMarshal := pmsTimeout is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, pmsTimeoutMarshal, pmsTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    SpeakCompleteEvent() {
        result := ComCall(35, this, "ptr")
        return HANDLE({Value: result}, True)
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

        result := ComCall(36, this, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, "uint", cbExtraData, pfSupportedMarshal, pfSupported, "HRESULT")
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

        result := ComCall(37, this, "ptr", hwndParent, "ptr", pszTitle, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, "uint", cbExtraData, "HRESULT")
        return result
    }
}
