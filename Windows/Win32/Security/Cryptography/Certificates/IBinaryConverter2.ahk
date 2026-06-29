#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBinaryConverter.ahk" { IBinaryConverter }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IBinaryConverter2 extends IBinaryConverter {
    /**
     * The interface identifier for IBinaryConverter2
     * @type {Guid}
     */
    static IID := Guid("{8d7928b4-4e17-428d-9a17-728df00d1b2b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBinaryConverter2 interfaces
    */
    struct Vtbl extends IBinaryConverter.Vtbl {
        StringArrayToVariantArray : IntPtr
        VariantArrayToStringArray : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBinaryConverter2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarStringArray 
     * @returns {VARIANT} 
     */
    StringArrayToVariantArray(pvarStringArray) {
        pvarVariantArray := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, pvarStringArray, VARIANT.Ptr, pvarVariantArray, "HRESULT")
        return pvarVariantArray
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarVariantArray 
     * @returns {VARIANT} 
     */
    VariantArrayToStringArray(pvarVariantArray) {
        pvarStringArray := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, pvarVariantArray, VARIANT.Ptr, pvarStringArray, "HRESULT")
        return pvarStringArray
    }

    Query(iid) {
        if (IBinaryConverter2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StringArrayToVariantArray := CallbackCreate(GetMethod(implObj, "StringArrayToVariantArray"), flags, 3)
        this.vtbl.VariantArrayToStringArray := CallbackCreate(GetMethod(implObj, "VariantArrayToStringArray"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StringArrayToVariantArray)
        CallbackFree(this.vtbl.VariantArrayToStringArray)
    }
}
