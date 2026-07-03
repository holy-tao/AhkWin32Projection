#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves the code and description for errors and warnings returned by various operations.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nn-wcmconfig-isettingsresult
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
export default struct ISettingsResult extends IUnknown {
    /**
     * The interface identifier for ISettingsResult
     * @type {Guid}
     */
    static IID := Guid("{9f7d7bbc-20b3-11da-81a5-0030f1642e3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISettingsResult interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDescription        : IntPtr
        GetErrorCode          : IntPtr
        GetContextDescription : IntPtr
        GetLine               : IntPtr
        GetColumn             : IntPtr
        GetSource             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISettingsResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the description of the error.
     * @returns {BSTR} The text that describes the error.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-getdescription
     */
    GetDescription() {
        description := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, description, "HRESULT")
        return description
    }

    /**
     * Returns the HRESULT error code value.
     * @returns {HRESULT} The error code value.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-geterrorcode
     */
    GetErrorCode() {
        result := ComCall(4, this, "int*", &hrOut := 0, "HRESULT")
        return hrOut
    }

    /**
     * Returns the description of the context that surrounds the error.
     * @returns {BSTR} The text that describes the context.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-getcontextdescription
     */
    GetContextDescription() {
        description := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, description, "HRESULT")
        return description
    }

    /**
     * Returns the line number where the error has occurred.
     * @returns {Integer} The line number where the error has occurred.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-getline
     */
    GetLine() {
        result := ComCall(6, this, "uint*", &dwLine := 0, "HRESULT")
        return dwLine
    }

    /**
     * Returns the column number where the error occurred.
     * @returns {Integer} The column which is the source of the error.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-getcolumn
     */
    GetColumn() {
        result := ComCall(7, this, "uint*", &dwColumn := 0, "HRESULT")
        return dwColumn
    }

    /**
     * Returns the file or path where the error has occurred.
     * @returns {BSTR} The file or path where the error has occurred.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-getsource
     */
    GetSource() {
        _file := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, _file, "HRESULT")
        return _file
    }

    Query(iid) {
        if (ISettingsResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.GetErrorCode := CallbackCreate(GetMethod(implObj, "GetErrorCode"), flags, 2)
        this.vtbl.GetContextDescription := CallbackCreate(GetMethod(implObj, "GetContextDescription"), flags, 2)
        this.vtbl.GetLine := CallbackCreate(GetMethod(implObj, "GetLine"), flags, 2)
        this.vtbl.GetColumn := CallbackCreate(GetMethod(implObj, "GetColumn"), flags, 2)
        this.vtbl.GetSource := CallbackCreate(GetMethod(implObj, "GetSource"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.GetErrorCode)
        CallbackFree(this.vtbl.GetContextDescription)
        CallbackFree(this.vtbl.GetLine)
        CallbackFree(this.vtbl.GetColumn)
        CallbackFree(this.vtbl.GetSource)
    }
}
