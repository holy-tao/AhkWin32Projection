#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify types of notifications raised by [IDXCoreAdapter](/windows/win32/dxcore/dxcore_interface/nn-dxcore_interface-idxcoreadapter) or [IDXCoreAdapterList](/windows/win32/dxcore/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist) objects.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcorenotificationtype
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreNotificationType extends Win32Enum{

    /**
     * This notification is raised by an <a href="https://docs.microsoft.com/windows/win32/dxcore/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist">IDXCoreAdapterList</a> object when the adapter list becomes stale. The fresh-to-stale transition is one-way, and one-time, so this notification is raised at most one time.
     * @type {Integer (UInt32)}
     */
    static AdapterListStale => 0

    /**
     * This notification is raised by an <a href="https://docs.microsoft.com/windows/win32/dxcore/dxcore_interface/nn-dxcore_interface-idxcoreadapter">IDXCoreAdapter</a> object when the adapter becomes no longer valid. The valid-to-invalid transition is one-way, and one-time, so this notification is raised at most one time.
     * @type {Integer (UInt32)}
     */
    static AdapterNoLongerValid => 1

    /**
     * This notification is raised by an <a href="https://docs.microsoft.com/windows/win32/dxcore/dxcore_interface/nn-dxcore_interface-idxcoreadapter">IDXCoreAdapter</a> object when an adapter budget change occurs. This notification can occur many times. Using this notification is functionally similar to <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registervideomemorybudgetchangenotificationevent">IDXGIAdapter3::RegisterVideoMemoryBudgetChangeNotificationEvent</a>. In response to this event, you should call [IDXCoreAdapter::QueryState](/windows/win32/dxcore/dxcore_interface/nf-dxcore_interface-idxcoreadapter-querystate) (with [DXCoreAdapterState::AdapterMemoryBudget](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate)) to evaluate the current memory budget state.
     * @type {Integer (UInt32)}
     */
    static AdapterBudgetChange => 2

    /**
     * This notification is raised by an <a href="https://docs.microsoft.com/windows/win32/dxcore/dxcore_interface/nn-dxcore_interface-idxcoreadapter">IDXCoreAdapter</a> object to notify of an adapter's hardware content protection teardown. This notification can occur many times. It is functionally similar to <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registerhardwarecontentprotectionteardownstatusevent">IDXGIAdapter3::RegisterHardwareContentProtectionTeardownStatusEvent</a>. In response to this event, you should re-evaluate the current crypto session status; for example, by calling [ID3D11VideoContext1::CheckCryptoSessionStatus](/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-checkcryptosessionstatus) to determine the impact of the hardware teardown for a specific [ID3D11CryptoSession](/windows/win32/api/d3d11/nn-d3d11-id3d11cryptosession) interface.
     * @type {Integer (UInt32)}
     */
    static AdapterHardwareContentProtectionTeardown => 3
}
