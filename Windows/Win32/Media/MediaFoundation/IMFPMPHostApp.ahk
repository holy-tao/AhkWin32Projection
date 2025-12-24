#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows a media source to create a Windows Runtime object in the Protected Media Path (PMP) process.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfpmphostapp
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMPHostApp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPMPHostApp
     * @type {Guid}
     */
    static IID => Guid("{84d2054a-3aa1-4728-a3b0-440a418cf49c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LockProcess", "UnlockProcess", "ActivateClassById"]

    /**
     * Blocks the protected media path (PMP) process from ending.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfpmphostapp-lockprocess
     */
    LockProcess() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Decrements the lock count on the protected media path (PMP) process. Call this method once for each call to IMFPMPHostApp::LockProcess.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfpmphostapp-unlockprocess
     */
    UnlockProcess() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Creates a Windows Runtime object in the protected media path (PMP) process.
     * @param {PWSTR} id Id of object to create.
     * @param {IStream} pStream Data to be passed to the object by way of a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface to retrieve.
     * @returns {Pointer<Void>} Receives a pointer to the created object.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfpmphostapp-activateclassbyid
     */
    ActivateClassById(id, pStream, riid) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(5, this, "ptr", id, "ptr", pStream, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
