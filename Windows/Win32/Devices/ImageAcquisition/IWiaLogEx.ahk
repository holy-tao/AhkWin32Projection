#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is not supported. (IWiaLogEx)
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nn-wia_xp-iwialogex
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaLogEx extends IUnknown {
    /**
     * The interface identifier for IWiaLogEx
     * @type {Guid}
     */
    static IID := Guid("{af1f22ac-7a40-4787-b421-aeb47a1fbd0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaLogEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeLogEx : IntPtr
        hResult         : IntPtr
        Log             : IntPtr
        hResultEx       : IntPtr
        LogEx           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaLogEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method is not supported. (IWiaLogEx.InitializeLogEx)
     * @param {Pointer<Integer>} _hInstance Type: <b>BYTE*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialogex-initializelogex
     */
    InitializeLogEx(_hInstance) {
        _hInstanceMarshal := _hInstance is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, _hInstanceMarshal, _hInstance, "HRESULT")
        return result
    }

    /**
     * This method is not supported. (IWiaLogEx.hResult)
     * @param {HRESULT} _hResult Type: <b>HRESULT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialogex-hresult
     */
    hResult(_hResult) {
        result := ComCall(4, this, "int", _hResult, "HRESULT")
        return result
    }

    /**
     * This method is not supported. (IWiaLogEx.Log)
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @param {Integer} lResID Type: <b>LONG</b>
     * @param {Integer} lDetail Type: <b>LONG</b>
     * @param {BSTR} bstrText Type: <b>BSTR</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialogex-log
     */
    Log(lFlags, lResID, lDetail, bstrText) {
        bstrText := bstrText is String ? BSTR.Alloc(bstrText).Value : bstrText

        result := ComCall(5, this, "int", lFlags, "int", lResID, "int", lDetail, BSTR, bstrText, "HRESULT")
        return result
    }

    /**
     * This method is not supported. (IWiaLogEx.hResultEx)
     * @param {Integer} lMethodId Type: <b>LONG</b>
     * @param {HRESULT} _hResult Type: <b>HRESULT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialogex-hresultex
     */
    hResultEx(lMethodId, _hResult) {
        result := ComCall(6, this, "int", lMethodId, "int", _hResult, "HRESULT")
        return result
    }

    /**
     * This method is not supported. (IWiaLogEx.LogEx)
     * @param {Integer} lMethodId Type: <b>LONG</b>
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @param {Integer} lResID Type: <b>LONG</b>
     * @param {Integer} lDetail Type: <b>LONG</b>
     * @param {BSTR} bstrText Type: <b>BSTR</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialogex-logex
     */
    LogEx(lMethodId, lFlags, lResID, lDetail, bstrText) {
        bstrText := bstrText is String ? BSTR.Alloc(bstrText).Value : bstrText

        result := ComCall(7, this, "int", lMethodId, "int", lFlags, "int", lResID, "int", lDetail, BSTR, bstrText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWiaLogEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeLogEx := CallbackCreate(GetMethod(implObj, "InitializeLogEx"), flags, 2)
        this.vtbl.hResult := CallbackCreate(GetMethod(implObj, "hResult"), flags, 2)
        this.vtbl.Log := CallbackCreate(GetMethod(implObj, "Log"), flags, 5)
        this.vtbl.hResultEx := CallbackCreate(GetMethod(implObj, "hResultEx"), flags, 3)
        this.vtbl.LogEx := CallbackCreate(GetMethod(implObj, "LogEx"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeLogEx)
        CallbackFree(this.vtbl.hResult)
        CallbackFree(this.vtbl.Log)
        CallbackFree(this.vtbl.hResultEx)
        CallbackFree(this.vtbl.LogEx)
    }
}
