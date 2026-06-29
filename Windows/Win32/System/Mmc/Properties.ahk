#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk
#Include .\Property.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Like any OLE object, a control provides much of its functionality through a set of incoming interfaces with properties and methods.
 * @see https://learn.microsoft.com/windows/win32/com/properties-and-methods
 * @namespace Windows.Win32.System.Mmc
 */
class Properties extends IDispatch {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Properties
     * @type {Guid}
     */
    static IID => Guid("{2886abc2-a425-42b2-91c6-e25c0e04581c}")

    /**
     * The class identifier for Properties
     * @type {Guid}
     */
    static CLSID => Guid("{2886abc2-a425-42b2-91c6-e25c0e04581c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Remove"]

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
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {BSTR} Name 
     * @returns {Property} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, "ptr", Name, "ptr*", &_Property := 0, "HRESULT")
        return Property(_Property)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {BSTR} Name 
     * @returns {HRESULT} 
     */
    Remove(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(10, this, "ptr", Name, "HRESULT")
        return result
    }
}
