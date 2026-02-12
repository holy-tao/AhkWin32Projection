#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\WiFiAdapter.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class IWiFiAdapterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiAdapterStatics
     * @type {Guid}
     */
    static IID => Guid("{da25fddd-d24c-43e3-aabd-c4659f730f99}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAllAdaptersAsync", "GetDeviceSelector", "FromIdAsync", "RequestAccessAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<WiFiAdapter>>} 
     */
    FindAllAdaptersAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, WiFiAdapter), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        deviceSelector := HSTRING()
        result := ComCall(7, this, "ptr", deviceSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceSelector
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<WiFiAdapter>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(8, this, "ptr", deviceId, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiAdapter, asyncOp)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
