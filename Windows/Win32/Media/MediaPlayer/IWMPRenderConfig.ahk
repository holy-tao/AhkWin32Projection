#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPRenderConfig interface provides methods to specify or retrieve a value indicating whether Media Foundation&#8211;based playback is restricted to the current process.Note  Using this interface with protected content is not supported. .
 * @see https://docs.microsoft.com/windows/win32/api//wmprealestate/nn-wmprealestate-iwmprenderconfig
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPRenderConfig extends IUnknown{
    /**
     * The interface identifier for IWMPRenderConfig
     * @type {Guid}
     */
    static IID => Guid("{959506c1-0314-4ec5-9e61-8528db5e5478}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} fInProc 
     * @returns {HRESULT} 
     */
    put_inProcOnly(fInProc) {
        result := ComCall(3, this, "int", fInProc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfInProc 
     * @returns {HRESULT} 
     */
    get_inProcOnly(pfInProc) {
        result := ComCall(4, this, "ptr", pfInProc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
