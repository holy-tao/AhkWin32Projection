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
     * 
     * @param {ID3D10Resource} pResource 
     * @param {Pointer<D3D10_SHADER_RESOURCE_VIEW_DESC1>} pDesc 
     * @returns {ID3D10ShaderResourceView1} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1/nf-d3d10_1-id3d10device1-createshaderresourceview1
     */
    CreateShaderResourceView1(pResource, pDesc) {
        result := ComCall(98, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppSRView := 0, "HRESULT")
        return ID3D10ShaderResourceView1(ppSRView)
    }

    /**
     * 
     * @param {Pointer<D3D10_BLEND_DESC1>} pBlendStateDesc 
     * @returns {ID3D10BlendState1} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1/nf-d3d10_1-id3d10device1-createblendstate1
     */
    CreateBlendState1(pBlendStateDesc) {
        result := ComCall(99, this, "ptr", pBlendStateDesc, "ptr*", &ppBlendState := 0, "HRESULT")
        return ID3D10BlendState1(ppBlendState)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1/nf-d3d10_1-id3d10device1-getfeaturelevel
     */
    GetFeatureLevel() {
        result := ComCall(100, this, "int")
        return result
    }
}
