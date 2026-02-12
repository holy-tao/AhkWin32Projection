#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\Property.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Properties Property (ServerNetworkProtocolIPAddress Class)
 * @remarks
 * 
 * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/servernetworkprotocolipaddress-class/properties-property-servernetworkprotocolipaddress-class
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Properties extends IDispatch{

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
        result := ComCall(7, this, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(Name) {
        if(Name is String) {
            pin := BSTR.Alloc(Name)
            Name := pin.Value
        }

        result := ComCall(8, this, "ptr", Name, "ptr*", &Property_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Property(Property_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {BSTR} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(Name) {
        if(Name is String) {
            pin := BSTR.Alloc(Name)
            Name := pin.Value
        }

        result := ComCall(10, this, "ptr", Name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
