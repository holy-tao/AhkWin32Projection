#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies flags for the OfferResources1 method.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/ne-dxgi1_5-dxgi_offer_resource_flags
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OFFER_RESOURCE_FLAGS{

    /**
     * Indicates the ability to allow memory de-commit by the DirectX Graphics Kernel.
     * @type {Integer (Int32)}
     */
    static DXGI_OFFER_RESOURCE_FLAG_ALLOW_DECOMMIT => 1
}
