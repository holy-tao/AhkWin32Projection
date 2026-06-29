#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPRECOGNIZERSTATUS.ahk" { SPRECOGNIZERSTATUS }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\ISpStreamFormat.ahk" { ISpStreamFormat }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\ISpPhrase.ahk" { ISpPhrase }
#Import ".\ISpProperties.ahk" { ISpProperties }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpObjectToken.ahk" { ISpObjectToken }
#Import ".\SPSTREAMFORMATTYPE.ahk" { SPSTREAMFORMATTYPE }
#Import ".\ISpRecoContext.ahk" { ISpRecoContext }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SPRECOSTATE.ahk" { SPRECOSTATE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpRecognizer extends ISpProperties {
    /**
     * The interface identifier for ISpRecognizer
     * @type {Guid}
     */
    static IID := Guid("{c2b5f241-daa0-4507-9e16-5a1eaa2b7a5c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpRecognizer interfaces
    */
    struct Vtbl extends ISpProperties.Vtbl {
        SetRecognizer       : IntPtr
        GetRecognizer       : IntPtr
        SetInput            : IntPtr
        GetInputObjectToken : IntPtr
        GetInputStream      : IntPtr
        CreateRecoContext   : IntPtr
        GetRecoProfile      : IntPtr
        SetRecoProfile      : IntPtr
        IsSharedInstance    : IntPtr
        GetRecoState        : IntPtr
        SetRecoState        : IntPtr
        GetStatus           : IntPtr
        GetFormat           : IntPtr
        IsUISupported       : IntPtr
        DisplayUI           : IntPtr
        EmulateRecognition  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpRecognizer.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(9, this, "ptr", pUnkInput, BOOL, fAllowFormatChanges, "HRESULT")
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
     * @param {Pointer<SPRECOSTATE>} pState 
     * @returns {HRESULT} 
     */
    GetRecoState(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pStateMarshal, pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRECOSTATE} NewState 
     * @returns {HRESULT} 
     */
    SetRecoState(NewState) {
        result := ComCall(17, this, SPRECOSTATE, NewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPRECOGNIZERSTATUS>} pStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus) {
        result := ComCall(18, this, SPRECOGNIZERSTATUS.Ptr, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTREAMFORMATTYPE} WaveFormatType 
     * @param {Pointer<Guid>} pFormatId 
     * @returns {Pointer<WAVEFORMATEX>} 
     */
    GetFormat(WaveFormatType, pFormatId) {
        result := ComCall(19, this, SPSTREAMFORMATTYPE, WaveFormatType, Guid.Ptr, pFormatId, "ptr*", &ppCoMemWFEX := 0, "HRESULT")
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
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : "ptr"

        result := ComCall(21, this, HWND, hwndParent, "ptr", pszTitle, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, "uint", cbExtraData, "HRESULT")
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

    Query(iid) {
        if (ISpRecognizer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRecognizer := CallbackCreate(GetMethod(implObj, "SetRecognizer"), flags, 2)
        this.vtbl.GetRecognizer := CallbackCreate(GetMethod(implObj, "GetRecognizer"), flags, 2)
        this.vtbl.SetInput := CallbackCreate(GetMethod(implObj, "SetInput"), flags, 3)
        this.vtbl.GetInputObjectToken := CallbackCreate(GetMethod(implObj, "GetInputObjectToken"), flags, 2)
        this.vtbl.GetInputStream := CallbackCreate(GetMethod(implObj, "GetInputStream"), flags, 2)
        this.vtbl.CreateRecoContext := CallbackCreate(GetMethod(implObj, "CreateRecoContext"), flags, 2)
        this.vtbl.GetRecoProfile := CallbackCreate(GetMethod(implObj, "GetRecoProfile"), flags, 2)
        this.vtbl.SetRecoProfile := CallbackCreate(GetMethod(implObj, "SetRecoProfile"), flags, 2)
        this.vtbl.IsSharedInstance := CallbackCreate(GetMethod(implObj, "IsSharedInstance"), flags, 1)
        this.vtbl.GetRecoState := CallbackCreate(GetMethod(implObj, "GetRecoState"), flags, 2)
        this.vtbl.SetRecoState := CallbackCreate(GetMethod(implObj, "SetRecoState"), flags, 2)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 4)
        this.vtbl.IsUISupported := CallbackCreate(GetMethod(implObj, "IsUISupported"), flags, 5)
        this.vtbl.DisplayUI := CallbackCreate(GetMethod(implObj, "DisplayUI"), flags, 6)
        this.vtbl.EmulateRecognition := CallbackCreate(GetMethod(implObj, "EmulateRecognition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRecognizer)
        CallbackFree(this.vtbl.GetRecognizer)
        CallbackFree(this.vtbl.SetInput)
        CallbackFree(this.vtbl.GetInputObjectToken)
        CallbackFree(this.vtbl.GetInputStream)
        CallbackFree(this.vtbl.CreateRecoContext)
        CallbackFree(this.vtbl.GetRecoProfile)
        CallbackFree(this.vtbl.SetRecoProfile)
        CallbackFree(this.vtbl.IsSharedInstance)
        CallbackFree(this.vtbl.GetRecoState)
        CallbackFree(this.vtbl.SetRecoState)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.GetFormat)
        CallbackFree(this.vtbl.IsUISupported)
        CallbackFree(this.vtbl.DisplayUI)
        CallbackFree(this.vtbl.EmulateRecognition)
    }
}
