#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * A hull-shader interface manages an executable program (a hull shader) that controls the hull-shader stage.
 * @remarks
 * 
  * The hull-shader interface has no methods; use HLSL to implement your shader functionality. All shaders are implemented from a common set of features referred to as the common-shader core..
  * 
  * To create a hull-shader interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createhullshader">ID3D11Device::CreateHullShader</a>. Before using a hull shader you must bind it to the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hssetshader">ID3D11DeviceContext::HSSetShader</a>.
  * 
  * This interface is defined in D3D11.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11hullshader
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11HullShader extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11HullShader
     * @type {Guid}
     */
    static IID => Guid("{8e5c6061-628a-4c8e-8264-bbe45cb3d5dd}")

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
