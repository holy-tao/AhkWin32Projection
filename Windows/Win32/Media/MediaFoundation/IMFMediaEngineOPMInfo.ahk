#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for getting information about the Output Protection Manager (OPM).
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the Media Engine.
 * 
 * The <b>MF_MEDIA_ENGINE_EVENT_OPMINFO</b> <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> event is raised when there is a change in the OPM status.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengineopminfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineOPMInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineOPMInfo
     * @type {Guid}
     */
    static IID => Guid("{765763e6-6c01-4b01-bb0f-b829f60ed28c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOPMInfo"]

    /**
     * Gets status information about the Output Protection Manager (OPM).
     * @param {Pointer<Integer>} pStatus A pointer to a <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-opm-status">MF_MEDIA_ENGINE_OPM_STATUS</a> enum type that indicates the OPM status.
     * @param {Pointer<BOOL>} pConstricted A pointer to a <b>BOOL</b> type that indicates the constriction status.
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
     * The method succeeded
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If any of the parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineopminfo-getopminfo
     */
    GetOPMInfo(pStatus, pConstricted) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        pConstrictedMarshal := pConstricted is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pStatusMarshal, pStatus, pConstrictedMarshal, pConstricted, "HRESULT")
        return result
    }
}
