#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceKeyCollection extends IUnknown{
    /**
     * The interface identifier for IPortableDeviceKeyCollection
     * @type {Guid}
     */
    static IID => Guid("{dada2357-e0ad-492e-98db-dd61c53ba353}")

    /**
     * The class identifier for PortableDeviceKeyCollection
     * @type {Guid}
     */
    static CLSID => Guid("{de2d022d-2480-43be-97f0-d1fa2cf98f4f}")

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
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @returns {HRESULT} 
     */
    GetAt(dwIndex, pKey) {
        result := ComCall(4, this, "uint", dwIndex, "ptr", pKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @returns {HRESULT} 
     */
    Add(Key) {
        result := ComCall(5, this, "ptr", Key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(6, this, "int")
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
