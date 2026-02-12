#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPerceptionFrameProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The IPerceptionFrameProviderManager is expected to provide any IPerceptionFrameProvider that has been registered via PerceptionFrameProviderManagerService::RegisterFrameProviderInfo().
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.iperceptionframeprovidermanager
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionFrameProviderManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionFrameProviderManager
     * @type {Guid}
     */
    static IID => Guid("{a959ce07-ead3-33df-8ec1-b924abe019c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrameProvider"]

    /**
     * The method to request an IPerceptionFrameProvider associated with a registered PerceptionFrameProviderInfo.
     * @remarks
     * A request with a registered info is expected to return S_OK and a valid IPerceptionFrameProvider, or the appropriate error code. Any requests with a PerceptionFrameProviderInfo which has not been registered or has since been unregistered are expected to return S_OK and nullptr.
     * @param {PerceptionFrameProviderInfo} frameProviderInfo The info specifying the desired IPerceptionFrameProvider.
     * @returns {IPerceptionFrameProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.iperceptionframeprovidermanager.getframeprovider
     */
    GetFrameProvider(frameProviderInfo) {
        result := ComCall(6, this, "ptr", frameProviderInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPerceptionFrameProvider(result_)
    }
}
