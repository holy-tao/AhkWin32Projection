#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IVBSAXLocator.ahk" { IVBSAXLocator }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IVBSAXErrorHandler extends IDispatch {
    /**
     * The interface identifier for IVBSAXErrorHandler
     * @type {Guid}
     */
    static IID := Guid("{d963d3fe-173c-4862-9095-b92f66995f52}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBSAXErrorHandler interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        error            : IntPtr
        fatalError       : IntPtr
        ignorableWarning : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBSAXErrorHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IVBSAXLocator} oLocator 
     * @param {Pointer<BSTR>} strErrorMessage 
     * @param {Integer} nErrorCode 
     * @returns {HRESULT} 
     */
    error(oLocator, strErrorMessage, nErrorCode) {
        result := ComCall(7, this, "ptr", oLocator, BSTR.Ptr, strErrorMessage, "int", nErrorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVBSAXLocator} oLocator 
     * @param {Pointer<BSTR>} strErrorMessage 
     * @param {Integer} nErrorCode 
     * @returns {HRESULT} 
     */
    fatalError(oLocator, strErrorMessage, nErrorCode) {
        result := ComCall(8, this, "ptr", oLocator, BSTR.Ptr, strErrorMessage, "int", nErrorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVBSAXLocator} oLocator 
     * @param {Pointer<BSTR>} strErrorMessage 
     * @param {Integer} nErrorCode 
     * @returns {HRESULT} 
     */
    ignorableWarning(oLocator, strErrorMessage, nErrorCode) {
        result := ComCall(9, this, "ptr", oLocator, BSTR.Ptr, strErrorMessage, "int", nErrorCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVBSAXErrorHandler.IID.Equals(iid)) {
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
