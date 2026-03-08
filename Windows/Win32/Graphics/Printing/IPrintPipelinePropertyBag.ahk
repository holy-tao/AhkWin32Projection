#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintPipelinePropertyBag extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddProperty", "GetProperty", "DeleteProperty"]

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    AddProperty(pszName, pVar) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "ptr", pVar, "HRESULT")
        return result
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {PWSTR} pszName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getproperty
     */
    GetProperty(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pVar := VARIANT()
        result := ComCall(4, this, "ptr", pszName, "ptr", pVar, "HRESULT")
        return pVar
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
