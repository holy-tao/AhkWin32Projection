#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMTilePropertyInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMTilePropertyInfo
     * @type {Guid}
     */
    static IID => Guid("{6c2b8017-1efa-42a7-86c0-6d4b640bf528}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PropertyID", "get_PropertyValue", "set_Property"]

    /**
     * 
     * @param {Pointer<Integer>} pPropID 
     * @returns {HRESULT} 
     */
    get_PropertyID(pPropID) {
        result := ComCall(3, this, "uint*", pPropID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPropValue 
     * @returns {HRESULT} 
     */
    get_PropertyValue(pPropValue) {
        result := ComCall(4, this, "ptr", pPropValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PropValue 
     * @returns {HRESULT} 
     */
    set_Property(PropValue) {
        PropValue := PropValue is String ? BSTR.Alloc(PropValue).Value : PropValue

        result := ComCall(5, this, "ptr", PropValue, "HRESULT")
        return result
    }
}
