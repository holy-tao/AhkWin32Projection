#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables an application to use a Media Foundation transform (MFT) that has restrictions on its use.
 * @remarks
 * 
 * If you register an MFT that requires unlocking, include the <b>MFT_ENUM_FLAG_FIELDOFUSE</b> flag when you call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregister">MFTRegister</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imffieldofusemftunlock
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFFieldOfUseMFTUnlock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFFieldOfUseMFTUnlock
     * @type {Guid}
     */
    static IID => Guid("{508e71d3-ec66-4fc3-8775-b4b9ed6ba847}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Unlock"]

    /**
     * Unlocks a Media Foundation transform (MFT) so that the application can use it.
     * @param {IUnknown} pUnkMFT A pointer to the <b>IUnknown</b> interface of the MFT.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imffieldofusemftunlock-unlock
     */
    Unlock(pUnkMFT) {
        result := ComCall(3, this, "ptr", pUnkMFT, "HRESULT")
        return result
    }
}
