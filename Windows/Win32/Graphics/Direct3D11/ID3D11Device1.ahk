#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Device.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device1 adds new methods to those in ID3D11Device.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nn-d3d11_1-id3d11device1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device1 extends ID3D11Device{
    /**
     * The interface identifier for ID3D11Device1
     * @type {Guid}
     */
    static IID => Guid("{a04bfb29-08ef-43d6-a49c-a9bdbdcbe686}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * 
     * @param {Pointer<ID3D11DeviceContext1>} ppImmediateContext 
     * @returns {String} Nothing - always returns an empty string
     */
    GetImmediateContext1(ppImmediateContext) {
        ComCall(43, this, "ptr", ppImmediateContext)
        return result
    }

    /**
     * 
     * @param {Integer} ContextFlags 
     * @param {Pointer<ID3D11DeviceContext1>} ppDeferredContext 
     * @returns {HRESULT} 
     */
    CreateDeferredContext1(ContextFlags, ppDeferredContext) {
        result := ComCall(44, this, "uint", ContextFlags, "ptr", ppDeferredContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_BLEND_DESC1>} pBlendStateDesc 
     * @param {Pointer<ID3D11BlendState1>} ppBlendState 
     * @returns {HRESULT} 
     */
    CreateBlendState1(pBlendStateDesc, ppBlendState) {
        result := ComCall(45, this, "ptr", pBlendStateDesc, "ptr", ppBlendState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_RASTERIZER_DESC1>} pRasterizerDesc 
     * @param {Pointer<ID3D11RasterizerState1>} ppRasterizerState 
     * @returns {HRESULT} 
     */
    CreateRasterizerState1(pRasterizerDesc, ppRasterizerState) {
        result := ComCall(46, this, "ptr", pRasterizerDesc, "ptr", ppRasterizerState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<Int32>} pFeatureLevels 
     * @param {Integer} FeatureLevels 
     * @param {Integer} SDKVersion 
     * @param {Pointer<Guid>} EmulatedInterface 
     * @param {Pointer<Int32>} pChosenFeatureLevel 
     * @param {Pointer<ID3DDeviceContextState>} ppContextState 
     * @returns {HRESULT} 
     */
    CreateDeviceContextState(Flags, pFeatureLevels, FeatureLevels, SDKVersion, EmulatedInterface, pChosenFeatureLevel, ppContextState) {
        result := ComCall(47, this, "uint", Flags, "int*", pFeatureLevels, "uint", FeatureLevels, "uint", SDKVersion, "ptr", EmulatedInterface, "int*", pChosenFeatureLevel, "ptr", ppContextState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hResource 
     * @param {Pointer<Guid>} returnedInterface 
     * @param {Pointer<Void>} ppResource 
     * @returns {HRESULT} 
     */
    OpenSharedResource1(hResource, returnedInterface, ppResource) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        result := ComCall(48, this, "ptr", hResource, "ptr", returnedInterface, "ptr", ppResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpName 
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<Guid>} returnedInterface 
     * @param {Pointer<Void>} ppResource 
     * @returns {HRESULT} 
     */
    OpenSharedResourceByName(lpName, dwDesiredAccess, returnedInterface, ppResource) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := ComCall(49, this, "ptr", lpName, "uint", dwDesiredAccess, "ptr", returnedInterface, "ptr", ppResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
