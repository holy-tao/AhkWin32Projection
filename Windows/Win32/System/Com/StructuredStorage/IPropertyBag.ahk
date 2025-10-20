#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Provides an object with a property bag in which the object can save its properties persistently.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-ipropertybag
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IPropertyBag extends IUnknown{
    /**
     * The interface identifier for IPropertyBag
     * @type {Guid}
     */
    static IID => Guid("{55272a00-42cb-11ce-8135-00aa004bb851}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszPropName 
     * @param {Pointer<VARIANT>} pVar 
     * @param {Pointer<IErrorLog>} pErrorLog 
     * @returns {HRESULT} 
     */
    Read(pszPropName, pVar, pErrorLog) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszPropName, "ptr", pVar, "ptr", pErrorLog, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropName 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    Write(pszPropName, pVar) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(4, this, "ptr", pszPropName, "ptr", pVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
