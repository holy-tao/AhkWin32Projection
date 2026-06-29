#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWbemClassObject.ahk" { IWbemClassObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemContext.ahk" { IWbemContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWbemObjectTextSrc interface is used to translate IWbemClassObject instances to and from differing text formats.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemobjecttextsrc
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemObjectTextSrc extends IUnknown {
    /**
     * The interface identifier for IWbemObjectTextSrc
     * @type {Guid}
     */
    static IID := Guid("{bfbf883a-cad7-11d3-a11b-00105a1f515a}")

    /**
     * The class identifier for WbemObjectTextSrc
     * @type {Guid}
     */
    static CLSID := Guid("{8d1c559d-84f0-4bb3-a7d5-56a7435a9ba6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemObjectTextSrc interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetText        : IntPtr
        CreateFromText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemObjectTextSrc.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemObjectTextSrc::GetText method creates a textual representation of an IWbemClassObject object; for example, an XML representation.
     * @remarks
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/representing-objects-in-xml">Representing Objects in XML</a>.
     * @param {Integer} lFlags Reserved. Must be 0L.
     * @param {IWbemClassObject} pObj Reference to the object to be represented in text format. This parameter cannot be <b>NULL</b>.
     * @param {Integer} uObjTextFormat Definition of the text format used to represent the object. For more information about valid values for this parameter, see Remarks.
     * @param {IWbemContext} pCtx Optional. Context object for the operation. The context object can be used to specify whether  certain parts of the object are represented in text; for example, whether to include qualifiers in the textual representation. The context object takes the following optional values.
     * @returns {BSTR} Textual representation of the object. User must free the string using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when finished with <i>strText</i>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjecttextsrc-gettext
     */
    GetText(lFlags, pObj, uObjTextFormat, pCtx) {
        strText := BSTR.Owned()
        result := ComCall(3, this, "int", lFlags, "ptr", pObj, "uint", uObjTextFormat, "ptr", pCtx, BSTR.Ptr, strText, "HRESULT")
        return strText
    }

    /**
     * The IWbemObjectTextSrc interface is used to translate IWbemClassObject instances to and from differing text formats.
     * @param {Integer} lFlags 
     * @param {BSTR} strText 
     * @param {Integer} uObjTextFormat 
     * @param {IWbemContext} pCtx 
     * @returns {IWbemClassObject} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemobjecttextsrc
     */
    CreateFromText(lFlags, strText, uObjTextFormat, pCtx) {
        strText := strText is String ? BSTR.Alloc(strText).Value : strText

        result := ComCall(4, this, "int", lFlags, BSTR, strText, "uint", uObjTextFormat, "ptr", pCtx, "ptr*", &pNewObj := 0, "HRESULT")
        return IWbemClassObject(pNewObj)
    }

    Query(iid) {
        if (IWbemObjectTextSrc.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 6)
        this.vtbl.CreateFromText := CallbackCreate(GetMethod(implObj, "CreateFromText"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetText)
        CallbackFree(this.vtbl.CreateFromText)
    }
}
