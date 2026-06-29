#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
export default struct IXmlResolver extends IUnknown {
    /**
     * The interface identifier for IXmlResolver
     * @type {Guid}
     */
    static IID := Guid("{7279fc82-709d-4095-b63d-69fe4b0d9030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXmlResolver interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ResolveUri : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXmlResolver.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwszBaseUri 
     * @param {PWSTR} pwszPublicIdentifier 
     * @param {PWSTR} pwszSystemIdentifier 
     * @returns {IUnknown} 
     */
    ResolveUri(pwszBaseUri, pwszPublicIdentifier, pwszSystemIdentifier) {
        pwszBaseUri := pwszBaseUri is String ? StrPtr(pwszBaseUri) : pwszBaseUri
        pwszPublicIdentifier := pwszPublicIdentifier is String ? StrPtr(pwszPublicIdentifier) : pwszPublicIdentifier
        pwszSystemIdentifier := pwszSystemIdentifier is String ? StrPtr(pwszSystemIdentifier) : pwszSystemIdentifier

        result := ComCall(3, this, "ptr", pwszBaseUri, "ptr", pwszPublicIdentifier, "ptr", pwszSystemIdentifier, "ptr*", &ppResolvedInput := 0, "HRESULT")
        return IUnknown(ppResolvedInput)
    }

    Query(iid) {
        if (IXmlResolver.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ResolveUri := CallbackCreate(GetMethod(implObj, "ResolveUri"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ResolveUri)
    }
}
