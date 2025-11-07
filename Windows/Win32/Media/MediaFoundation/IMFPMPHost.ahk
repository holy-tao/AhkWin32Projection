#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a media source in the application process to create objects in the protected media path (PMP) process.
 * @remarks
 * 
  * This interface is used when a media source resides in the application process but the Media Session resides in a PMP process. The media source can use this interface to create objects in the PMP process. For example, to play DRM-protected content, the media source typically must create an input trust authority (ITA) in the PMP process. 
  * 
  * To use this interface, the media source implements the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpmpclient">IMFPMPClient</a> interface. The PMP Media Session calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpmpclient-setpmphost">IMFPMPClient::SetPMPHost</a> on the media source, passing in a pointer to the <b>IMFPMPHost</b> interface.
  * 
  * You can also get a pointer to this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> on the PMP Media Session, using the service identifier <b>MF_PMP_SERVICE</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfpmphost
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMPHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPMPHost
     * @type {Guid}
     */
    static IID => Guid("{f70ca1a9-fdc7-4782-b994-adffb1c98606}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LockProcess", "UnlockProcess", "CreateObjectByCLSID"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphost-lockprocess
     */
    LockProcess() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphost-unlockprocess
     */
    UnlockProcess() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {IStream} pStream 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmphost-createobjectbyclsid
     */
    CreateObjectByCLSID(clsid, pStream, riid) {
        result := ComCall(5, this, "ptr", clsid, "ptr", pStream, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
