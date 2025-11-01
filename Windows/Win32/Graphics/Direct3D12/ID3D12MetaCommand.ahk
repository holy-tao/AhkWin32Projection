#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * Represents a meta command. A meta command is a Direct3D 12 object representing an algorithm that is accelerated by independent hardware vendors (IHVs). It's an opaque reference to a command generator that is implemented by the driver.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12metacommand
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12MetaCommand extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12MetaCommand
     * @type {Guid}
     */
    static IID => Guid("{dbb84c27-36ce-4fc9-b801-f048c46ac570}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRequiredParameterResourceSize"]

    /**
     * 
     * @param {Integer} Stage 
     * @param {Integer} ParameterIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12metacommand-getrequiredparameterresourcesize
     */
    GetRequiredParameterResourceSize(Stage, ParameterIndex) {
        result := ComCall(8, this, "int", Stage, "uint", ParameterIndex, "uint")
        return result
    }
}
