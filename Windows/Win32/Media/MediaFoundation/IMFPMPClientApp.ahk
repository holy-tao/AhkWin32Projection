#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a mechanism for a media source to implement content protection functionality in a Windows Store apps.
 * @remarks
 * 
  * <b>When to implement:</b> 
  * A media source implements <b>IMFPMPClientApp</b> in order to implement content protection functionality for Windows Store apps.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfpmpclientapp
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMPClientApp extends IUnknown{
    /**
     * The interface identifier for IMFPMPClientApp
     * @type {Guid}
     */
    static IID => Guid("{c004f646-be2c-48f3-93a2-a0983eba1108}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFPMPHostApp>} pPMPHost 
     * @returns {HRESULT} 
     */
    SetPMPHost(pPMPHost) {
        result := ComCall(3, this, "ptr", pPMPHost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
