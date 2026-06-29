#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Retrieves the properties of a tracking information object.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomtrackinginfoobject
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComTrackingInfoObject extends IUnknown {
    /**
     * The interface identifier for IComTrackingInfoObject
     * @type {Guid}
     */
    static IID := Guid("{116e42c5-d8b1-47bf-ab1e-c895ed3e2372}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComTrackingInfoObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComTrackingInfoObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the value of the specified property.
     * @param {PWSTR} szPropertyName The name of the property.
     * @returns {VARIANT} The value of the property.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfoobject-getvalue
     */
    GetValue(szPropertyName) {
        szPropertyName := szPropertyName is String ? StrPtr(szPropertyName) : szPropertyName

        pvarOut := VARIANT()
        result := ComCall(3, this, "ptr", szPropertyName, VARIANT.Ptr, pvarOut, "HRESULT")
        return pvarOut
    }

    Query(iid) {
        if (IComTrackingInfoObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetValue)
    }
}
