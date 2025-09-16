#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCore {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static _FACDXCORE => 2176

    /**
     * @type {String}
     */
    static DXCORE_ADAPTER_ATTRIBUTE_D3D11_GRAPHICS => "{8c47866b-7583-450d-f0f0-6bada895af4b}"

    /**
     * @type {String}
     */
    static DXCORE_ADAPTER_ATTRIBUTE_D3D12_GRAPHICS => "{0c9ece4d-2f6e-4f01-8c96-e89e331b47b1}"

    /**
     * @type {String}
     */
    static DXCORE_ADAPTER_ATTRIBUTE_D3D12_CORE_COMPUTE => "{248e2800-a793-4724-abaa-23a6de1be090}"
;@endregion Constants

;@region Methods
    /**
     * Creates a DXCore adapter factory, which you can use to generate further DXCore objects.
     * @remarks
     * For the duration of time that a reference exists on an [IDXCoreAdapterFactory](../dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory.md) interface, an [IDXCoreAdapterList](../dxcore_interface/nn-dxcore_interface-idxcoreadapterlist.md) interface, or an [IDXCoreAdapter](../dxcore_interface/nn-dxcore_interface-idxcoreadapter.md) interface, additional calls to **DXCoreCreateAdapterFactory**, [IDXCoreAdapterList::GetFactory](../dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getfactory.md), or [IDXCoreAdapter::GetFactory](../dxcore_interface/nf-dxcore_interface-idxcoreadapter-getfactory.md) will return pointers to the same object, increasing the reference count of the **IDXCoreAdapterFactory** interface.
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvFactory 
     * @returns {Integer} Type: **[HRESULT](../../com/structure-of-com-error-codes.md)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](../../com/structure-of-com-error-codes.md) [error code](../../com/com-error-codes-10.md).
     * 
     * |Return value|Description|
     * |-|-|
     * |E_NOINTERFACE|An invalid value was provided for *riid*.|
     * |E_POINTER|`nullptr` was provided for *ppvFactory*.|
     * @see https://learn.microsoft.com/windows/win32/dxcore/dxcore/nf-dxcore-dxcorecreateadapterfactory
     */
    static DXCoreCreateAdapterFactory(riid, ppvFactory) {
        result := DllCall("DXCORE.dll\DXCoreCreateAdapterFactory", "ptr", riid, "ptr", ppvFactory, "int")
        return result
    }

;@endregion Methods
}
