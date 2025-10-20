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
     * 
     * @returns {HRESULT} 
     */
    LockProcess() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockProcess() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} id 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    ActivateClassById(id, pStream, riid, ppv) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(5, this, "ptr", id, "ptr", pStream, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
