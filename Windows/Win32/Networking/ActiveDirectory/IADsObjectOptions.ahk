#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides a direct mechanism to specify and obtain provider-specific options for manipulating an ADSI object.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsobjectoptions
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsObjectOptions extends IDispatch {
    /**
     * The interface identifier for IADsObjectOptions
     * @type {Guid}
     */
    static IID := Guid("{46f14fda-232b-11d1-a808-00c04fd8d5a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsObjectOptions interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetOption : IntPtr
        SetOption : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsObjectOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a provider-specific option for a directory object.
     * @param {Integer} lnOption Indicates the provider-specific option to get. This parameter can be any value in the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_option_enum">ADS_OPTION_ENUM</a> enumeration.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> variable that receives the current value for the option specified in the <i>lnOption</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsobjectoptions-getoption
     */
    GetOption(lnOption) {
        pvValue := VARIANT()
        result := ComCall(7, this, "int", lnOption, VARIANT.Ptr, pvValue, "HRESULT")
        return pvValue
    }

    /**
     * Sets a provider-specific option for manipulating a directory object.
     * @param {Integer} lnOption Indicates the provider-specific option to set. This parameter can be any value in the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_option_enum">ADS_OPTION_ENUM</a> enumeration except <b>ADS_OPTION_SERVERNAME</b> or <b>ADS_OPTION_MUTUAL_AUTH_STATUS</b>.
     * @param {VARIANT} vValue Specifies the value to set for the option specified in the <i>lnOption</i> parameter.
     * @returns {HRESULT} The method supports the standard return values, including <b>S_OK</b> for a successful operation and <b>E_ADS_BAD_PARAMETER</b> when the user has supplied an invalid <i>pValue</i> parameter. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsobjectoptions-setoption
     */
    SetOption(lnOption, vValue) {
        result := ComCall(8, this, "int", lnOption, VARIANT, vValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsObjectOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOption := CallbackCreate(GetMethod(implObj, "GetOption"), flags, 3)
        this.vtbl.SetOption := CallbackCreate(GetMethod(implObj, "SetOption"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOption)
        CallbackFree(this.vtbl.SetOption)
    }
}
