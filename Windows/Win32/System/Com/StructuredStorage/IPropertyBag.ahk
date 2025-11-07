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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Write"]

    /**
     * 
     * @param {PWSTR} pszPropName 
     * @param {Pointer<VARIANT>} pVar 
     * @param {IErrorLog} pErrorLog 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ipropertybag-read
     */
    Read(pszPropName, pVar, pErrorLog) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszPropName, "ptr", pVar, "ptr", pErrorLog, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropName 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ipropertybag-write
     */
    Write(pszPropName, pVar) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(4, this, "ptr", pszPropName, "ptr", pVar, "HRESULT")
        return result
    }
}
