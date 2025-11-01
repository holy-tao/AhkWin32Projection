#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a media source to receive a pointer to the IMFPMPHost interface.
 * @remarks
 * 
  * If a media source exposes this interface, the Protected Media Path (PMP) Media Session calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpmpclient-setpmphost">SetPMPHost</a> with a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpmphost">IMFPMPHost</a> interface. The media source can use the <b>IMFPMPHost</b> interface to create objects in the PMP process.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfpmpclient
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMPClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPMPClient
     * @type {Guid}
     */
    static IID => Guid("{6c4e655d-ead8-4421-b6b9-54dcdbbdf820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPMPHost"]

    /**
     * 
     * @param {IMFPMPHost} pPMPHost 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmpclient-setpmphost
     */
    SetPMPHost(pPMPHost) {
        result := ComCall(3, this, "ptr", pPMPHost, "HRESULT")
        return result
    }
}
