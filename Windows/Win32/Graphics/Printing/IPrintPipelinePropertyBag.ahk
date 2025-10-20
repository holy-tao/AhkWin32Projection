#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintPipelinePropertyBag extends IUnknown{
    /**
     * The interface identifier for IPrintPipelinePropertyBag
     * @type {Guid}
     */
    static IID => Guid("{8b8c99dc-7892-4a95-8a04-57422e9fbb47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    AddProperty(pszName, pVar) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "ptr", pVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    GetProperty(pszName, pVar) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "ptr", pVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {BOOL} 
     */
    DeleteProperty(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "int")
        return result
    }
}
