#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IDataModelScript.ahk
#Include .\IDataModelScriptTemplate.ahk
#Include .\IDataModelScriptTemplateEnumerator.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScriptProvider
     * @type {Guid}
     */
    static IID => Guid("{513461e0-4fca-48ce-8658-32f3e2056f3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetExtension", "CreateScript", "GetDefaultTemplateContent", "EnumerateTemplates"]

    /**
     * 
     * @returns {BSTR} 
     */
    GetName() {
        name := BSTR()
        result := ComCall(3, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetExtension() {
        extension := BSTR()
        result := ComCall(4, this, "ptr", extension, "HRESULT")
        return extension
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
        result := ComCall(7, this, "ptr*", &enumerator := 0, "HRESULT")
        return IDataModelScriptTemplateEnumerator(enumerator)
    }
}
