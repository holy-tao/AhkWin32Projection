#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Debug5.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug6 extends ID3D12Debug5{
    /**
     * The interface identifier for ID3D12Debug6
     * @type {Guid}
     */
    static IID => Guid("{82a816d6-5d01-4157-97d0-4975463fd1ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     */
    SetForceLegacyBarrierValidation(Enable) {
        ComCall(9, this, "int", Enable)
        return result
    }
}
