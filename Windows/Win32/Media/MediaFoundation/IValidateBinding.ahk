#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IValidateBinding extends IUnknown {
    /**
     * The interface identifier for IValidateBinding
     * @type {Guid}
     */
    static IID := Guid("{04a578b2-e778-422a-a805-b3ee54d90bd9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IValidateBinding interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIdentifier : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IValidateBinding.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Guid} guidLicensorID 
     * @param {Pointer<Integer>} pbEphemeron 
     * @param {Integer} cbEphemeron 
     * @param {Pointer<Pointer<Integer>>} ppbBlobValidationID 
     * @param {Pointer<Integer>} pcbBlobSize 
     * @returns {HRESULT} 
     */
    GetIdentifier(guidLicensorID, pbEphemeron, cbEphemeron, ppbBlobValidationID, pcbBlobSize) {
        pbEphemeronMarshal := pbEphemeron is VarRef ? "char*" : "ptr"
        ppbBlobValidationIDMarshal := ppbBlobValidationID is VarRef ? "ptr*" : "ptr"
        pcbBlobSizeMarshal := pcbBlobSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, Guid, guidLicensorID, pbEphemeronMarshal, pbEphemeron, "uint", cbEphemeron, ppbBlobValidationIDMarshal, ppbBlobValidationID, pcbBlobSizeMarshal, pcbBlobSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IValidateBinding.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIdentifier := CallbackCreate(GetMethod(implObj, "GetIdentifier"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIdentifier)
    }
}
