#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISWbemProperty.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\Com\IUnknown.ahk
#Include .\WbemCimtypeEnum.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class ISWbemPropertySet extends IDispatch {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemPropertySet
     * @type {Guid}
     */
    static IID => Guid("{dea0a7b2-d4ba-11d1-8b09-00600806d9b6}")

    /**
     * The class identifier for SWbemPropertySet
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d5c-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Add", "Remove"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @returns {ISWbemProperty} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(strName, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "int", iFlags, "ptr*", &objWbemProperty := 0, "HRESULT")
        return ISWbemProperty(objWbemProperty)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &iCount := 0, "HRESULT")
        return iCount
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {WbemCimtypeEnum} iCIMType 
     * @param {VARIANT_BOOL} bIsArray 
     * @param {Integer} iFlags 
     * @returns {ISWbemProperty} 
     */
    Add(strName, iCIMType, bIsArray, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(10, this, "ptr", strName, "int", iCIMType, "short", bIsArray, "int", iFlags, "ptr*", &objWbemProperty := 0, "HRESULT")
        return ISWbemProperty(objWbemProperty)
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Remove(strName, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(11, this, "ptr", strName, "int", iFlags, "HRESULT")
        return result
    }
}
