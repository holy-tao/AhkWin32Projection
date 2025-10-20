#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Debug4.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug5
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug5 extends ID3D12Debug4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Debug5
     * @type {Guid}
     */
    static IID => Guid("{548d6b12-09fa-40e0-9069-5dcd589a52c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetEnableAutoName"]

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug5-setenableautoname
     */
    SetEnableAutoName(Enable) {
        ComCall(8, this, "int", Enable)
    }
}
