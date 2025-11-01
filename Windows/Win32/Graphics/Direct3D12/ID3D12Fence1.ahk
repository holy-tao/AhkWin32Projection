#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Fence.ahk

/**
 * Represents a fence. This interface extends ID3D12Fence, and supports the retrieval of the flags used to create the original fence.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12fence1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Fence1 extends ID3D12Fence{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Fence1
     * @type {Guid}
     */
    static IID => Guid("{433685fe-e22b-4ca0-a8db-b5b4f4dd0e4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCreationFlags"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12fence1-getcreationflags
     */
    GetCreationFlags() {
        result := ComCall(11, this, "int")
        return result
    }
}
