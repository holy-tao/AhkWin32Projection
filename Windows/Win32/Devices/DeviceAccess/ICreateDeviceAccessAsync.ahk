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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "Wait", "Close", "GetResult"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} timeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-wait
     */
    Wait(timeout) {
        result := ComCall(4, this, "uint", timeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-close
     */
    Close() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} deviceAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-getresult
     */
    GetResult(riid, deviceAccess) {
        result := ComCall(6, this, "ptr", riid, "ptr*", deviceAccess, "HRESULT")
        return result
    }
}
