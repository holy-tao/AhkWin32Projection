#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DeviceChild.ahk

/**
 * An input-layout interface accesses the input data for the input-assembler stage.
 * @remarks
 * 
 * This interface is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createinputlayout">ID3D10Device::CreateInputLayout</a>; use <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetinputlayout">ID3D10Device::IASetInputLayout</a> to bind it to the graphics pipeline.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10inputlayout
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10InputLayout extends ID3D10DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10InputLayout
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c0b-342c-4106-a19f-4f2704f689f0}")

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
