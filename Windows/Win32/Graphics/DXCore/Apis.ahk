#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

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

    /**
     * @type {String}
     */
    static DXCORE_ADAPTER_ATTRIBUTE_D3D12_GENERIC_ML => "{b71b0d41-1088-422f-a27c-0250b7d3a988}"

    /**
     * @type {String}
     */
    static DXCORE_ADAPTER_ATTRIBUTE_D3D12_GENERIC_MEDIA => "{8eb2c848-82f6-4b49-aa87-aecfcf0174c6}"

    /**
     * @type {String}
     */
    static DXCORE_HARDWARE_TYPE_ATTRIBUTE_GPU => "{b69eb219-3ded-4464-979f-a00bd4687006}"

    /**
     * @type {String}
     */
    static DXCORE_HARDWARE_TYPE_ATTRIBUTE_COMPUTE_ACCELERATOR => "{e0b195da-58ef-4a22-90f1-1f28169cab8d}"

    /**
     * @type {String}
     */
    static DXCORE_HARDWARE_TYPE_ATTRIBUTE_NPU => "{d46140c4-add7-451b-9e56-06fe8c3b58ed}"

    /**
     * @type {String}
     */
    static DXCORE_HARDWARE_TYPE_ATTRIBUTE_MEDIA_ACCELERATOR => "{66bdb96a-050b-44c7-a4fd-d144ce0ab443}"
;@endregion Constants

;@region Methods
    /**
     * Creates a DXCore adapter factory, which you can use to generate further DXCore objects.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in *ppvFactory*. This is expected to be the interface identifier (IID) of [IDXCoreAdapterFactory](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory).
     * @param {Pointer<Pointer<Void>>} ppvFactory Type: **void\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the *riid* parameter. Upon successful return, *\*ppvFactory* (the dereferenced address) contains a pointer to the DXCore factory created.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |E_NOINTERFACE|An invalid value was provided for *riid*.|
     * |E_POINTER|`nullptr` was provided for *ppvFactory*.|
     * @see https://docs.microsoft.com/windows/win32/api//dxcore/nf-dxcore-dxcorecreateadapterfactory
     */
    static DXCoreCreateAdapterFactory(riid, ppvFactory) {
        ppvFactoryMarshal := ppvFactory is VarRef ? "ptr*" : "ptr"

        result := DllCall("DXCORE.dll\DXCoreCreateAdapterFactory", "ptr", riid, ppvFactoryMarshal, ppvFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
