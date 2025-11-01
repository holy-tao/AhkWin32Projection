#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Debug3.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug4
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug4 extends ID3D12Debug3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Debug4
     * @type {Guid}
     */
    static IID => Guid("{014b816e-9ec5-4a2f-a845-ffbe441ce13a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DisableDebugLayer"]

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug4-disabledebuglayer
     */
    DisableDebugLayer() {
        ComCall(7, this)
    }
}
