#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10ShaderResourceView1.ahk
#Include .\ID3D10BlendState1.ahk
#Include .\ID3D10Device.ahk

/**
 * The device interface represents a virtual adapter for Direct3D 10.1; it is used to perform rendering and create Direct3D resources.
 * @remarks
 * 
 * A device is created using <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nf-d3d10_1-d3d10createdevice1">D3D10CreateDevice1</a>.
 * 
 * This method requires Windows Vista Service Pack 1.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1/nn-d3d10_1-id3d10device1
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Device1 extends ID3D10Device{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Device1
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c8f-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 98

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateShaderResourceView1", "CreateBlendState1", "GetFeatureLevel"]

    /**
     * Create a shader-resource view for accessing data in a resource.
     * @param {ID3D10Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">resource</a> that will serve as input to a shader. This resource must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_SHADER_RESOURCE</a> flag.
     * @param {Pointer<D3D10_SHADER_RESOURCE_VIEW_DESC1>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ns-d3d10_1-d3d10_shader_resource_view_desc1">D3D10_SHADER_RESOURCE_VIEW_DESC1</a>*</b>
     * 
     * Pointer to a shader-resource-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ns-d3d10_1-d3d10_shader_resource_view_desc1">D3D10_SHADER_RESOURCE_VIEW_DESC1</a>). Set this parameter to <b>NULL</b> to create a view that accesses the entire resource (using the format the resource was created with).
     * @returns {ID3D10ShaderResourceView1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10shaderresourceview1">ID3D10ShaderResourceView1</a>**</b>
     * 
     * Address of a pointer to a shader-resource view (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10shaderresourceview1">ID3D10ShaderResourceView1 Interface</a>). Set this parameter to <b>NULL</b> to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1/nf-d3d10_1-id3d10device1-createshaderresourceview1
     */
    CreateShaderResourceView1(pResource, pDesc) {
        result := ComCall(98, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppSRView := 0, "HRESULT")
        return ID3D10ShaderResourceView1(ppSRView)
    }

    /**
     * Create a blend-state object that encapsules blend state for the output-merger stage.
     * @param {Pointer<D3D10_BLEND_DESC1>} pBlendStateDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ns-d3d10_1-d3d10_blend_desc1">D3D10_BLEND_DESC1</a>*</b>
     * 
     * Pointer to a blend-state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ns-d3d10_1-d3d10_blend_desc1">D3D10_BLEND_DESC1</a>).
     * @returns {ID3D10BlendState1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10blendstate1">ID3D10BlendState1</a>**</b>
     * 
     * Address of a pointer to the blend-state object created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10blendstate1">ID3D10BlendState1 Interface</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1/nf-d3d10_1-id3d10device1-createblendstate1
     */
    CreateBlendState1(pBlendStateDesc) {
        result := ComCall(99, this, "ptr", pBlendStateDesc, "ptr*", &ppBlendState := 0, "HRESULT")
        return ID3D10BlendState1(ppBlendState)
    }

    /**
     * Gets the feature level of the hardware device.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d3d10_1/ne-d3d10_1-d3d10_feature_level1">D3D10_FEATURE_LEVEL1</a></b>
     * 
     * The feature level (see <a href="/windows/desktop/api/d3d10_1/ne-d3d10_1-d3d10_feature_level1">D3D10_FEATURE_LEVEL1</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1/nf-d3d10_1-id3d10device1-getfeaturelevel
     */
    GetFeatureLevel() {
        result := ComCall(100, this, "int")
        return result
    }
}
