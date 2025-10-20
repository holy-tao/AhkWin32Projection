#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a factory that can instantiate a WPD Automation Device object in a Windows Store app.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  This interface can only be used in Windows Store apps.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicewebcontrol
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceWebControl extends IDispatch{
    /**
     * The interface identifier for IPortableDeviceWebControl
     * @type {Guid}
     */
    static IID => Guid("{94fc7953-5ca1-483a-8aee-df52e7747d00}")

    /**
     * The class identifier for PortableDeviceWebControl
     * @type {Guid}
     */
    static CLSID => Guid("{186dd02c-2dec-41b5-a7d4-b59056fade51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} deviceId 
     * @param {Pointer<IDispatch>} ppDevice 
     * @returns {HRESULT} 
     */
    GetDeviceFromId(deviceId, ppDevice) {
        deviceId := deviceId is String ? BSTR.Alloc(deviceId).Value : deviceId

        result := ComCall(7, this, "ptr", deviceId, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} deviceId 
     * @param {Pointer<IDispatch>} pCompletionHandler 
     * @param {Pointer<IDispatch>} pErrorHandler 
     * @returns {HRESULT} 
     */
    GetDeviceFromIdAsync(deviceId, pCompletionHandler, pErrorHandler) {
        deviceId := deviceId is String ? BSTR.Alloc(deviceId).Value : deviceId

        result := ComCall(8, this, "ptr", deviceId, "ptr", pCompletionHandler, "ptr", pErrorHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
