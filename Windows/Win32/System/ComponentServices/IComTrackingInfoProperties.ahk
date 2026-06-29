#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves the total number of properties associated with a tracking information object and their names.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomtrackinginfoproperties
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComTrackingInfoProperties extends IUnknown {
    /**
     * The interface identifier for IComTrackingInfoProperties
     * @type {Guid}
     */
    static IID := Guid("{789b42be-6f6b-443a-898e-67abf390aa14}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComTrackingInfoProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PropCount   : IntPtr
        GetPropName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComTrackingInfoProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of properties defined for a tracking information object.
     * @returns {Integer} The number of properties defined for the object.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfoproperties-propcount
     */
    PropCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Retrieves the name of the property corresponding to the specified index number.
     * @param {Integer} ulIndex The index of the property.
     * @returns {PWSTR} The name of the property.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfoproperties-getpropname
     */
    GetPropName(ulIndex) {
        result := ComCall(4, this, "uint", ulIndex, PWSTR.Ptr, &ppszPropName := 0, "HRESULT")
        return ppszPropName
    }

    Query(iid) {
        if (IComTrackingInfoProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PropCount := CallbackCreate(GetMethod(implObj, "PropCount"), flags, 2)
        this.vtbl.GetPropName := CallbackCreate(GetMethod(implObj, "GetPropName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PropCount)
        CallbackFree(this.vtbl.GetPropName)
    }
}
