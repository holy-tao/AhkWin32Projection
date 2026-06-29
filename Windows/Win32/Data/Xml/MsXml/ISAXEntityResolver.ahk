#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISAXEntityResolver extends IUnknown {
    /**
     * The interface identifier for ISAXEntityResolver
     * @type {Guid}
     */
    static IID := Guid("{99bca7bd-e8c4-4d5f-a0cf-6d907901ff07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISAXEntityResolver interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        resolveEntity : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISAXEntityResolver.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwchPublicId 
     * @param {PWSTR} pwchSystemId 
     * @returns {VARIANT} 
     */
    resolveEntity(pwchPublicId, pwchSystemId) {
        pwchPublicId := pwchPublicId is String ? StrPtr(pwchPublicId) : pwchPublicId
        pwchSystemId := pwchSystemId is String ? StrPtr(pwchSystemId) : pwchSystemId

        pvarInput := VARIANT()
        result := ComCall(3, this, "ptr", pwchPublicId, "ptr", pwchSystemId, VARIANT.Ptr, pvarInput, "HRESULT")
        return pvarInput
    }

    Query(iid) {
        if (ISAXEntityResolver.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.resolveEntity := CallbackCreate(GetMethod(implObj, "resolveEntity"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.resolveEntity)
    }
}
