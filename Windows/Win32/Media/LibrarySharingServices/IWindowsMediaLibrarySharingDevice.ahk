#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWindowsMediaLibrarySharingDevice interface defines methods that provide access to an individual media device on the home network.
 * @remarks
 * 
  * To obtain an <b>IWindowsMediaLibrarySharingDevice</b> interface, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-getdevice">GetDevice</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-get_item">get_Item</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdevices">IWindowsMediaLibrarySharingDevices</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmlss/nn-wmlss-iwindowsmedialibrarysharingdevice
 * @namespace Windows.Win32.Media.LibrarySharingServices
 * @version v4.0.30319
 */
class IWindowsMediaLibrarySharingDevice extends IDispatch{
    /**
     * The interface identifier for IWindowsMediaLibrarySharingDevice
     * @type {Guid}
     */
    static IID => Guid("{3dccc293-4fd9-4191-a25b-8e57c5d27bd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} deviceID 
     * @returns {HRESULT} 
     */
    get_DeviceID(deviceID) {
        result := ComCall(7, this, "ptr", deviceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} authorization 
     * @returns {HRESULT} 
     */
    get_Authorization(authorization) {
        result := ComCall(8, this, "int*", authorization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} authorization 
     * @returns {HRESULT} 
     */
    put_Authorization(authorization) {
        result := ComCall(9, this, "int", authorization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWindowsMediaLibrarySharingDeviceProperties>} deviceProperties 
     * @returns {HRESULT} 
     */
    get_Properties(deviceProperties) {
        result := ComCall(10, this, "ptr", deviceProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
