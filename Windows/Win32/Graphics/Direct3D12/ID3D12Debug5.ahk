#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Debug4.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug5 extends ID3D12Debug4{
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
     * 
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     */
    SetEnableAutoName(Enable) {
        ComCall(8, this, "int", Enable)
        return result
    }
}
