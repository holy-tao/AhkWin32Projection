#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * ICDBurnExt may be altered or unavailable.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-icdburnext
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICDBurnExt extends IUnknown {
    /**
     * The interface identifier for ICDBurnExt
     * @type {Guid}
     */
    static IID := Guid("{2271dcca-74fc-4414-8fb7-c56b05ace2d7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICDBurnExt interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSupportedActionTypes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICDBurnExt.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines the supported data type for a CD writing extension.
     * @returns {Integer} Type: <b>CDBE_ACTIONS*</b>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icdburnext-getsupportedactiontypes
     */
    GetSupportedActionTypes() {
        result := ComCall(3, this, "uint*", &pdwActions := 0, "HRESULT")
        return pdwActions
    }

    Query(iid) {
        if (ICDBurnExt.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSupportedActionTypes := CallbackCreate(GetMethod(implObj, "GetSupportedActionTypes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSupportedActionTypes)
    }
}
