#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFullScreenVideo extends IUnknown {
    /**
     * The interface identifier for IFullScreenVideo
     * @type {Guid}
     */
    static IID := Guid("{dd1d7110-7836-11cf-bf47-00aa0055595a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFullScreenVideo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CountModes         : IntPtr
        GetModeInfo        : IntPtr
        GetCurrentMode     : IntPtr
        IsModeAvailable    : IntPtr
        IsModeEnabled      : IntPtr
        SetEnabled         : IntPtr
        GetClipFactor      : IntPtr
        SetClipFactor      : IntPtr
        SetMessageDrain    : IntPtr
        GetMessageDrain    : IntPtr
        SetMonitor         : IntPtr
        GetMonitor         : IntPtr
        HideOnDeactivate   : IntPtr
        IsHideOnDeactivate : IntPtr
        SetCaption         : IntPtr
        GetCaption         : IntPtr
        SetDefault         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFullScreenVideo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    CountModes() {
        result := ComCall(3, this, "int*", &pModes := 0, "HRESULT")
        return pModes
    }

    /**
     * 
     * @param {Integer} _Mode 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @param {Pointer<Integer>} pDepth 
     * @returns {HRESULT} 
     */
    GetModeInfo(_Mode, pWidth, pHeight, pDepth) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"
        pDepthMarshal := pDepth is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", _Mode, pWidthMarshal, pWidth, pHeightMarshal, pHeight, pDepthMarshal, pDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentMode() {
        result := ComCall(5, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * 
     * @param {Integer} _Mode 
     * @returns {HRESULT} 
     */
    IsModeAvailable(_Mode) {
        result := ComCall(6, this, "int", _Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Mode 
     * @returns {HRESULT} 
     */
    IsModeEnabled(_Mode) {
        result := ComCall(7, this, "int", _Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Mode 
     * @param {Integer} bEnabled 
     * @returns {HRESULT} 
     */
    SetEnabled(_Mode, bEnabled) {
        result := ComCall(8, this, "int", _Mode, "int", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetClipFactor() {
        result := ComCall(9, this, "int*", &pClipFactor := 0, "HRESULT")
        return pClipFactor
    }

    /**
     * 
     * @param {Integer} ClipFactor 
     * @returns {HRESULT} 
     */
    SetClipFactor(ClipFactor) {
        result := ComCall(10, this, "int", ClipFactor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    SetMessageDrain(_hwnd) {
        result := ComCall(11, this, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HWND} 
     */
    GetMessageDrain() {
        _hwnd := HWND()
        result := ComCall(12, this, HWND.Ptr, _hwnd, "HRESULT")
        return _hwnd
    }

    /**
     * 
     * @param {Integer} _Monitor 
     * @returns {HRESULT} 
     */
    SetMonitor(_Monitor) {
        result := ComCall(13, this, "int", _Monitor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMonitor() {
        result := ComCall(14, this, "int*", &_Monitor := 0, "HRESULT")
        return _Monitor
    }

    /**
     * 
     * @param {Integer} Hide 
     * @returns {HRESULT} 
     */
    HideOnDeactivate(Hide) {
        result := ComCall(15, this, "int", Hide, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsHideOnDeactivate() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strCaption 
     * @returns {HRESULT} 
     */
    SetCaption(strCaption) {
        strCaption := strCaption is String ? BSTR.Alloc(strCaption).Value : strCaption

        result := ComCall(17, this, BSTR, strCaption, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetCaption() {
        pstrCaption := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, pstrCaption, "HRESULT")
        return pstrCaption
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetDefault() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFullScreenVideo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CountModes := CallbackCreate(GetMethod(implObj, "CountModes"), flags, 2)
        this.vtbl.GetModeInfo := CallbackCreate(GetMethod(implObj, "GetModeInfo"), flags, 5)
        this.vtbl.GetCurrentMode := CallbackCreate(GetMethod(implObj, "GetCurrentMode"), flags, 2)
        this.vtbl.IsModeAvailable := CallbackCreate(GetMethod(implObj, "IsModeAvailable"), flags, 2)
        this.vtbl.IsModeEnabled := CallbackCreate(GetMethod(implObj, "IsModeEnabled"), flags, 2)
        this.vtbl.SetEnabled := CallbackCreate(GetMethod(implObj, "SetEnabled"), flags, 3)
        this.vtbl.GetClipFactor := CallbackCreate(GetMethod(implObj, "GetClipFactor"), flags, 2)
        this.vtbl.SetClipFactor := CallbackCreate(GetMethod(implObj, "SetClipFactor"), flags, 2)
        this.vtbl.SetMessageDrain := CallbackCreate(GetMethod(implObj, "SetMessageDrain"), flags, 2)
        this.vtbl.GetMessageDrain := CallbackCreate(GetMethod(implObj, "GetMessageDrain"), flags, 2)
        this.vtbl.SetMonitor := CallbackCreate(GetMethod(implObj, "SetMonitor"), flags, 2)
        this.vtbl.GetMonitor := CallbackCreate(GetMethod(implObj, "GetMonitor"), flags, 2)
        this.vtbl.HideOnDeactivate := CallbackCreate(GetMethod(implObj, "HideOnDeactivate"), flags, 2)
        this.vtbl.IsHideOnDeactivate := CallbackCreate(GetMethod(implObj, "IsHideOnDeactivate"), flags, 1)
        this.vtbl.SetCaption := CallbackCreate(GetMethod(implObj, "SetCaption"), flags, 2)
        this.vtbl.GetCaption := CallbackCreate(GetMethod(implObj, "GetCaption"), flags, 2)
        this.vtbl.SetDefault := CallbackCreate(GetMethod(implObj, "SetDefault"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CountModes)
        CallbackFree(this.vtbl.GetModeInfo)
        CallbackFree(this.vtbl.GetCurrentMode)
        CallbackFree(this.vtbl.IsModeAvailable)
        CallbackFree(this.vtbl.IsModeEnabled)
        CallbackFree(this.vtbl.SetEnabled)
        CallbackFree(this.vtbl.GetClipFactor)
        CallbackFree(this.vtbl.SetClipFactor)
        CallbackFree(this.vtbl.SetMessageDrain)
        CallbackFree(this.vtbl.GetMessageDrain)
        CallbackFree(this.vtbl.SetMonitor)
        CallbackFree(this.vtbl.GetMonitor)
        CallbackFree(this.vtbl.HideOnDeactivate)
        CallbackFree(this.vtbl.IsHideOnDeactivate)
        CallbackFree(this.vtbl.SetCaption)
        CallbackFree(this.vtbl.GetCaption)
        CallbackFree(this.vtbl.SetDefault)
    }
}
