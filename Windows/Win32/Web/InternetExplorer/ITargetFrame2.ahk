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
export default struct ITargetFrame2 extends IUnknown {
    /**
     * The interface identifier for ITargetFrame2
     * @type {Guid}
     */
    static IID := Guid("{86d52e11-94a8-11d0-82af-00c04fd5ae38}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITargetFrame2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFrameName       : IntPtr
        GetFrameName       : IntPtr
        GetParentFrame     : IntPtr
        SetFrameSrc        : IntPtr
        GetFrameSrc        : IntPtr
        GetFramesContainer : IntPtr
        SetFrameOptions    : IntPtr
        GetFrameOptions    : IntPtr
        SetFrameMargins    : IntPtr
        GetFrameMargins    : IntPtr
        FindFrame          : IntPtr
        GetTargetAlias     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITargetFrame2.Vtbl()
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
     * @param {PWSTR} pszFrameSrc 
     * @returns {HRESULT} 
     */
    SetFrameSrc(pszFrameSrc) {
        pszFrameSrc := pszFrameSrc is String ? StrPtr(pszFrameSrc) : pszFrameSrc

        result := ComCall(6, this, "ptr", pszFrameSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetFrameSrc() {
        result := ComCall(7, this, PWSTR.Ptr, &ppszFrameSrc := 0, "HRESULT")
        return ppszFrameSrc
    }

    /**
     * 
     * @returns {IOleContainer} 
     */
    GetFramesContainer() {
        result := ComCall(8, this, "ptr*", &ppContainer := 0, "HRESULT")
        return IOleContainer(ppContainer)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetFrameOptions(dwFlags) {
        result := ComCall(9, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFrameOptions() {
        result := ComCall(10, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @returns {HRESULT} 
     */
    SetFrameMargins(dwWidth, dwHeight) {
        result := ComCall(11, this, "uint", dwWidth, "uint", dwHeight, "HRESULT")
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

        result := ComCall(12, this, pdwWidthMarshal, pdwWidth, pdwHeightMarshal, pdwHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @param {Integer} dwFlags 
     * @returns {IUnknown} 
     */
    FindFrame(pszTargetName, dwFlags) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := ComCall(13, this, "ptr", pszTargetName, "uint", dwFlags, "ptr*", &ppunkTargetFrame := 0, "HRESULT")
        return IUnknown(ppunkTargetFrame)
    }

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @returns {PWSTR} 
     */
    GetTargetAlias(pszTargetName) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := ComCall(14, this, "ptr", pszTargetName, PWSTR.Ptr, &ppszTargetAlias := 0, "HRESULT")
        return ppszTargetAlias
    }

    Query(iid) {
        if (ITargetFrame2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFrameName := CallbackCreate(GetMethod(implObj, "SetFrameName"), flags, 2)
        this.vtbl.GetFrameName := CallbackCreate(GetMethod(implObj, "GetFrameName"), flags, 2)
        this.vtbl.GetParentFrame := CallbackCreate(GetMethod(implObj, "GetParentFrame"), flags, 2)
        this.vtbl.SetFrameSrc := CallbackCreate(GetMethod(implObj, "SetFrameSrc"), flags, 2)
        this.vtbl.GetFrameSrc := CallbackCreate(GetMethod(implObj, "GetFrameSrc"), flags, 2)
        this.vtbl.GetFramesContainer := CallbackCreate(GetMethod(implObj, "GetFramesContainer"), flags, 2)
        this.vtbl.SetFrameOptions := CallbackCreate(GetMethod(implObj, "SetFrameOptions"), flags, 2)
        this.vtbl.GetFrameOptions := CallbackCreate(GetMethod(implObj, "GetFrameOptions"), flags, 2)
        this.vtbl.SetFrameMargins := CallbackCreate(GetMethod(implObj, "SetFrameMargins"), flags, 3)
        this.vtbl.GetFrameMargins := CallbackCreate(GetMethod(implObj, "GetFrameMargins"), flags, 3)
        this.vtbl.FindFrame := CallbackCreate(GetMethod(implObj, "FindFrame"), flags, 4)
        this.vtbl.GetTargetAlias := CallbackCreate(GetMethod(implObj, "GetTargetAlias"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFrameName)
        CallbackFree(this.vtbl.GetFrameName)
        CallbackFree(this.vtbl.GetParentFrame)
        CallbackFree(this.vtbl.SetFrameSrc)
        CallbackFree(this.vtbl.GetFrameSrc)
        CallbackFree(this.vtbl.GetFramesContainer)
        CallbackFree(this.vtbl.SetFrameOptions)
        CallbackFree(this.vtbl.GetFrameOptions)
        CallbackFree(this.vtbl.SetFrameMargins)
        CallbackFree(this.vtbl.GetFrameMargins)
        CallbackFree(this.vtbl.FindFrame)
        CallbackFree(this.vtbl.GetTargetAlias)
    }
}
