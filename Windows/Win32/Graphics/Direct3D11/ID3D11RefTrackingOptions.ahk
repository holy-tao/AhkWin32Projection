#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The tracking interface sets reference tracking options.
 * @remarks
 * 
 * These APIs require the Windows Software Development Kit (SDK) for Windows 8.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nn-d3d11sdklayers-id3d11reftrackingoptions
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11RefTrackingOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11RefTrackingOptions
     * @type {Guid}
     */
    static IID => Guid("{193dacdf-0db2-4c05-a55c-ef06cac56fd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTrackingOptions"]

    /**
     * 
     * @param {Integer} uOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11reftrackingoptions-settrackingoptions
     */
    SetTrackingOptions(uOptions) {
        result := ComCall(3, this, "uint", uOptions, "HRESULT")
        return result
    }
}
