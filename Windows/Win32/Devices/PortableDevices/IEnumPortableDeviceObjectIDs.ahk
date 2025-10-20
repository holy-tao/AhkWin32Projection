#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumPortableDeviceObjectIDs interface enumerates the objects on a portable device. Get this interface initially by calling IPortableDeviceContent::EnumObjects on a device.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-ienumportabledeviceobjectids
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IEnumPortableDeviceObjectIDs extends IUnknown{
    /**
     * The interface identifier for IEnumPortableDeviceObjectIDs
     * @type {Guid}
     */
    static IID => Guid("{10ece955-cf41-4728-bfa0-41eedf1bbf19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cObjects 
     * @param {Pointer<PWSTR>} pObjIDs 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cObjects, pObjIDs, pcFetched) {
        result := ComCall(3, this, "uint", cObjects, "ptr", pObjIDs, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cObjects 
     * @returns {HRESULT} 
     */
    Skip(cObjects) {
        result := ComCall(4, this, "uint", cObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumPortableDeviceObjectIDs>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
