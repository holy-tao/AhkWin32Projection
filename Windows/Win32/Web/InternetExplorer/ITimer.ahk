#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ITimerSink.ahk" { ITimerSink }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ITimer extends IUnknown {
    /**
     * The interface identifier for ITimer
     * @type {Guid}
     */
    static IID := Guid("{3050f360-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITimer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Advise   : IntPtr
        Unadvise : IntPtr
        Freeze   : IntPtr
        GetTime  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITimer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {VARIANT} vtimeMin 
     * @param {VARIANT} vtimeMax 
     * @param {VARIANT} vtimeInterval 
     * @param {Integer} dwFlags 
     * @param {ITimerSink} pTimerSink 
     * @returns {Integer} 
     */
    Advise(vtimeMin, vtimeMax, vtimeInterval, dwFlags, pTimerSink) {
        result := ComCall(3, this, VARIANT, vtimeMin, VARIANT, vtimeMax, VARIANT, vtimeInterval, "uint", dwFlags, "ptr", pTimerSink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFreeze 
     * @returns {HRESULT} 
     */
    Freeze(fFreeze) {
        result := ComCall(5, this, BOOL, fFreeze, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    GetTime() {
        pvtime := VARIANT()
        result := ComCall(6, this, VARIANT.Ptr, pvtime, "HRESULT")
        return pvtime
    }

    Query(iid) {
        if (ITimer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 7)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 2)
        this.vtbl.Freeze := CallbackCreate(GetMethod(implObj, "Freeze"), flags, 2)
        this.vtbl.GetTime := CallbackCreate(GetMethod(implObj, "GetTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.Unadvise)
        CallbackFree(this.vtbl.Freeze)
        CallbackFree(this.vtbl.GetTime)
    }
}
