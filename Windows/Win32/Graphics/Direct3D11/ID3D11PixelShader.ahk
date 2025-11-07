#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * A pixel-shader interface manages an executable program (a pixel shader) that controls the pixel-shader stage.
 * @remarks
 * 
 * The pixel-shader interface has no methods; use HLSL to implement your shader functionality. All shaders in are implemented from a common set of features referred to as the common-shader core..
 * 
 * To create a pixel shader interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createpixelshader">ID3D11Device::CreatePixelShader</a>. Before using a pixel shader you must bind it to the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshader">ID3D11DeviceContext::PSSetShader</a>.
 * 
 * This interface is defined in D3D11.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11pixelshader
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11PixelShader extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11PixelShader
     * @type {Guid}
     */
    static IID => Guid("{ea82e40d-51dc-4f33-93d4-db7c9125ae8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
