#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets and sets media types on an object, such as a media source or media sink.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfmediatypehandler
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
     * @remarks
     * If the object supports the media type given in <i>pMediaType</i>, the method returns <b>S_OK</b>. For a media source, it means the source can generate data that conforms to that media type. For a media sink, it means the sink can receive data that conforms to that media type. If the object does not support the media type, the method fails.
     *       
     * 
     * The <i>ppMediaType</i> parameter is optional. If the method fails, the object might use <i>ppMediaType</i> to return a media type that the object does support, and which closely matches the one given in <i>pMediaType</i>. The method is not guaranteed to return a media type in <i>ppMediaType</i>. If no type is returned, this parameter receives a <b>NULL</b> pointer. If the method succeeds, this parameter receives a <b>NULL</b> pointer. If the caller sets <i>ppMediaType</i> to <b>NULL</b>, this parameter is ignored.
     *       
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with SP2 and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {IMFMediaType} pMediaType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to check.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the closest matching media type, or receives the value <b>NULL</b>. If non-<b>NULL</b>, the caller must release the interface. This parameter can be <b>NULL</b>. See Remarks.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediatypehandler-ismediatypesupported
     */
    IsMediaTypeSupported(pMediaType) {
        result := ComCall(3, this, "ptr", pMediaType, "ptr*", &ppMediaType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFMediaType(ppMediaType)
    }

    /**
     * Retrieves the number of media types in the object's list of supported media types.
     * @remarks
     * To get the supported media types, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-getmediatypebyindex">IMFMediaTypeHandler::GetMediaTypeByIndex</a>.
     *       
     * 
     * For a media source, the media type handler for each stream must contain at least one supported media type. For media sinks, the media type handler for each stream might contain zero media types. In that case, the application must provide the media type. To test whether a particular media type is supported, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-ismediatypesupported">IMFMediaTypeHandler::IsMediaTypeSupported</a>.
     *       
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the number of media types in the list.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediatypehandler-getmediatypecount
     */
    GetMediaTypeCount() {
        result := ComCall(4, this, "uint*", &pdwTypeCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwTypeCount
    }

    /**
     * Retrieves a media type from the object's list of supported media types.
     * @remarks
     * Media types are returned in the approximate order of preference. The list of supported types is not guaranteed to be complete. To test whether a particular media type is supported, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-ismediatypesupported">IMFMediaTypeHandler::IsMediaTypeSupported</a>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} dwIndex Zero-based index of the media type to retrieve. To get the number of media types in the list, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-getmediatypecount">IMFMediaTypeHandler::GetMediaTypeCount</a>.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediatypehandler-getmediatypebyindex
     */
    GetMediaTypeByIndex(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "ptr*", &ppType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFMediaType(ppType)
    }

    /**
     * Sets the object's media type.
     * @remarks
     * For media sources, setting the media type means the source will generate data that conforms to that media type. For media sinks, setting the media type means the sink can receive data that conforms to that media type.
     * 
     * Any implementation of this method should check whether <i>pMediaType</i> differs from the object's current media type. If the types are identical, the method should return S_OK but avoid releasing and recreating resources unnecessarily. If the types are not identical, the method should validate the new type.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediatypehandler-setcurrentmediatype
     */
    SetCurrentMediaType(pMediaType) {
        result := ComCall(6, this, "ptr", pMediaType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the current media type of the object.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediatypehandler-getcurrentmediatype
     */
    GetCurrentMediaType() {
        result := ComCall(7, this, "ptr*", &ppMediaType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFMediaType(ppMediaType)
    }

    /**
     * Gets the major media type of the object.
     * @remarks
     * The major type identifies what kind of data is in the stream, such as audio or video. To get the specific details of the format, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-getcurrentmediatype">IMFMediaTypeHandler::GetCurrentMediaType</a>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Guid} Receives a GUID that identifies the major type. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediatypehandler-getmajortype
     */
    GetMajorType() {
        pguidMajorType := Guid()
        result := ComCall(8, this, "ptr", pguidMajorType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pguidMajorType
    }
}
