#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ISWbemObject.ahk
#Include .\ISWbemSecurity.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemObjectSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemObjectSet
     * @type {Guid}
     */
    static IID => Guid("{76a6415f-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The class identifier for SWbemObjectSet
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d61-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "get_Security_", "ItemIndex"]

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
     * @type {ISWbemSecurity} 
     */
    Security_ {
        get => this.get_Security_()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pUnk)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @returns {ISWbemObject} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(strObjectPath, iFlags) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }

        result := ComCall(8, this, "ptr", strObjectPath, "int", iFlags, "ptr*", &objWbemObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemObject(objWbemObject)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &iCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iCount
    }

    /**
     * 
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(10, this, "ptr*", &objWbemSecurity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemSecurity(objWbemSecurity)
    }

    /**
     * Initializes an instance of the [ItemIndexRange](itemindexrange.md) class.
     * @param {Integer} lIndex 
     * @returns {ISWbemObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.itemindexrange.#ctor
     */
    ItemIndex(lIndex) {
        result := ComCall(11, this, "int", lIndex, "ptr*", &objWbemObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemObject(objWbemObject)
    }
}
