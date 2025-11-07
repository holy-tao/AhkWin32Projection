#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DeviceChild.ahk

/**
 * A pixel-shader interface manages an executable program (a pixel shader) that controls the pixel-shader stage.
 * @remarks
 * 
 * The pixel-shader interface has no methods; use HLSL to implement your shader functionality. All shaders in Direct3D 10 are implemented from a common set of features referred to as the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-common-core">common shader core</a>.
 * 
 * To create a pixel shader interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createpixelshader">ID3D10Device::CreatePixelShader</a>. Before using a pixel shader you must bind it to the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetshader">ID3D10Device::PSSetShader</a>.
 * 
 * This interface is defined in D3D10.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10pixelshader
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10PixelShader extends ID3D10DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10PixelShader
     * @type {Guid}
     */
    static IID => Guid("{4968b601-9d00-4cde-8346-8e7f675819b6}")

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
