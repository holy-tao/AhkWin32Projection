#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWbemStatusCodeText interface extracts text string descriptions of error codes or the name of the subsystem where the error occurred.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemstatuscodetext
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemStatusCodeText extends IUnknown {
    /**
     * The interface identifier for IWbemStatusCodeText
     * @type {Guid}
     */
    static IID := Guid("{eb87e1bc-3233-11d2-aec9-00c04fb68820}")

    /**
     * The class identifier for WbemStatusCodeText
     * @type {Guid}
     */
    static CLSID := Guid("{eb87e1bd-3233-11d2-aec9-00c04fb68820}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemStatusCodeText interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetErrorCodeText    : IntPtr
        GetFacilityCodeText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemStatusCodeText.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the text string description associated with the error code.
     * @remarks
     * To enable <b>GetErrorCodeText</b> to 
     *     return the text string description, the caller must free the pointer in the <i>MessageText</i> 
     *     parameter.
     * @param {HRESULT} hRes Handle to the error code for which you want a description.
     * @param {Integer} LocaleId Reserved. This parameter must be 0 (zero).
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @returns {BSTR} Pointer to a string containing the descriptive text of the error code.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemstatuscodetext-geterrorcodetext
     */
    GetErrorCodeText(hRes, LocaleId, lFlags) {
        MessageText := BSTR.Owned()
        result := ComCall(3, this, "int", hRes, "uint", LocaleId, "int", lFlags, BSTR.Ptr, MessageText, "HRESULT")
        return MessageText
    }

    /**
     * The IWbemStatusCodeText::GetFacilityCodeText method returns the name of the subsystem where the error occurred, such as &quot;Windows&quot;, &quot;WBEM&quot;, &quot;SSPI&quot;, or &quot;RPC&quot;.
     * @remarks
     * To enable the 
     *     <b>GetFacilityCodeText</b> method to 
     *     return the subsystem name, the caller must free the pointer in the <i>MessageText</i> 
     *     parameter.
     * @param {HRESULT} hRes Handle to the error code for which you want a description.
     * @param {Integer} LocaleId Reserved. This parameter must be 0 (zero).
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @returns {BSTR} Pointer to a string containing the descriptive text of the error code.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemstatuscodetext-getfacilitycodetext
     */
    GetFacilityCodeText(hRes, LocaleId, lFlags) {
        MessageText := BSTR.Owned()
        result := ComCall(4, this, "int", hRes, "uint", LocaleId, "int", lFlags, BSTR.Ptr, MessageText, "HRESULT")
        return MessageText
    }

    Query(iid) {
        if (IWbemStatusCodeText.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetErrorCodeText := CallbackCreate(GetMethod(implObj, "GetErrorCodeText"), flags, 5)
        this.vtbl.GetFacilityCodeText := CallbackCreate(GetMethod(implObj, "GetFacilityCodeText"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetErrorCodeText)
        CallbackFree(this.vtbl.GetFacilityCodeText)
    }
}
