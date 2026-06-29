#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This interface has been deprecated. (IAMPhysicalPinInfo)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamphysicalpininfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMPhysicalPinInfo extends IUnknown {
    /**
     * The interface identifier for IAMPhysicalPinInfo
     * @type {Guid}
     */
    static IID := Guid("{f938c991-3029-11cf-8c44-00aa006b6814}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMPhysicalPinInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPhysicalType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMPhysicalPinInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  The IAMPhysicalPinInfo interface is deprecated. Retrieves the type and name of the physical pin.
     * @param {Pointer<Integer>} pType Pointer to a variable that receives a value indicating the pin's type. The [PhysicalConnectorType](/windows/desktop/api/strmif/ne-strmif-physicalconnectortype) enumeration defines the pin type values.
     * @param {Pointer<PWSTR>} ppszType Address of a pointer to a buffer that receives a human-readable string identifying the pin type.
     * @returns {HRESULT} Returns S_OK if a valid physical pin value is found. Otherwise, returns VFW_E_NO_ACCEPTABLE_TYPES.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamphysicalpininfo-getphysicaltype
     */
    GetPhysicalType(pType, ppszType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        ppszTypeMarshal := ppszType is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pTypeMarshal, pType, ppszTypeMarshal, ppszType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMPhysicalPinInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPhysicalType := CallbackCreate(GetMethod(implObj, "GetPhysicalType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPhysicalType)
    }
}
