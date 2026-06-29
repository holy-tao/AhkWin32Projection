#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ExtensionValidationContexts.ahk" { ExtensionValidationContexts }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ExtensionValidationResults.ahk" { ExtensionValidationResults }
#Import "..\MsHtml\IHTMLDocument2.ahk" { IHTMLDocument2 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\MsHtml\IHTMLElement.ahk" { IHTMLElement }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IExtensionValidation extends IUnknown {
    /**
     * The interface identifier for IExtensionValidation
     * @type {Guid}
     */
    static IID := Guid("{7d33f73d-8525-4e0f-87db-830288baff44}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExtensionValidation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Validate    : IntPtr
        DisplayName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExtensionValidation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} extensionGuid 
     * @param {PWSTR} extensionModulePath 
     * @param {Integer} extensionFileVersionMS 
     * @param {Integer} extensionFileVersionLS 
     * @param {IHTMLDocument2} htmlDocumentTop 
     * @param {IHTMLDocument2} htmlDocumentSubframe 
     * @param {IHTMLElement} htmlElement 
     * @param {ExtensionValidationContexts} contexts 
     * @returns {ExtensionValidationResults} 
     */
    Validate(extensionGuid, extensionModulePath, extensionFileVersionMS, extensionFileVersionLS, htmlDocumentTop, htmlDocumentSubframe, htmlElement, contexts) {
        extensionModulePath := extensionModulePath is String ? StrPtr(extensionModulePath) : extensionModulePath

        result := ComCall(3, this, Guid.Ptr, extensionGuid, "ptr", extensionModulePath, "uint", extensionFileVersionMS, "uint", extensionFileVersionLS, "ptr", htmlDocumentTop, "ptr", htmlDocumentSubframe, "ptr", htmlElement, ExtensionValidationContexts, contexts, "int*", &results := 0, "HRESULT")
        return results
    }

    /**
     * Specifies the name of the principal that is displayed in the Task Scheduler UI.
     * @remarks
     * For scripting development, the display name of the principal is specified using the [**Principal.DisplayName**](principal-displayname.md) property.
     * 
     * For C++ development, the display name of the principal is specified using the [**IPrincipal::DisplayName**](/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_displayname) property.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-displayname-principaltype-element
     */
    DisplayName() {
        result := ComCall(4, this, PWSTR.Ptr, &displayName := 0, "HRESULT")
        return displayName
    }

    Query(iid) {
        if (IExtensionValidation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Validate := CallbackCreate(GetMethod(implObj, "Validate"), flags, 10)
        this.vtbl.DisplayName := CallbackCreate(GetMethod(implObj, "DisplayName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Validate)
        CallbackFree(this.vtbl.DisplayName)
    }
}
