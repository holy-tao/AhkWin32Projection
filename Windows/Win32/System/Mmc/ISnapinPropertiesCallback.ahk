#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The ISnapinPropertiesCallback interface adds property names for the snap-in. This interface is implemented by MMC for the snap-in.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/nn-mmcobj-isnapinpropertiescallback
 * @namespace Windows.Win32.System.Mmc
 */
export default struct ISnapinPropertiesCallback extends IUnknown {
    /**
     * The interface identifier for ISnapinPropertiesCallback
     * @type {Guid}
     */
    static IID := Guid("{a50fa2e5-7e61-45eb-a8d4-9a07b3e851a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISnapinPropertiesCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPropertyName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISnapinPropertiesCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AddPropertyName method adds a property, by name, for the snap-in to use.
     * @param {PWSTR} pszPropName The property name.
     * @param {Integer} dwFlags This parameter can be one or more of the following flags.
     * @returns {HRESULT} If successful, the return value is S_OK. Other return values indicate an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmcobj/nf-mmcobj-isnapinpropertiescallback-addpropertyname
     */
    AddPropertyName(pszPropName, dwFlags) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszPropName, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISnapinPropertiesCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPropertyName := CallbackCreate(GetMethod(implObj, "AddPropertyName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPropertyName)
    }
}
