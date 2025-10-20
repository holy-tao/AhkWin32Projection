#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceChild.ahk

/**
 * An interface from which ID3D12GraphicsCommandList inherits from. It represents an ordered set of commands that the GPU executes, while allowing for extension to support other command lists than just those for graphics (such as compute and copy).
 * @remarks
 * 
  * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommandlist">ID3D12Device::CreateCommandList</a> to create a command list object.
  *       
  * 
  * See also <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12graphicscommandlist">ID3D12GraphicsCommandList</a>, which derives from ID3D12CommandList.
  *       
  * 
  * A command list corresponds to a set of commands that the graphics processing unit (GPU) executes.  Commands set state, draw, clear, copy, and so on.  
  * 
  * Direct3D 12 command lists only support these 2 levels of indirection:
  *           
  * 
  * <ul>
  * <li>A direct command list corresponds to a command buffer that the GPU can execute.
  *           </li>
  * <li>A bundle can be executed only directly via a direct command list.
  *           </li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12commandlist
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12CommandList extends ID3D12DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12CommandList
     * @type {Guid}
     */
    static IID => Guid("{7116d91c-e7e4-47ce-b8c6-ec8168f437e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandlist-gettype
     */
    GetType() {
        result := ComCall(8, this, "int")
        return result
    }
}
