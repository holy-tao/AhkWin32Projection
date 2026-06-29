#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISAXLocator.ahk" { ISAXLocator }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISAXErrorHandler extends IUnknown {
    /**
     * The interface identifier for ISAXErrorHandler
     * @type {Guid}
     */
    static IID := Guid("{a60511c4-ccf5-479e-98a3-dc8dc545b7d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISAXErrorHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        error            : IntPtr
        fatalError       : IntPtr
        ignorableWarning : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISAXErrorHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISAXLocator} pLocator 
     * @param {PWSTR} pwchErrorMessage 
     * @param {HRESULT} hrErrorCode 
     * @returns {HRESULT} 
     */
    error(pLocator, pwchErrorMessage, hrErrorCode) {
        pwchErrorMessage := pwchErrorMessage is String ? StrPtr(pwchErrorMessage) : pwchErrorMessage

        result := ComCall(3, this, "ptr", pLocator, "ptr", pwchErrorMessage, "int", hrErrorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISAXLocator} pLocator 
     * @param {PWSTR} pwchErrorMessage 
     * @param {HRESULT} hrErrorCode 
     * @returns {HRESULT} 
     */
    fatalError(pLocator, pwchErrorMessage, hrErrorCode) {
        pwchErrorMessage := pwchErrorMessage is String ? StrPtr(pwchErrorMessage) : pwchErrorMessage

        result := ComCall(4, this, "ptr", pLocator, "ptr", pwchErrorMessage, "int", hrErrorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISAXLocator} pLocator 
     * @param {PWSTR} pwchErrorMessage 
     * @param {HRESULT} hrErrorCode 
     * @returns {HRESULT} 
     */
    ignorableWarning(pLocator, pwchErrorMessage, hrErrorCode) {
        pwchErrorMessage := pwchErrorMessage is String ? StrPtr(pwchErrorMessage) : pwchErrorMessage

        result := ComCall(5, this, "ptr", pLocator, "ptr", pwchErrorMessage, "int", hrErrorCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISAXErrorHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.error := CallbackCreate(GetMethod(implObj, "error"), flags, 4)
        this.vtbl.fatalError := CallbackCreate(GetMethod(implObj, "fatalError"), flags, 4)
        this.vtbl.ignorableWarning := CallbackCreate(GetMethod(implObj, "ignorableWarning"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.error)
        CallbackFree(this.vtbl.fatalError)
        CallbackFree(this.vtbl.ignorableWarning)
    }
}
