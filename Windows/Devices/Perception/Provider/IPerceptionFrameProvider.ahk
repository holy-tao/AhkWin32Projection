#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PerceptionFrameProviderInfo.ahk
#Include ..\..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an object that can produce PerceptionFrames.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.iperceptionframeprovider
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionFrameProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionFrameProvider
     * @type {Guid}
     */
    static IID => Guid("{794f7ab9-b37d-3b33-a10d-30626419ce65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameProviderInfo", "get_Available", "get_Properties", "Start", "Stop", "SetProperty"]

    /**
     * Gets the PerceptionFrameProviderInfo describing this device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.iperceptionframeprovider.frameproviderinfo
     * @type {PerceptionFrameProviderInfo} 
     */
    FrameProviderInfo {
        get => this.get_FrameProviderInfo()
    }

    /**
     * Gets a value indicating whether or not the device is ready to start producing PerceptionFrames.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.iperceptionframeprovider.available
     * @type {Boolean} 
     */
    Available {
        get => this.get_Available()
    }

    /**
     * The properties describing the device and the frames produced by the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.iperceptionframeprovider.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {PerceptionFrameProviderInfo} 
     */
    get_FrameProviderInfo() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionFrameProviderInfo(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Available() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }

    /**
     * Tells the device to start producing frames. If success is returned, PerceptionFrameProviderManagerService::PublishFrameForProvider is expected to be called by this Provider.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.iperceptionframeprovider.start
     */
    Start() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Tells the device to stop producing frames. Called only after Start is called and only if Start returns success.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.iperceptionframeprovider.stop
     */
    Stop() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The device is requested to update one of its Properties to a new value.
     * @param {PerceptionPropertyChangeRequest} value Success or failure will be conveyed to the app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.iperceptionframeprovider.setproperty
     */
    SetProperty(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
