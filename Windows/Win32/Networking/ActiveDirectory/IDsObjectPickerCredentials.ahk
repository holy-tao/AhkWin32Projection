#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDsObjectPicker.ahk" { IDsObjectPicker }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IDsObjectPickerCredentials interface allows you to override credentials for the IDsObjectPicker object implementing this interface.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/nn-objsel-idsobjectpickercredentials
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IDsObjectPickerCredentials extends IDsObjectPicker {
    /**
     * The interface identifier for IDsObjectPickerCredentials
     * @type {Guid}
     */
    static IID := Guid("{e2d3ec9b-d041-445a-8f16-4748de8fb1cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDsObjectPickerCredentials interfaces
    */
    struct Vtbl extends IDsObjectPicker.Vtbl {
        SetCredentials : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDsObjectPickerCredentials.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Use this method to override the user credentials, passing new credentials for the account profile to be used.
     * @param {PWSTR} szUserName User account.
     * @param {PWSTR} szPassword Password.
     * @returns {HRESULT} S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/objsel/nf-objsel-idsobjectpickercredentials-setcredentials
     */
    SetCredentials(szUserName, szPassword) {
        szUserName := szUserName is String ? StrPtr(szUserName) : szUserName
        szPassword := szPassword is String ? StrPtr(szPassword) : szPassword

        result := ComCall(5, this, "ptr", szUserName, "ptr", szPassword, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDsObjectPickerCredentials.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCredentials := CallbackCreate(GetMethod(implObj, "SetCredentials"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCredentials)
    }
}
