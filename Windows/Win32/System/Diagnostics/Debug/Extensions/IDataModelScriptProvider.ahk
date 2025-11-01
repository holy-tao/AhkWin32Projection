#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} extension 
     * @returns {HRESULT} 
     */
    GetExtension(extension) {
        result := ComCall(4, this, "ptr", extension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScript>} script 
     * @returns {HRESULT} 
     */
    CreateScript(script) {
        result := ComCall(5, this, "ptr*", script, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScriptTemplate>} templateContent 
     * @returns {HRESULT} 
     */
    GetDefaultTemplateContent(templateContent) {
        result := ComCall(6, this, "ptr*", templateContent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScriptTemplateEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    EnumerateTemplates(enumerator) {
        result := ComCall(7, this, "ptr*", enumerator, "HRESULT")
        return result
    }
}
