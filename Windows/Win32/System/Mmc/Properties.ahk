#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/com/properties-and-methods
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
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(7, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<Property>} Property 
     * @returns {HRESULT} 
     */
    Item(Name, Property) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, "ptr", Name, "ptr*", Property, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        CountMarshal := Count is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, CountMarshal, Count, "HRESULT")
        return result
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
