#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DebugCommandQueue.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DebugCommandQueue1 extends ID3D12DebugCommandQueue{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DebugCommandQueue1
     * @type {Guid}
     */
    static IID => Guid("{16be35a2-bfd6-49f2-bcae-eaae4aff862d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssertResourceAccess", "AssertTextureLayout"]

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Integer} Subresource 
     * @param {Integer} Access 
     * @returns {String} Nothing - always returns an empty string
     */
    AssertResourceAccess(pResource, Subresource, Access) {
        ComCall(4, this, "ptr", pResource, "uint", Subresource, "int", Access)
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Integer} Subresource 
     * @param {Integer} Layout 
     * @returns {String} Nothing - always returns an empty string
     */
    AssertTextureLayout(pResource, Subresource, Layout) {
        ComCall(5, this, "ptr", pResource, "uint", Subresource, "int", Layout)
    }
}
