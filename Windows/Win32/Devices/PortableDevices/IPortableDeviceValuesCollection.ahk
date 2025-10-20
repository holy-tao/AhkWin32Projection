#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceValuesCollection extends IUnknown{
    /**
     * The interface identifier for IPortableDeviceValuesCollection
     * @type {Guid}
     */
    static IID => Guid("{6e3f2d79-4e07-48c4-8208-d8c2e5af4a99}")

    /**
     * The class identifier for PortableDeviceValuesCollection
     * @type {Guid}
     */
    static CLSID => Guid("{3882134d-14cf-4220-9cb4-435f86d83f60}")

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
     * @param {Pointer<IPortableDeviceValues>} ppValues 
     * @returns {HRESULT} 
     */
    GetAt(dwIndex, ppValues) {
        result := ComCall(4, this, "uint", dwIndex, "ptr", ppValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceValues>} pValues 
     * @returns {HRESULT} 
     */
    Add(pValues) {
        result := ComCall(5, this, "ptr", pValues, "int")
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
