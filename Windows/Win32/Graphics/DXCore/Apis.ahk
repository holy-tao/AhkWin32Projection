#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

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
     * @type {Guid}
     */
    static DXCORE_ADAPTER_ATTRIBUTE_D3D11_GRAPHICS => Guid("{8c47866b-7583-450d-f0f0-6bada895af4b}")

    /**
     * @type {Guid}
     */
    static DXCORE_ADAPTER_ATTRIBUTE_D3D12_GRAPHICS => Guid("{0c9ece4d-2f6e-4f01-8c96-e89e331b47b1}")

    /**
     * @type {Guid}
     */
    static DXCORE_ADAPTER_ATTRIBUTE_D3D12_CORE_COMPUTE => Guid("{248e2800-a793-4724-abaa-23a6de1be090}")

    /**
     * @type {Guid}
     */
    static DXCORE_ADAPTER_ATTRIBUTE_D3D12_GENERIC_ML => Guid("{b71b0d41-1088-422f-a27c-0250b7d3a988}")

    /**
     * @type {Guid}
     */
    static DXCORE_ADAPTER_ATTRIBUTE_D3D12_GENERIC_MEDIA => Guid("{8eb2c848-82f6-4b49-aa87-aecfcf0174c6}")

    /**
     * @type {Guid}
     */
    static DXCORE_HARDWARE_TYPE_ATTRIBUTE_GPU => Guid("{b69eb219-3ded-4464-979f-a00bd4687006}")

    /**
     * @type {Guid}
     */
    static DXCORE_HARDWARE_TYPE_ATTRIBUTE_COMPUTE_ACCELERATOR => Guid("{e0b195da-58ef-4a22-90f1-1f28169cab8d}")

    /**
     * @type {Guid}
     */
    static DXCORE_HARDWARE_TYPE_ATTRIBUTE_NPU => Guid("{d46140c4-add7-451b-9e56-06fe8c3b58ed}")

    /**
     * @type {Guid}
     */
    static DXCORE_HARDWARE_TYPE_ATTRIBUTE_MEDIA_ACCELERATOR => Guid("{66bdb96a-050b-44c7-a4fd-d144ce0ab443}")
;@endregion Constants

;@region Methods
    /**
     * Creates a DXCore adapter factory, which you can use to generate further DXCore objects.
     * @remarks
     * For the duration of time that a reference exists on an [IDXCoreAdapterFactory](../dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory.md) interface, an [IDXCoreAdapterList](../dxcore_interface/nn-dxcore_interface-idxcoreadapterlist.md) interface, or an [IDXCoreAdapter](../dxcore_interface/nn-dxcore_interface-idxcoreadapter.md) interface, additional calls to **DXCoreCreateAdapterFactory**, [IDXCoreAdapterList::GetFactory](../dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getfactory.md), or [IDXCoreAdapter::GetFactory](../dxcore_interface/nf-dxcore_interface-idxcoreadapter-getfactory.md) will return pointers to the same object, increasing the reference count of the **IDXCoreAdapterFactory** interface.
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/dxcore/dxcore/nf-dxcore-dxcorecreateadapterfactory
     */
    static DXCoreCreateAdapterFactory(riid) {
        result := DllCall("DXCORE.dll\DXCoreCreateAdapterFactory", "ptr", riid, "ptr*", &ppvFactory := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvFactory
    }

;@endregion Methods
}
