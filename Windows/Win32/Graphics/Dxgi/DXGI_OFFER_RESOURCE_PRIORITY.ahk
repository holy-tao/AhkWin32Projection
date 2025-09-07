#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the importance of a resource’s content when you call the IDXGIDevice2::OfferResources method to offer the resource.
 * @remarks
 * Priority determines how likely the operating system is to discard an offered resource.  Resources offered with lower priority are discarded first.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_offer_resource_priority
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OFFER_RESOURCE_PRIORITY{

    /**
     * The resource is low priority. The operating system discards a low priority resource before other offered resources with higher priority. It is a good programming practice to mark a resource as low priority if it has no useful content.
     * @type {Integer (Int32)}
     */
    static DXGI_OFFER_RESOURCE_PRIORITY_LOW => 1

    /**
     * The resource is normal priority. You mark a resource as normal priority if it has  content that is easy to regenerate.
     * @type {Integer (Int32)}
     */
    static DXGI_OFFER_RESOURCE_PRIORITY_NORMAL => 2

    /**
     * The resource is high priority. The operating system discards other offered resources with lower priority before it discards a high priority resource.  You mark a resource as high priority if it has useful content that is difficult to regenerate.
     * @type {Integer (Int32)}
     */
    static DXGI_OFFER_RESOURCE_PRIORITY_HIGH => 3
}
