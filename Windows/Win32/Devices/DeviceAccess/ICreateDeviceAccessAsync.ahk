#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ICreateDeviceAccessAsync interface is returned from a call to CreateDeviceAccessInstance.
 * @see https://docs.microsoft.com/windows/win32/api//deviceaccess/nn-deviceaccess-icreatedeviceaccessasync
 * @namespace Windows.Win32.Devices.DeviceAccess
 * @version v4.0.30319
 */
class ICreateDeviceAccessAsync extends IUnknown{
    /**
     * The interface identifier for ICreateDeviceAccessAsync
     * @type {Guid}
     */
    static IID => Guid("{3474628f-683d-42d2-abcb-db018c6503bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} timeout 
     * @returns {HRESULT} 
     */
    Wait(timeout) {
        result := ComCall(4, this, "uint", timeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} deviceAccess 
     * @returns {HRESULT} 
     */
    GetResult(riid, deviceAccess) {
        result := ComCall(6, this, "ptr", riid, "ptr", deviceAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
