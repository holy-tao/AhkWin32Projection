#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DeviceChild.ahk

/**
 * A resource interface provides common actions on all resources.
 * @remarks
 * 
  * A resource interface cannot be created directly; instead, <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">buffers</a> and textures are created that inherit from a resource interface (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating">Creating Buffer Resources</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating-textures">Creating Texture Resources</a>).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10resource
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Resource extends ID3D10DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Resource
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c01-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "SetEvictionPriority", "GetEvictionPriority"]

    /**
     * 
     * @param {Pointer<Integer>} rType 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10resource-gettype
     */
    GetType(rType) {
        rTypeMarshal := rType is VarRef ? "int*" : "ptr"

        ComCall(7, this, rTypeMarshal, rType)
    }

    /**
     * 
     * @param {Integer} EvictionPriority 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10resource-setevictionpriority
     */
    SetEvictionPriority(EvictionPriority) {
        ComCall(8, this, "uint", EvictionPriority)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10resource-getevictionpriority
     */
    GetEvictionPriority() {
        result := ComCall(9, this, "uint")
        return result
    }
}
