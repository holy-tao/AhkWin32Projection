#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Device3.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device4 adds new methods to those in ID3D11Device3, such as RegisterDeviceRemovedEvent and UnregisterDeviceRemoved.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11device4
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device4 extends ID3D11Device3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Device4
     * @type {Guid}
     */
    static IID => Guid("{8992ab71-02e6-4b8d-ba48-b056dcda42c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 65

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterDeviceRemovedEvent", "UnregisterDeviceRemoved"]

    /**
     * Registers the &quot;device removed&quot; event and indicates when a Direct3D device has become removed for any reason, using an asynchronous notification mechanism.
     * @remarks
     * Indicates when a Direct3D device has become removed for any reason, using an asynchronous notification mechanism, rather than as an HRESULT from <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">Present</a>. The reason for device removal can be retrieved using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-getdeviceremovedreason">ID3D11Device::GetDeviceRemovedReason</a> after being notified of the occurrence.
     * 
     * Applications register and un-register a Win32 event handle with a particular device.
     *           That event handle will be signaled when the device becomes removed.
     *           A poll into the device's <b>ID3D11Device::GetDeviceRemovedReason</b> method indicates that the device is removed.
     *         
     * 
     * 
     * <a href="https://docs.microsoft.com/uwp/api/Windows.System.Threading.Core">ISignalableNotifier</a> or <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolwait">SetThreadpoolWait</a> can be used by UWP apps.
     *         
     * 
     * When the graphics device is lost, the app or title will receive the graphics event, so that the app or title knows that its graphics device is no longer valid and it is safe for the app or title to re-create its DirectX devices.
     *           In response to this event, the app or title needs to re-create its rendering device 
     * 			 and pass it into a SetRenderingDevice  call on the composition graphics device objects.
     *         
     * 
     * After setting this new rendering device, the app or title needs to redraw content of all the pre-existing surfaces 
     * 			 after the composition graphics device's <b>OnRenderingDeviceReplaced</b> event is fired.
     *         
     * 
     * This method supports Composition for device loss.
     *         
     * 
     * The event is not signaled when it is most ideal to re-create.
     *           So, instead, we recommend iterating through the adapter ordinals and creating the first ordinal that will succeed.
     *         
     * 
     * The application can register an event with the device.
     *           The application will be signaled when the device becomes removed.
     *         
     * 
     * If the device is already removed, calls to <b>RegisterDeviceRemovedEvent</b> will signal the event immediately.
     *           No device-removed error code will be returned from <b>RegisterDeviceRemovedEvent</b>.
     *         
     * 
     * Each "device removed" event is never signaled, or is signaled only once.
     *           These events are not signaled during device destruction.
     *           These events are unregistered during destruction.
     *         
     * 
     * The semantics of <b>RegisterDeviceRemovedEvent</b> are similar to
     *           <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatusevent">IDXGIFactory2::RegisterOcclusionStatusEvent</a>.
     * @param {HANDLE} hEvent Type: <b>HANDLE</b>
     * 
     * The handle to the "device removed" event.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to information about the "device removed" event, which can be used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11device4-unregisterdeviceremoved">UnregisterDeviceRemoved</a> to unregister the event.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11device4-registerdeviceremovedevent
     */
    RegisterDeviceRemovedEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(65, this, "ptr", hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters the &quot;device removed&quot; event.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11device4-registerdeviceremovedevent">RegisterDeviceRemovedEvent</a>.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * Information about the "device removed" event,
     *           retrieved during a successful <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11device4-registerdeviceremovedevent">RegisterDeviceRemovedEvent</a> call.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11device4-unregisterdeviceremoved
     */
    UnregisterDeviceRemoved(dwCookie) {
        ComCall(66, this, "uint", dwCookie)
    }
}
