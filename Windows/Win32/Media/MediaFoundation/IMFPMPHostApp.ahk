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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphostapp-lockprocess
     */
    LockProcess() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphostapp-unlockprocess
     */
    UnlockProcess() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} id 
     * @param {IStream} pStream 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphostapp-activateclassbyid
     */
    ActivateClassById(id, pStream, riid) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(5, this, "ptr", id, "ptr", pStream, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
