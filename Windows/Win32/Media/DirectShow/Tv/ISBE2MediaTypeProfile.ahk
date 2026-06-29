#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements a media type profile.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2MediaTypeProfile)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-isbe2mediatypeprofile
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ISBE2MediaTypeProfile extends IUnknown {
    /**
     * The interface identifier for ISBE2MediaTypeProfile
     * @type {Guid}
     */
    static IID := Guid("{f238267d-4671-40d7-997e-25dc32cfed2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISBE2MediaTypeProfile interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStreamCount : IntPtr
        GetStream      : IntPtr
        AddStream      : IntPtr
        DeleteStream   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISBE2MediaTypeProfile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of streams in a media type profile.
     * @returns {Integer} Receives the number of streams in the profile.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2mediatypeprofile-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the media type of a stream that appears at a specific index in a media type profile.
     * @param {Integer} Index The index of the stream. To get the number of the streams in the profile, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-isbe2mediatypeprofile-getstreamcount">ISBE2MediaTypeProfile::GetStreamCount</a> method.
     * @returns {Pointer<AM_MEDIA_TYPE>} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure. The caller must not modify this structure or release the memory allocated for it.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2mediatypeprofile-getstream
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2mediatypeprofile-addstream
     */
    AddStream(pMediaType) {
        result := ComCall(5, this, AM_MEDIA_TYPE.Ptr, pMediaType, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2mediatypeprofile-deletestream
     */
    DeleteStream(Index) {
        result := ComCall(6, this, "uint", Index, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISBE2MediaTypeProfile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStreamCount := CallbackCreate(GetMethod(implObj, "GetStreamCount"), flags, 2)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 3)
        this.vtbl.AddStream := CallbackCreate(GetMethod(implObj, "AddStream"), flags, 2)
        this.vtbl.DeleteStream := CallbackCreate(GetMethod(implObj, "DeleteStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStreamCount)
        CallbackFree(this.vtbl.GetStream)
        CallbackFree(this.vtbl.AddStream)
        CallbackFree(this.vtbl.DeleteStream)
    }
}
