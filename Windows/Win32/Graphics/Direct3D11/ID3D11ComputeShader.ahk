#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * A compute-shader interface manages an executable program (a compute shader) that controls the compute-shader stage.
 * @remarks
 * 
  * The compute-shader interface has no methods; use HLSL to implement your shader functionality. All shaders are implemented from a common set of features referred to as the common-shader core..
  * 
  * To create a compute-shader interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createcomputeshader">ID3D11Device::CreateComputeShader</a>. Before using a compute shader you must bind it to the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetshader">ID3D11DeviceContext::CSSetShader</a>.
  * 
  * This interface is defined in D3D11.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11computeshader
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11ComputeShader extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11ComputeShader
     * @type {Guid}
     */
    static IID => Guid("{4f5b196e-c2bd-495e-bd01-1fded38e4969}")

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
