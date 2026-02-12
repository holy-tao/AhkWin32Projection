#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Networking\HostName.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RfcommServiceId.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class IRfcommDeviceService extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommDeviceService
     * @type {Guid}
     */
    static IID => Guid("{ae81ff1f-c5a1-4c40-8c28-f3efd69062f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConnectionHostName", "get_ConnectionServiceName", "get_ServiceId", "get_ProtectionLevel", "get_MaxProtectionLevel", "GetSdpRawAttributesAsync", "GetSdpRawAttributesWithCacheModeAsync"]

    /**
     * @type {HostName} 
     */
    ConnectionHostName {
        get => this.get_ConnectionHostName()
    }

    /**
     * @type {HSTRING} 
     */
    ConnectionServiceName {
        get => this.get_ConnectionServiceName()
    }

    /**
     * @type {RfcommServiceId} 
     */
    ServiceId {
        get => this.get_ServiceId()
    }

    /**
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
    }

    /**
     * @type {Integer} 
     */
    MaxProtectionLevel {
        get => this.get_MaxProtectionLevel()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_ConnectionHostName() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConnectionServiceName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_ServiceId() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxProtectionLevel() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<IMapView<Integer, IBuffer>>} 
     */
    GetSdpRawAttributesAsync() {
        result := ComCall(11, this, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMapView.Call.Bind(IMapView, (ptr) => IPropertyValue(ptr).GetUInt32(), IBuffer), asyncOp)
    }

    /**
     * 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<IMapView<Integer, IBuffer>>} 
     */
    GetSdpRawAttributesWithCacheModeAsync(cacheMode_) {
        result := ComCall(12, this, "int", cacheMode_, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMapView.Call.Bind(IMapView, (ptr) => IPropertyValue(ptr).GetUInt32(), IBuffer), asyncOp)
    }
}
