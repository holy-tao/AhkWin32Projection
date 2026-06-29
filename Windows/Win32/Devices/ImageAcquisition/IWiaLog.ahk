#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is not supported. (IWiaLog)
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nn-wia_xp-iwialog
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaLog extends IUnknown {
    /**
     * The interface identifier for IWiaLog
     * @type {Guid}
     */
    static IID := Guid("{a00c10b6-82a1-452f-8b6c-86062aad6890}")

    /**
     * The class identifier for WiaLog
     * @type {Guid}
     */
    static CLSID := Guid("{a1e75357-881a-419e-83e2-bb16db197c68}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaLog interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeLog : IntPtr
        hResult       : IntPtr
        Log           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaLog.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method is not supported. (IWiaLog.InitializeLog)
     * @param {Integer} _hInstance Type: <b>LONG</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialog-initializelog
     */
    InitializeLog(_hInstance) {
        result := ComCall(3, this, "int", _hInstance, "HRESULT")
        return result
    }

    /**
     * This method is not supported. (IWiaLog.hResult)
     * @param {HRESULT} _hResult Type: <b>HRESULT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialog-hresult
     */
    hResult(_hResult) {
        result := ComCall(4, this, "int", _hResult, "HRESULT")
        return result
    }

    /**
     * This method is not supported. (IWiaLog.Log)
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @param {Integer} lResID Type: <b>LONG</b>
     * @param {Integer} lDetail Type: <b>LONG</b>
     * @param {BSTR} bstrText Type: <b>BSTR</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialog-log
     */
    Log(lFlags, lResID, lDetail, bstrText) {
        bstrText := bstrText is String ? BSTR.Alloc(bstrText).Value : bstrText

        result := ComCall(5, this, "int", lFlags, "int", lResID, "int", lDetail, BSTR, bstrText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWiaLog.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeLog := CallbackCreate(GetMethod(implObj, "InitializeLog"), flags, 2)
        this.vtbl.hResult := CallbackCreate(GetMethod(implObj, "hResult"), flags, 2)
        this.vtbl.Log := CallbackCreate(GetMethod(implObj, "Log"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeLog)
        CallbackFree(this.vtbl.hResult)
        CallbackFree(this.vtbl.Log)
    }
}
