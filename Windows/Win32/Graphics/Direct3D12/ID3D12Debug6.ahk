#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Debug5.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug6
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug6 extends ID3D12Debug5{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetForceLegacyBarrierValidation"]

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug6-setforcelegacybarriervalidation
     */
    SetForceLegacyBarrierValidation(Enable) {
        ComCall(9, this, "int", Enable)
    }
}
