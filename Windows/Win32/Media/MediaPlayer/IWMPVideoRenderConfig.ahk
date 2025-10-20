#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPVideoRenderConfig interface provides a method that configures the enhanced video renderer (EVR) used by Windows Media Player.
 * @see https://docs.microsoft.com/windows/win32/api//wmprealestate/nn-wmprealestate-iwmpvideorenderconfig
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPVideoRenderConfig extends IUnknown{
    /**
     * The interface identifier for IWMPVideoRenderConfig
     * @type {Guid}
     */
    static IID => Guid("{6d6cf803-1ec0-4c8d-b3ca-f18e27282074}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFActivate>} pActivate 
     * @returns {HRESULT} 
     */
    put_presenterActivate(pActivate) {
        result := ComCall(3, this, "ptr", pActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
