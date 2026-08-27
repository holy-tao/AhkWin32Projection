#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpEventSource.ahk" { ISpEventSource }
#Import ".\ISpObjectToken.ahk" { ISpObjectToken }
#Import ".\ISpStreamFormat.ahk" { ISpStreamFormat }
#Import ".\SPEVENTENUM.ahk" { SPEVENTENUM }
#Import ".\SPVOICESTATUS.ahk" { SPVOICESTATUS }
#Import ".\SPVPRIORITY.ahk" { SPVPRIORITY }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpVoice extends ISpEventSource {
    /**
     * The interface identifier for ISpVoice
     * @type {Guid}
     */
    static IID := Guid("{6c44df74-72b9-4992-a1ec-ef996e0422d4}")

    /**
     * The class identifier for SpVoice
     * @type {Guid}
     */
    static CLSID := Guid("{96749377-3391-11d2-9ee3-00c04f797396}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpVoice interfaces
    */
    struct Vtbl extends ISpEventSource.Vtbl {
        SetOutput            : IntPtr
        GetOutputObjectToken : IntPtr
        GetOutputStream      : IntPtr
        Pause                : IntPtr
        Resume               : IntPtr
        SetVoice             : IntPtr
        GetVoice             : IntPtr
        Speak                : IntPtr
        SpeakStream          : IntPtr
        GetStatus            : IntPtr
        Skip                 : IntPtr
        SetPriority          : IntPtr
        GetPriority          : IntPtr
        SetAlertBoundary     : IntPtr
        GetAlertBoundary     : IntPtr
        SetRate              : IntPtr
        GetRate              : IntPtr
        SetVolume            : IntPtr
        GetVolume            : IntPtr
        WaitUntilDone        : IntPtr
        SetSyncSpeakTimeout  : IntPtr
        GetSyncSpeakTimeout  : IntPtr
        SpeakCompleteEvent   : IntPtr
        IsUISupported        : IntPtr
        DisplayUI            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpVoice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @param {IUnknown} pUnkOutput 
     * @param {BOOL} fAllowFormatChanges 
     * @returns {HRESULT} 
     */
    SetOutput(pUnkOutput, fAllowFormatChanges) {
        result := ComCall(13, this, "ptr", pUnkOutput, BOOL, fAllowFormatChanges, "HRESULT")
        return result
    }

    /**
     * @returns {ISpObjectToken} 
     */
    GetOutputObjectToken() {
        result := ComCall(14, this, "ptr*", &ppObjectToken := 0, "HRESULT")
        return ISpObjectToken(ppObjectToken)
    }

    /**
     * @returns {ISpStreamFormat} 
     */
    GetOutputStream() {
        result := ComCall(15, this, "ptr*", &ppStream := 0, "HRESULT")
        return ISpStreamFormat(ppStream)
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * @param {ISpObjectToken} pToken 
     * @returns {HRESULT} 
     */
    SetVoice(pToken) {
        result := ComCall(18, this, "ptr", pToken, "HRESULT")
        return result
    }

    /**
     * @returns {ISpObjectToken} 
     */
    GetVoice() {
        result := ComCall(19, this, "ptr*", &ppToken := 0, "HRESULT")
        return ISpObjectToken(ppToken)
    }

    /**
     * @param {PWSTR} pwcs 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Speak(pwcs, dwFlags) {
        pwcs := pwcs is String ? StrPtr(pwcs) : pwcs

        pwcsMarshal := pwcs == 0 ? IntPtr : PWSTR

        result := ComCall(20, this, pwcsMarshal, pwcs, UInt32, dwFlags, "uint*", &pulStreamNumber := 0, "HRESULT")
        return pulStreamNumber
    }

    /**
     * @param {IStream} pStream 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    SpeakStream(pStream, dwFlags) {
        result := ComCall(21, this, "ptr", pStream, UInt32, dwFlags, "uint*", &pulStreamNumber := 0, "HRESULT")
        return pulStreamNumber
    }

    /**
     * @param {Pointer<SPVOICESTATUS>} pStatus 
     * @returns {PWSTR} 
     */
    GetStatus(pStatus) {
        result := ComCall(22, this, SPVOICESTATUS.Ptr, pStatus, PWSTR.Ptr, &ppszLastBookmark := 0, "HRESULT")
        return ppszLastBookmark
    }

    /**
     * @param {PWSTR} pItemType 
     * @param {Integer} lNumItems 
     * @param {Pointer<Integer>} pulNumSkipped 
     * @returns {HRESULT} 
     */
    Skip(pItemType, lNumItems, pulNumSkipped) {
        pItemType := pItemType is String ? StrPtr(pItemType) : pItemType

        pulNumSkippedMarshal := pulNumSkipped is VarRef ? "uint*" : IntPtr

        result := ComCall(23, this, "ptr", pItemType, Int32, lNumItems, pulNumSkippedMarshal, pulNumSkipped, "HRESULT")
        return result
    }

    /**
     * @param {SPVPRIORITY} ePriority 
     * @returns {HRESULT} 
     */
    SetPriority(ePriority) {
        result := ComCall(24, this, SPVPRIORITY, ePriority, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<SPVPRIORITY>} pePriority 
     * @returns {HRESULT} 
     */
    GetPriority(pePriority) {
        pePriorityMarshal := pePriority is VarRef ? "int*" : IntPtr

        result := ComCall(25, this, pePriorityMarshal, pePriority, "HRESULT")
        return result
    }

    /**
     * @param {SPEVENTENUM} eBoundary 
     * @returns {HRESULT} 
     */
    SetAlertBoundary(eBoundary) {
        result := ComCall(26, this, SPEVENTENUM, eBoundary, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<SPEVENTENUM>} peBoundary 
     * @returns {HRESULT} 
     */
    GetAlertBoundary(peBoundary) {
        peBoundaryMarshal := peBoundary is VarRef ? "int*" : IntPtr

        result := ComCall(27, this, peBoundaryMarshal, peBoundary, "HRESULT")
        return result
    }

    /**
     * @param {Integer} RateAdjust 
     * @returns {HRESULT} 
     */
    SetRate(RateAdjust) {
        result := ComCall(28, this, Int32, RateAdjust, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Integer>} pRateAdjust 
     * @returns {HRESULT} 
     */
    GetRate(pRateAdjust) {
        pRateAdjustMarshal := pRateAdjust is VarRef ? "int*" : IntPtr

        result := ComCall(29, this, pRateAdjustMarshal, pRateAdjust, "HRESULT")
        return result
    }

    /**
     * @param {Integer} usVolume 
     * @returns {HRESULT} 
     */
    SetVolume(usVolume) {
        result := ComCall(30, this, UInt16, usVolume, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Integer>} pusVolume 
     * @returns {HRESULT} 
     */
    GetVolume(pusVolume) {
        pusVolumeMarshal := pusVolume is VarRef ? "ushort*" : IntPtr

        result := ComCall(31, this, pusVolumeMarshal, pusVolume, "HRESULT")
        return result
    }

    /**
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    WaitUntilDone(msTimeout) {
        result := ComCall(32, this, UInt32, msTimeout, "HRESULT")
        return result
    }

    /**
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    SetSyncSpeakTimeout(msTimeout) {
        result := ComCall(33, this, UInt32, msTimeout, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Integer>} pmsTimeout 
     * @returns {HRESULT} 
     */
    GetSyncSpeakTimeout(pmsTimeout) {
        pmsTimeoutMarshal := pmsTimeout is VarRef ? "uint*" : IntPtr

        result := ComCall(34, this, pmsTimeoutMarshal, pmsTimeout, "HRESULT")
        return result
    }

    /**
     * @returns {HANDLE} 
     */
    SpeakCompleteEvent() {
        result := ComCall(35, this, HANDLE.Owned)
        return result
    }

    /**
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @param {Pointer<BOOL>} pfSupported 
     * @returns {HRESULT} 
     */
    IsUISupported(pszTypeOfUI, pvExtraData, cbExtraData, pfSupported) {
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : IntPtr
        pfSupportedMarshal := pfSupported is VarRef ? "int*" : IntPtr

        result := ComCall(36, this, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, UInt32, cbExtraData, pfSupportedMarshal, pfSupported, "HRESULT")
        return result
    }

    /**
     * @param {HWND} hwndParent 
     * @param {PWSTR} pszTitle 
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @returns {HRESULT} 
     */
    DisplayUI(hwndParent, pszTitle, pszTypeOfUI, pvExtraData, cbExtraData) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : IntPtr

        result := ComCall(37, this, HWND, hwndParent, "ptr", pszTitle, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, UInt32, cbExtraData, "HRESULT")
        return result
    }

    _Query(iid) {
        if (ISpVoice.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOutput := CallbackCreate(ObjBindMethod(implObj, "SetOutput"), flags, 3)
        this.vtbl.GetOutputObjectToken := CallbackCreate(ObjBindMethod(implObj, "GetOutputObjectToken"), flags, 2)
        this.vtbl.GetOutputStream := CallbackCreate(ObjBindMethod(implObj, "GetOutputStream"), flags, 2)
        this.vtbl.Pause := CallbackCreate(ObjBindMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Resume := CallbackCreate(ObjBindMethod(implObj, "Resume"), flags, 1)
        this.vtbl.SetVoice := CallbackCreate(ObjBindMethod(implObj, "SetVoice"), flags, 2)
        this.vtbl.GetVoice := CallbackCreate(ObjBindMethod(implObj, "GetVoice"), flags, 2)
        this.vtbl.Speak := CallbackCreate(ObjBindMethod(implObj, "Speak"), flags, 4)
        this.vtbl.SpeakStream := CallbackCreate(ObjBindMethod(implObj, "SpeakStream"), flags, 4)
        this.vtbl.GetStatus := CallbackCreate(ObjBindMethod(implObj, "GetStatus"), flags, 3)
        this.vtbl.Skip := CallbackCreate(ObjBindMethod(implObj, "Skip"), flags, 4)
        this.vtbl.SetPriority := CallbackCreate(ObjBindMethod(implObj, "SetPriority"), flags, 2)
        this.vtbl.GetPriority := CallbackCreate(ObjBindMethod(implObj, "GetPriority"), flags, 2)
        this.vtbl.SetAlertBoundary := CallbackCreate(ObjBindMethod(implObj, "SetAlertBoundary"), flags, 2)
        this.vtbl.GetAlertBoundary := CallbackCreate(ObjBindMethod(implObj, "GetAlertBoundary"), flags, 2)
        this.vtbl.SetRate := CallbackCreate(ObjBindMethod(implObj, "SetRate"), flags, 2)
        this.vtbl.GetRate := CallbackCreate(ObjBindMethod(implObj, "GetRate"), flags, 2)
        this.vtbl.SetVolume := CallbackCreate(ObjBindMethod(implObj, "SetVolume"), flags, 2)
        this.vtbl.GetVolume := CallbackCreate(ObjBindMethod(implObj, "GetVolume"), flags, 2)
        this.vtbl.WaitUntilDone := CallbackCreate(ObjBindMethod(implObj, "WaitUntilDone"), flags, 2)
        this.vtbl.SetSyncSpeakTimeout := CallbackCreate(ObjBindMethod(implObj, "SetSyncSpeakTimeout"), flags, 2)
        this.vtbl.GetSyncSpeakTimeout := CallbackCreate(ObjBindMethod(implObj, "GetSyncSpeakTimeout"), flags, 2)
        this.vtbl.SpeakCompleteEvent := CallbackCreate(ObjBindMethod(implObj, "SpeakCompleteEvent"), flags, 1)
        this.vtbl.IsUISupported := CallbackCreate(ObjBindMethod(implObj, "IsUISupported"), flags, 5)
        this.vtbl.DisplayUI := CallbackCreate(ObjBindMethod(implObj, "DisplayUI"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOutput)
        CallbackFree(this.vtbl.GetOutputObjectToken)
        CallbackFree(this.vtbl.GetOutputStream)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.SetVoice)
        CallbackFree(this.vtbl.GetVoice)
        CallbackFree(this.vtbl.Speak)
        CallbackFree(this.vtbl.SpeakStream)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.SetPriority)
        CallbackFree(this.vtbl.GetPriority)
        CallbackFree(this.vtbl.SetAlertBoundary)
        CallbackFree(this.vtbl.GetAlertBoundary)
        CallbackFree(this.vtbl.SetRate)
        CallbackFree(this.vtbl.GetRate)
        CallbackFree(this.vtbl.SetVolume)
        CallbackFree(this.vtbl.GetVolume)
        CallbackFree(this.vtbl.WaitUntilDone)
        CallbackFree(this.vtbl.SetSyncSpeakTimeout)
        CallbackFree(this.vtbl.GetSyncSpeakTimeout)
        CallbackFree(this.vtbl.SpeakCompleteEvent)
        CallbackFree(this.vtbl.IsUISupported)
        CallbackFree(this.vtbl.DisplayUI)
    }
}
