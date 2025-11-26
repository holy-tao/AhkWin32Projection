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
     * Retrieves the amount of memory required for the specified runtime parameter resource for a meta command, for the specified stage.
     * @param {Integer} Stage Type: <b>D3D12_META_COMMAND_PARAMETER_STAGE</b>
     * 
     * A <b>D3D12_META_COMMAND_PARAMETER_STAGE</b> specifying the stage to which the parameter belongs.
     * @param {Integer} ParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based index of the parameter within the stage.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The number of bytes required for the  specified  runtime parameter resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12metacommand-getrequiredparameterresourcesize
     */
    GetRequiredParameterResourceSize(Stage, ParameterIndex) {
        result := ComCall(8, this, "int", Stage, "uint", ParameterIndex, "uint")
        return result
    }
}
