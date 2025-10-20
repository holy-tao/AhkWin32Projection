#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowPropVariantCollection extends IUnknown{
    /**
     * The interface identifier for ISideShowPropVariantCollection
     * @type {Guid}
     */
    static IID => Guid("{2ea7a549-7bff-4aae-bab0-22d43111de49}")

    /**
     * The class identifier for SideShowPropVariantCollection
     * @type {Guid}
     */
    static CLSID => Guid("{e640f415-539e-4923-96cd-5f093bc250cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    Add(pValue) {
        result := ComCall(3, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    GetAt(dwIndex, pValue) {
        result := ComCall(5, this, "uint", dwIndex, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcElems 
     * @returns {HRESULT} 
     */
    GetCount(pcElems) {
        result := ComCall(6, this, "uint*", pcElems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     */
    RemoveAt(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
