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
     * 
     * @param {Pointer<UInt32>} pPropID 
     * @returns {HRESULT} 
     */
    get_PropertyID(pPropID) {
        result := ComCall(3, this, "uint*", pPropID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPropValue 
     * @returns {HRESULT} 
     */
    get_PropertyValue(pPropValue) {
        result := ComCall(4, this, "ptr", pPropValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PropValue 
     * @returns {HRESULT} 
     */
    set_Property(PropValue) {
        PropValue := PropValue is String ? BSTR.Alloc(PropValue).Value : PropValue

        result := ComCall(5, this, "ptr", PropValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
