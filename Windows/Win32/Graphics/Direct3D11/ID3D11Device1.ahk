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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImmediateContext1", "CreateDeferredContext1", "CreateBlendState1", "CreateRasterizerState1", "CreateDeviceContextState", "OpenSharedResource1", "OpenSharedResourceByName"]

    /**
     * 
     * @param {Pointer<ID3D11DeviceContext1>} ppImmediateContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11device1-getimmediatecontext1
     */
    GetImmediateContext1(ppImmediateContext) {
        ComCall(43, this, "ptr*", ppImmediateContext)
    }

    /**
     * 
     * @param {Integer} ContextFlags 
     * @param {Pointer<ID3D11DeviceContext1>} ppDeferredContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11device1-createdeferredcontext1
     */
    CreateDeferredContext1(ContextFlags, ppDeferredContext) {
        result := ComCall(44, this, "uint", ContextFlags, "ptr*", ppDeferredContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_BLEND_DESC1>} pBlendStateDesc 
     * @param {Pointer<ID3D11BlendState1>} ppBlendState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11device1-createblendstate1
     */
    CreateBlendState1(pBlendStateDesc, ppBlendState) {
        result := ComCall(45, this, "ptr", pBlendStateDesc, "ptr*", ppBlendState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_RASTERIZER_DESC1>} pRasterizerDesc 
     * @param {Pointer<ID3D11RasterizerState1>} ppRasterizerState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11device1-createrasterizerstate1
     */
    CreateRasterizerState1(pRasterizerDesc, ppRasterizerState) {
        result := ComCall(46, this, "ptr", pRasterizerDesc, "ptr*", ppRasterizerState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} pFeatureLevels 
     * @param {Integer} FeatureLevels 
     * @param {Integer} SDKVersion 
     * @param {Pointer<Guid>} EmulatedInterface 
     * @param {Pointer<Integer>} pChosenFeatureLevel 
     * @param {Pointer<ID3DDeviceContextState>} ppContextState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11device1-createdevicecontextstate
     */
    CreateDeviceContextState(Flags, pFeatureLevels, FeatureLevels, SDKVersion, EmulatedInterface, pChosenFeatureLevel, ppContextState) {
        pFeatureLevelsMarshal := pFeatureLevels is VarRef ? "int*" : "ptr"
        pChosenFeatureLevelMarshal := pChosenFeatureLevel is VarRef ? "int*" : "ptr"

        result := ComCall(47, this, "uint", Flags, pFeatureLevelsMarshal, pFeatureLevels, "uint", FeatureLevels, "uint", SDKVersion, "ptr", EmulatedInterface, pChosenFeatureLevelMarshal, pChosenFeatureLevel, "ptr*", ppContextState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hResource 
     * @param {Pointer<Guid>} returnedInterface 
     * @param {Pointer<Pointer<Void>>} ppResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1
     */
    OpenSharedResource1(hResource, returnedInterface, ppResource) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        ppResourceMarshal := ppResource is VarRef ? "ptr*" : "ptr"

        result := ComCall(48, this, "ptr", hResource, "ptr", returnedInterface, ppResourceMarshal, ppResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpName 
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<Guid>} returnedInterface 
     * @param {Pointer<Pointer<Void>>} ppResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresourcebyname
     */
    OpenSharedResourceByName(lpName, dwDesiredAccess, returnedInterface, ppResource) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        ppResourceMarshal := ppResource is VarRef ? "ptr*" : "ptr"

        result := ComCall(49, this, "ptr", lpName, "uint", dwDesiredAccess, "ptr", returnedInterface, ppResourceMarshal, ppResource, "HRESULT")
        return result
    }
}
