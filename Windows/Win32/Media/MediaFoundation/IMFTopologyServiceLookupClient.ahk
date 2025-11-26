#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Initializes a video mixer or presenter.
 * @remarks
 * 
 * When the EVR loads the video mixer and the video presenter, the EVR queries the object for this interface and calls <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imftopologyservicelookupclient-initservicepointers">InitServicePointers</a>. Inside the <b>InitServicePointers</b> method, the object can query the EVR for interface pointers.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imftopologyservicelookupclient
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTopologyServiceLookupClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTopologyServiceLookupClient
     * @type {Guid}
     */
    static IID => Guid("{fa99388a-4383-415a-a930-dd472a8cf6f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitServicePointers", "ReleaseServicePointers"]

    /**
     * Signals the mixer or presenter to query the enhanced video renderer (EVR) for interface pointers.
     * @param {IMFTopologyServiceLookup} pLookup Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imftopologyservicelookup">IMFTopologyServiceLookup</a> interface. To query the EVR for an interface, call <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imftopologyservicelookup-lookupservice">IMFTopologyServiceLookup::LookupService</a>.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imftopologyservicelookupclient-initservicepointers
     */
    InitServicePointers(pLookup) {
        result := ComCall(3, this, "ptr", pLookup, "HRESULT")
        return result
    }

    /**
     * Signals the object to release the interface pointers obtained from the enhanced video renderer (EVR).
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imftopologyservicelookupclient-releaseservicepointers
     */
    ReleaseServicePointers() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
