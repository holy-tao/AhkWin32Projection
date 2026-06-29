#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDataModelScriptTemplate.ahk" { IDataModelScriptTemplate }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelScript.ahk" { IDataModelScript }
#Import ".\IDataModelScriptTemplateEnumerator.ahk" { IDataModelScriptTemplateEnumerator }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptProvider extends IUnknown {
    /**
     * The interface identifier for IDataModelScriptProvider
     * @type {Guid}
     */
    static IID := Guid("{513461e0-4fca-48ce-8658-32f3e2056f3b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName                   : IntPtr
        GetExtension              : IntPtr
        CreateScript              : IntPtr
        GetDefaultTemplateContent : IntPtr
        EnumerateTemplates        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        name := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetExtension() {
        _extension := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, _extension, "HRESULT")
        return _extension
    }

    /**
     * 
     * @returns {IDataModelScript} 
     */
    CreateScript() {
        result := ComCall(5, this, "ptr*", &script := 0, "HRESULT")
        return IDataModelScript(script)
    }

    /**
     * 
     * @returns {IDataModelScriptTemplate} 
     */
    GetDefaultTemplateContent() {
        result := ComCall(6, this, "ptr*", &templateContent := 0, "HRESULT")
        return IDataModelScriptTemplate(templateContent)
    }

    /**
     * 
     * @returns {IDataModelScriptTemplateEnumerator} 
     */
    EnumerateTemplates() {
        result := ComCall(7, this, "ptr*", &_enumerator := 0, "HRESULT")
        return IDataModelScriptTemplateEnumerator(_enumerator)
    }

    Query(iid) {
        if (IDataModelScriptProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetExtension := CallbackCreate(GetMethod(implObj, "GetExtension"), flags, 2)
        this.vtbl.CreateScript := CallbackCreate(GetMethod(implObj, "CreateScript"), flags, 2)
        this.vtbl.GetDefaultTemplateContent := CallbackCreate(GetMethod(implObj, "GetDefaultTemplateContent"), flags, 2)
        this.vtbl.EnumerateTemplates := CallbackCreate(GetMethod(implObj, "EnumerateTemplates"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetExtension)
        CallbackFree(this.vtbl.CreateScript)
        CallbackFree(this.vtbl.GetDefaultTemplateContent)
        CallbackFree(this.vtbl.EnumerateTemplates)
    }
}
