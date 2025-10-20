#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The default tracking interface sets reference default tracking options.
 * @remarks
 * 
  * These APIs require the Windows Software Development Kit (SDK) for Windows 8.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nn-d3d11sdklayers-id3d11refdefaulttrackingoptions
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11RefDefaultTrackingOptions extends IUnknown{
    /**
     * The interface identifier for ID3D11RefDefaultTrackingOptions
     * @type {Guid}
     */
    static IID => Guid("{03916615-c644-418c-9bf4-75db5be63ca0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ResourceTypeFlags 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetTrackingOptions(ResourceTypeFlags, Options) {
        result := ComCall(3, this, "uint", ResourceTypeFlags, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
