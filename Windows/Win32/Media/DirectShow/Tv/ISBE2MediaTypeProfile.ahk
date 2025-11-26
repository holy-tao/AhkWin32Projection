#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements a media type profile.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2MediaTypeProfile)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2mediatypeprofile
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2MediaTypeProfile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISBE2MediaTypeProfile
     * @type {Guid}
     */
    static IID => Guid("{f238267d-4671-40d7-997e-25dc32cfed2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetStream", "AddStream", "DeleteStream"]

    /**
     * Gets the number of streams in a media type profile.
     * @returns {Integer} Receives the number of streams in the profile.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2mediatypeprofile-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the media type of a stream that appears at a specific index in a media type profile.
     * @param {Integer} Index The index of the stream. To get the number of the streams in the profile, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-isbe2mediatypeprofile-getstreamcount">ISBE2MediaTypeProfile::GetStreamCount</a> method.
     * @returns {Pointer<AM_MEDIA_TYPE>} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure. The caller must not modify this structure or release the memory allocated for it.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2mediatypeprofile-getstream
     */
    GetStream(Index) {
        result := ComCall(4, this, "uint", Index, "ptr*", &ppMediaType := 0, "HRESULT")
        return ppMediaType
    }

    /**
     * Adds a stream to a media type profile.
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type of the stream that is added to the profile.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2mediatypeprofile-addstream
     */
    AddStream(pMediaType) {
        result := ComCall(5, this, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * Removes a stream from a media type profile.
     * @param {Integer} Index The index of the stream to remove. To get the number of the streams in the profile, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-isbe2mediatypeprofile-getstreamcount">ISBE2MediaTypeProfile::GetStreamCount</a> method.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2mediatypeprofile-deletestream
     */
    DeleteStream(Index) {
        result := ComCall(6, this, "uint", Index, "HRESULT")
        return result
    }
}
