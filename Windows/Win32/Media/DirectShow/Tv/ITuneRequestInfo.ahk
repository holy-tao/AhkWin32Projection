#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuneRequest.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The ITuneRequestInfo interface is implemented on the BDA MPEG2 Transport Information Filter (TIF) and is used by the Network Provider.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuneRequestInfo)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdatif/nn-bdatif-itunerequestinfo
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITuneRequestInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITuneRequestInfo
     * @type {Guid}
     */
    static IID => Guid("{a3b152df-7a90-4218-ac54-9830bee8c0b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocatorData", "GetComponentData", "CreateComponentList", "GetNextProgram", "GetPreviousProgram", "GetNextLocator", "GetPreviousLocator"]

    /**
     * The GetLocatorData method fills in channel or program locator information for the specified tune request.
     * @param {ITuneRequest} Request Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface on the tune request.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * The method succeeded and new locator data was acquired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded but no new locator data was acquired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>Request</i> is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-itunerequestinfo-getlocatordata
     */
    GetLocatorData(Request) {
        result := ComCall(3, this, "ptr", Request, "HRESULT")
        return result
    }

    /**
     * The GetComponentData method fills in all network-specific component data for the existing Components collection on the specified tune request.
     * @param {ITuneRequest} CurrentRequest Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface on the tune request.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * The method succeeded and new data was added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded but no new data was added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-itunerequestinfo-getcomponentdata
     */
    GetComponentData(CurrentRequest) {
        result := ComCall(4, this, "ptr", CurrentRequest, "HRESULT")
        return result
    }

    /**
     * The CreateComponentList method creates a new Components collection for the tune request, and fills it in with all network-specific data after the receiver has tuned to the service.
     * @param {ITuneRequest} CurrentRequest Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface on the tune request.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * The method succeeded and new data was added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded but no new data was added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data could be acquired.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-itunerequestinfo-createcomponentlist
     */
    CreateComponentList(CurrentRequest) {
        result := ComCall(5, this, "ptr", CurrentRequest, "HRESULT")
        return result
    }

    /**
     * The GetNextProgram method creates a new tune request with channel or program locator information for the next service.
     * @param {ITuneRequest} CurrentRequest Specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface of the current request.
     * @returns {ITuneRequest} Pointer to a variable that will receive a tune request for the next service on the transport stream.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-itunerequestinfo-getnextprogram
     */
    GetNextProgram(CurrentRequest) {
        result := ComCall(6, this, "ptr", CurrentRequest, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }

    /**
     * The GetPreviousProgram method creates a new tune request with channel or program locator information for the previous service.
     * @param {ITuneRequest} CurrentRequest Specifies the current request.
     * @returns {ITuneRequest} Pointer to a variable that receives a tune request for the previous service in the current transport stream.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-itunerequestinfo-getpreviousprogram
     */
    GetPreviousProgram(CurrentRequest) {
        result := ComCall(7, this, "ptr", CurrentRequest, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }

    /**
     * The GetNextLocator method creates a new tune request with locator information for the next transport stream on the network.
     * @param {ITuneRequest} CurrentRequest Specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface of the current tune request. <b>NULL</b> means to return information for the first stream.
     * @returns {ITuneRequest} Pointer to a variable that receives a tune request for the next transport stream.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-itunerequestinfo-getnextlocator
     */
    GetNextLocator(CurrentRequest) {
        result := ComCall(8, this, "ptr", CurrentRequest, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }

    /**
     * The GetPreviousLocator method creates a new tune request with locator information for the previous transport stream.
     * @param {ITuneRequest} CurrentRequest Specifies current request.
     * @returns {ITuneRequest} Pointer to a variable that receives the tune request for the previous transport stream in the network.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-itunerequestinfo-getpreviouslocator
     */
    GetPreviousLocator(CurrentRequest) {
        result := ComCall(9, this, "ptr", CurrentRequest, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }
}
