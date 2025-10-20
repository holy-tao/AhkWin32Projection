#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptProvider extends IUnknown{
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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} extension 
     * @returns {HRESULT} 
     */
    GetExtension(extension) {
        result := ComCall(4, this, "ptr", extension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScript>} script 
     * @returns {HRESULT} 
     */
    CreateScript(script) {
        result := ComCall(5, this, "ptr", script, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScriptTemplate>} templateContent 
     * @returns {HRESULT} 
     */
    GetDefaultTemplateContent(templateContent) {
        result := ComCall(6, this, "ptr", templateContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScriptTemplateEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    EnumerateTemplates(enumerator) {
        result := ComCall(7, this, "ptr", enumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
