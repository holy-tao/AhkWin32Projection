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
     * 
     * @param {Integer} uOptions 
     * @returns {HRESULT} 
     */
    SetTrackingOptions(uOptions) {
        result := ComCall(3, this, "uint", uOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
