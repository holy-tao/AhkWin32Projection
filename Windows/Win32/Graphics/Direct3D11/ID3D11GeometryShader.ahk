#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * A geometry-shader interface manages an executable program (a geometry shader) that controls the geometry-shader stage.
 * @remarks
 * 
  * The geometry-shader interface has no methods; use HLSL to implement your shader functionality. All shaders are implemented from a common set of features referred to as the common-shader core..
  * 
  * To create a geometry shader interface, call either <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-creategeometryshader">ID3D11Device::CreateGeometryShader</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-creategeometryshaderwithstreamoutput">ID3D11Device::CreateGeometryShaderWithStreamOutput</a>. Before using a geometry shader you must bind it to the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshader">ID3D11DeviceContext::GSSetShader</a>.
  * 
  * This interface is defined in D3D11.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11geometryshader
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11GeometryShader extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11GeometryShader
     * @type {Guid}
     */
    static IID => Guid("{38325b96-effb-4022-ba02-2e795b70275c}")

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
