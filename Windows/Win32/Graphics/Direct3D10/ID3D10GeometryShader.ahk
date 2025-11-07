#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DeviceChild.ahk

/**
 * A geometry-shader interface manages an executable program (a geometry shader) that controls the geometry-shader stage.
 * @remarks
 * 
 * The geometry-shader interface has no methods; use HLSL to implement your shader functionality. All shaders in Direct3D 10 are implemented from a common set of features referred to as the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-common-core">common shader core</a>.
 * 
 * To create a geometry shader interface, call either <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-creategeometryshader">ID3D10Device::CreateGeometryShader</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-creategeometryshaderwithstreamoutput">ID3D10Device::CreateGeometryShaderWithStreamOutput</a>. Before using a geometry shader you must bind it to the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gssetshader">ID3D10Device::GSSetShader</a>.
 * 
 * This interface is defined in D3D10.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10geometryshader
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10GeometryShader extends ID3D10DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10GeometryShader
     * @type {Guid}
     */
    static IID => Guid("{6316be88-54cd-4040-ab44-20461bc81f68}")

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
