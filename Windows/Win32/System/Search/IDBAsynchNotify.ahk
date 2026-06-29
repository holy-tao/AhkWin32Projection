#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDBAsynchNotify extends IUnknown {
    /**
     * The interface identifier for IDBAsynchNotify
     * @type {Guid}
     */
    static IID := Guid("{0c733a96-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDBAsynchNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnLowResource : IntPtr
        OnProgress    : IntPtr
        OnStop        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDBAsynchNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    OnLowResource(dwReserved) {
        result := ComCall(3, this, "ptr", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @param {Pointer} ulProgress 
     * @param {Pointer} ulProgressMax 
     * @param {Integer} eAsynchPhase 
     * @param {PWSTR} pwszStatusText 
     * @returns {HRESULT} 
     */
    OnProgress(hChapter, eOperation, ulProgress, ulProgressMax, eAsynchPhase, pwszStatusText) {
        pwszStatusText := pwszStatusText is String ? StrPtr(pwszStatusText) : pwszStatusText

        result := ComCall(4, this, "ptr", hChapter, "uint", eOperation, "ptr", ulProgress, "ptr", ulProgressMax, "uint", eAsynchPhase, "ptr", pwszStatusText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @param {HRESULT} hrStatus 
     * @param {PWSTR} pwszStatusText 
     * @returns {HRESULT} 
     */
    OnStop(hChapter, eOperation, hrStatus, pwszStatusText) {
        pwszStatusText := pwszStatusText is String ? StrPtr(pwszStatusText) : pwszStatusText

        result := ComCall(5, this, "ptr", hChapter, "uint", eOperation, "int", hrStatus, "ptr", pwszStatusText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDBAsynchNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnLowResource := CallbackCreate(GetMethod(implObj, "OnLowResource"), flags, 2)
        this.vtbl.OnProgress := CallbackCreate(GetMethod(implObj, "OnProgress"), flags, 7)
        this.vtbl.OnStop := CallbackCreate(GetMethod(implObj, "OnStop"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnLowResource)
        CallbackFree(this.vtbl.OnProgress)
        CallbackFree(this.vtbl.OnStop)
    }
}
