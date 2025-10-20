#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptTemplateEnumerator extends IUnknown{
    /**
     * The interface identifier for IDataModelScriptTemplateEnumerator
     * @type {Guid}
     */
    static IID => Guid("{69ce6ae2-2268-4e6f-b062-20ce62bfe677}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScriptTemplate>} templateContent 
     * @returns {HRESULT} 
     */
    GetNext(templateContent) {
        result := ComCall(4, this, "ptr", templateContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
