#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IScriptErrorList extends IDispatch {
    /**
     * The interface identifier for IScriptErrorList
     * @type {Guid}
     */
    static IID := Guid("{f3470f24-15fd-11d2-bb2e-00805ff7efca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScriptErrorList interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        advanceError           : IntPtr
        retreatError           : IntPtr
        canAdvanceError        : IntPtr
        canRetreatError        : IntPtr
        getErrorLine           : IntPtr
        getErrorChar           : IntPtr
        getErrorCode           : IntPtr
        getErrorMsg            : IntPtr
        getErrorUrl            : IntPtr
        getAlwaysShowLockState : IntPtr
        getDetailsPaneOpen     : IntPtr
        setDetailsPaneOpen     : IntPtr
        getPerErrorDisplay     : IntPtr
        setPerErrorDisplay     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScriptErrorList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    advanceError() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    retreatError() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    canAdvanceError() {
        result := ComCall(9, this, BOOL.Ptr, &pfCanAdvance := 0, "HRESULT")
        return pfCanAdvance
    }

    /**
     * 
     * @returns {BOOL} 
     */
    canRetreatError() {
        result := ComCall(10, this, BOOL.Ptr, &pfCanRetreat := 0, "HRESULT")
        return pfCanRetreat
    }

    /**
     * 
     * @returns {Integer} 
     */
    getErrorLine() {
        result := ComCall(11, this, "int*", &plLine := 0, "HRESULT")
        return plLine
    }

    /**
     * 
     * @returns {Integer} 
     */
    getErrorChar() {
        result := ComCall(12, this, "int*", &plChar := 0, "HRESULT")
        return plChar
    }

    /**
     * 
     * @returns {Integer} 
     */
    getErrorCode() {
        result := ComCall(13, this, "int*", &plCode := 0, "HRESULT")
        return plCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    getErrorMsg() {
        _pstr := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, _pstr, "HRESULT")
        return _pstr
    }

    /**
     * 
     * @returns {BSTR} 
     */
    getErrorUrl() {
        _pstr := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, _pstr, "HRESULT")
        return _pstr
    }

    /**
     * 
     * @returns {BOOL} 
     */
    getAlwaysShowLockState() {
        result := ComCall(16, this, BOOL.Ptr, &pfAlwaysShowLocked := 0, "HRESULT")
        return pfAlwaysShowLocked
    }

    /**
     * 
     * @returns {BOOL} 
     */
    getDetailsPaneOpen() {
        result := ComCall(17, this, BOOL.Ptr, &pfDetailsPaneOpen := 0, "HRESULT")
        return pfDetailsPaneOpen
    }

    /**
     * 
     * @param {BOOL} fDetailsPaneOpen 
     * @returns {HRESULT} 
     */
    setDetailsPaneOpen(fDetailsPaneOpen) {
        result := ComCall(18, this, BOOL, fDetailsPaneOpen, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    getPerErrorDisplay() {
        result := ComCall(19, this, BOOL.Ptr, &pfPerErrorDisplay := 0, "HRESULT")
        return pfPerErrorDisplay
    }

    /**
     * 
     * @param {BOOL} fPerErrorDisplay 
     * @returns {HRESULT} 
     */
    setPerErrorDisplay(fPerErrorDisplay) {
        result := ComCall(20, this, BOOL, fPerErrorDisplay, "HRESULT")
        return result
    }

    Query(iid) {
        if (IScriptErrorList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.advanceError := CallbackCreate(GetMethod(implObj, "advanceError"), flags, 1)
        this.vtbl.retreatError := CallbackCreate(GetMethod(implObj, "retreatError"), flags, 1)
        this.vtbl.canAdvanceError := CallbackCreate(GetMethod(implObj, "canAdvanceError"), flags, 2)
        this.vtbl.canRetreatError := CallbackCreate(GetMethod(implObj, "canRetreatError"), flags, 2)
        this.vtbl.getErrorLine := CallbackCreate(GetMethod(implObj, "getErrorLine"), flags, 2)
        this.vtbl.getErrorChar := CallbackCreate(GetMethod(implObj, "getErrorChar"), flags, 2)
        this.vtbl.getErrorCode := CallbackCreate(GetMethod(implObj, "getErrorCode"), flags, 2)
        this.vtbl.getErrorMsg := CallbackCreate(GetMethod(implObj, "getErrorMsg"), flags, 2)
        this.vtbl.getErrorUrl := CallbackCreate(GetMethod(implObj, "getErrorUrl"), flags, 2)
        this.vtbl.getAlwaysShowLockState := CallbackCreate(GetMethod(implObj, "getAlwaysShowLockState"), flags, 2)
        this.vtbl.getDetailsPaneOpen := CallbackCreate(GetMethod(implObj, "getDetailsPaneOpen"), flags, 2)
        this.vtbl.setDetailsPaneOpen := CallbackCreate(GetMethod(implObj, "setDetailsPaneOpen"), flags, 2)
        this.vtbl.getPerErrorDisplay := CallbackCreate(GetMethod(implObj, "getPerErrorDisplay"), flags, 2)
        this.vtbl.setPerErrorDisplay := CallbackCreate(GetMethod(implObj, "setPerErrorDisplay"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.advanceError)
        CallbackFree(this.vtbl.retreatError)
        CallbackFree(this.vtbl.canAdvanceError)
        CallbackFree(this.vtbl.canRetreatError)
        CallbackFree(this.vtbl.getErrorLine)
        CallbackFree(this.vtbl.getErrorChar)
        CallbackFree(this.vtbl.getErrorCode)
        CallbackFree(this.vtbl.getErrorMsg)
        CallbackFree(this.vtbl.getErrorUrl)
        CallbackFree(this.vtbl.getAlwaysShowLockState)
        CallbackFree(this.vtbl.getDetailsPaneOpen)
        CallbackFree(this.vtbl.setDetailsPaneOpen)
        CallbackFree(this.vtbl.getPerErrorDisplay)
        CallbackFree(this.vtbl.setPerErrorDisplay)
    }
}
