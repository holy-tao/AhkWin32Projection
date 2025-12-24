#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets and sets media types on an object, such as a media source or media sink.
 * @remarks
 * 
 * This interface is exposed by <i>media-type handlers</i>.
 * 
 * <ul>
 * <li> For media sources, get the media-type handler from the stream descriptor by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamdescriptor-getmediatypehandler">IMFStreamDescriptor::GetMediaTypeHandler</a>.</li>
 * <li>For media sinks, get the media-type handler by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-getmediatypehandler">IMFStreamSink::GetMediaTypeHandler</a>.</li>
 * </ul>
 * If you are implementing a custom media source or media sink, you can create a simple media-type handler by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesimpletypehandler">MFCreateSimpleTypeHandler</a>, or you can provide your own implementation.
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediatypehandler
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaTypeHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaTypeHandler
     * @type {Guid}
     */
    static IID => Guid("{e93dcf6c-4b07-4e1e-8123-aa16ed6eadf5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsMediaTypeSupported", "GetMediaTypeCount", "GetMediaTypeByIndex", "SetCurrentMediaType", "GetCurrentMediaType", "GetMajorType"]

    /**
     * Queries whether the object supports a specified media type.
     * @param {IMFMediaType} pMediaType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to check.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the closest matching media type, or receives the value <b>NULL</b>. If non-<b>NULL</b>, the caller must release the interface. This parameter can be <b>NULL</b>. See Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediatypehandler-ismediatypesupported
     */
    IsMediaTypeSupported(pMediaType) {
        result := ComCall(3, this, "ptr", pMediaType, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Retrieves the number of media types in the object's list of supported media types.
     * @returns {Integer} Receives the number of media types in the list.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediatypehandler-getmediatypecount
     */
    GetMediaTypeCount() {
        result := ComCall(4, this, "uint*", &pdwTypeCount := 0, "HRESULT")
        return pdwTypeCount
    }

    /**
     * Retrieves a media type from the object's list of supported media types.
     * @param {Integer} dwIndex Zero-based index of the media type to retrieve. To get the number of media types in the list, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-getmediatypecount">IMFMediaTypeHandler::GetMediaTypeCount</a>.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediatypehandler-getmediatypebyindex
     */
    GetMediaTypeByIndex(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Sets the object's media type.
     * @param {IMFMediaType} pMediaType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the new media type.
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid request.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediatypehandler-setcurrentmediatype
     */
    SetCurrentMediaType(pMediaType) {
        result := ComCall(6, this, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * Retrieves the current media type of the object.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediatypehandler-getcurrentmediatype
     */
    GetCurrentMediaType() {
        result := ComCall(7, this, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Gets the major media type of the object.
     * @returns {Guid} Receives a GUID that identifies the major type. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediatypehandler-getmajortype
     */
    GetMajorType() {
        pguidMajorType := Guid()
        result := ComCall(8, this, "ptr", pguidMajorType, "HRESULT")
        return pguidMajorType
    }
}
