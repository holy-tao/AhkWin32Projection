#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDevicePropVariantCollection extends IUnknown{
    /**
     * The interface identifier for IPortableDevicePropVariantCollection
     * @type {Guid}
     */
    static IID => Guid("{89b2e422-4f1b-4316-bcef-a44afea83eb3}")

    /**
     * The class identifier for PortableDevicePropVariantCollection
     * @type {Guid}
     */
    static CLSID => Guid("{08a99e2f-6d6d-4b80-af5a-baf2bcbe4cb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcElems 
     * @returns {HRESULT} 
     */
    GetCount(pcElems) {
        result := ComCall(3, this, "uint*", pcElems, "int")
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
        result := ComCall(4, this, "uint", dwIndex, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    Add(pValue) {
        result := ComCall(5, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pvt 
     * @returns {HRESULT} 
     */
    GetType(pvt) {
        result := ComCall(6, this, "ushort*", pvt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} vt 
     * @returns {HRESULT} 
     */
    ChangeType(vt) {
        result := ComCall(7, this, "ushort", vt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(8, this, "int")
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
        result := ComCall(9, this, "uint", dwIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
