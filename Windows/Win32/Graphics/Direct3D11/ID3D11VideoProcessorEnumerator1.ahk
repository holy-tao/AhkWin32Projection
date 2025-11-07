#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11VideoProcessorEnumerator.ahk

/**
 * Enumerates the video processor capabilities of a Microsoft Direct3D 11 device.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorenumerator">ID3D11VideoDevice::CreateVideoProcessorEnumerator</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nn-d3d11_1-id3d11videoprocessorenumerator1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoProcessorEnumerator1 extends ID3D11VideoProcessorEnumerator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoProcessorEnumerator1
     * @type {Guid}
     */
    static IID => Guid("{465217f2-5568-43cf-b5b9-f61d54531ca1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckVideoProcessorFormatConversion"]

    /**
     * 
     * @param {Integer} InputFormat 
     * @param {Integer} InputColorSpace 
     * @param {Integer} OutputFormat 
     * @param {Integer} OutputColorSpace 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videoprocessorenumerator1-checkvideoprocessorformatconversion
     */
    CheckVideoProcessorFormatConversion(InputFormat, InputColorSpace, OutputFormat, OutputColorSpace) {
        result := ComCall(13, this, "int", InputFormat, "int", InputColorSpace, "int", OutputFormat, "int", OutputColorSpace, "int*", &pSupported := 0, "HRESULT")
        return pSupported
    }
}
