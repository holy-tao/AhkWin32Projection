#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Ole\IOleContainer.ahk" { IOleContainer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ITargetFrame extends IUnknown {
    /**
     * The interface identifier for ITargetFrame
     * @type {Guid}
     */
    static IID := Guid("{d5f78c80-5252-11cf-90fa-00aa0042106e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITargetFrame interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFrameName           : IntPtr
        GetFrameName           : IntPtr
        GetParentFrame         : IntPtr
        FindFrame              : IntPtr
        SetFrameSrc            : IntPtr
        GetFrameSrc            : IntPtr
        GetFramesContainer     : IntPtr
        SetFrameOptions        : IntPtr
        GetFrameOptions        : IntPtr
        SetFrameMargins        : IntPtr
        GetFrameMargins        : IntPtr
        RemoteNavigate         : IntPtr
        OnChildFrameActivate   : IntPtr
        OnChildFrameDeactivate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITargetFrame.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszFrameName 
     * @returns {HRESULT} 
     */
    SetFrameName(pszFrameName) {
        pszFrameName := pszFrameName is String ? StrPtr(pszFrameName) : pszFrameName

        result := ComCall(3, this, "ptr", pszFrameName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetFrameName() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszFrameName := 0, "HRESULT")
        return ppszFrameName
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetParentFrame() {
        result := ComCall(5, this, "ptr*", &ppunkParent := 0, "HRESULT")
        return IUnknown(ppunkParent)
    }

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @param {IUnknown} ppunkContextFrame 
     * @param {Integer} dwFlags 
     * @returns {IUnknown} 
     */
    FindFrame(pszTargetName, ppunkContextFrame, dwFlags) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := ComCall(6, this, "ptr", pszTargetName, "ptr", ppunkContextFrame, "uint", dwFlags, "ptr*", &ppunkTargetFrame := 0, "HRESULT")
        return IUnknown(ppunkTargetFrame)
    }

    /**
     * 
     * @param {PWSTR} pszFrameSrc 
     * @returns {HRESULT} 
     */
    SetFrameSrc(pszFrameSrc) {
        pszFrameSrc := pszFrameSrc is String ? StrPtr(pszFrameSrc) : pszFrameSrc

        result := ComCall(7, this, "ptr", pszFrameSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetFrameSrc() {
        result := ComCall(8, this, PWSTR.Ptr, &ppszFrameSrc := 0, "HRESULT")
        return ppszFrameSrc
    }

    /**
     * 
     * @returns {IOleContainer} 
     */
    GetFramesContainer() {
        result := ComCall(9, this, "ptr*", &ppContainer := 0, "HRESULT")
        return IOleContainer(ppContainer)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetFrameOptions(dwFlags) {
        result := ComCall(10, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFrameOptions() {
        result := ComCall(11, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @returns {HRESULT} 
     */
    SetFrameMargins(dwWidth, dwHeight) {
        result := ComCall(12, this, "uint", dwWidth, "uint", dwHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwWidth 
     * @param {Pointer<Integer>} pdwHeight 
     * @returns {HRESULT} 
     */
    GetFrameMargins(pdwWidth, pdwHeight) {
        pdwWidthMarshal := pdwWidth is VarRef ? "uint*" : "ptr"
        pdwHeightMarshal := pdwHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pdwWidthMarshal, pdwWidth, pdwHeightMarshal, pdwHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cLength 
     * @param {Pointer<Integer>} pulData 
     * @returns {HRESULT} 
     */
    RemoteNavigate(cLength, pulData) {
        pulDataMarshal := pulData is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", cLength, pulDataMarshal, pulData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkChildFrame 
     * @returns {HRESULT} 
     */
    OnChildFrameActivate(pUnkChildFrame) {
        result := ComCall(15, this, "ptr", pUnkChildFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkChildFrame 
     * @returns {HRESULT} 
     */
    OnChildFrameDeactivate(pUnkChildFrame) {
        result := ComCall(16, this, "ptr", pUnkChildFrame, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITargetFrame.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFrameName := CallbackCreate(GetMethod(implObj, "SetFrameName"), flags, 2)
        this.vtbl.GetFrameName := CallbackCreate(GetMethod(implObj, "GetFrameName"), flags, 2)
        this.vtbl.GetParentFrame := CallbackCreate(GetMethod(implObj, "GetParentFrame"), flags, 2)
        this.vtbl.FindFrame := CallbackCreate(GetMethod(implObj, "FindFrame"), flags, 5)
        this.vtbl.SetFrameSrc := CallbackCreate(GetMethod(implObj, "SetFrameSrc"), flags, 2)
        this.vtbl.GetFrameSrc := CallbackCreate(GetMethod(implObj, "GetFrameSrc"), flags, 2)
        this.vtbl.GetFramesContainer := CallbackCreate(GetMethod(implObj, "GetFramesContainer"), flags, 2)
        this.vtbl.SetFrameOptions := CallbackCreate(GetMethod(implObj, "SetFrameOptions"), flags, 2)
        this.vtbl.GetFrameOptions := CallbackCreate(GetMethod(implObj, "GetFrameOptions"), flags, 2)
        this.vtbl.SetFrameMargins := CallbackCreate(GetMethod(implObj, "SetFrameMargins"), flags, 3)
        this.vtbl.GetFrameMargins := CallbackCreate(GetMethod(implObj, "GetFrameMargins"), flags, 3)
        this.vtbl.RemoteNavigate := CallbackCreate(GetMethod(implObj, "RemoteNavigate"), flags, 3)
        this.vtbl.OnChildFrameActivate := CallbackCreate(GetMethod(implObj, "OnChildFrameActivate"), flags, 2)
        this.vtbl.OnChildFrameDeactivate := CallbackCreate(GetMethod(implObj, "OnChildFrameDeactivate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFrameName)
        CallbackFree(this.vtbl.GetFrameName)
        CallbackFree(this.vtbl.GetParentFrame)
        CallbackFree(this.vtbl.FindFrame)
        CallbackFree(this.vtbl.SetFrameSrc)
        CallbackFree(this.vtbl.GetFrameSrc)
        CallbackFree(this.vtbl.GetFramesContainer)
        CallbackFree(this.vtbl.SetFrameOptions)
        CallbackFree(this.vtbl.GetFrameOptions)
        CallbackFree(this.vtbl.SetFrameMargins)
        CallbackFree(this.vtbl.GetFrameMargins)
        CallbackFree(this.vtbl.RemoteNavigate)
        CallbackFree(this.vtbl.OnChildFrameActivate)
        CallbackFree(this.vtbl.OnChildFrameDeactivate)
    }
}
