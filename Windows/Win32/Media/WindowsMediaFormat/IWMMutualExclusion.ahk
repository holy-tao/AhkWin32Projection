#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMStreamList.ahk" { IWMStreamList }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMMutualExclusion interface represents a group of streams, of which only one at a time can be played.IWMMutualExclusion is the base interface for mutual exclusion objects.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmmutualexclusion
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMMutualExclusion extends IWMStreamList {
    /**
     * The interface identifier for IWMMutualExclusion
     * @type {Guid}
     */
    static IID := Guid("{96406bde-2b2b-11d3-b36b-00c04f6108ff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMMutualExclusion interfaces
    */
    struct Vtbl extends IWMStreamList.Vtbl {
        GetType : IntPtr
        SetType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMMutualExclusion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetType method retrieves the GUID of the type of mutual exclusion required.
     * @remarks
     * The following constants represent the GUIDs supported by this SDK.
     * 
     * <table>
     * <tr>
     * <th>Mutual exclusion type identifier
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>CLSID_WMMUTEX_Bitrate</td>
     * <td>The mutual exclusion streams differ only in bit rate. On playback, the stream that will best use the available bandwidth is chosen. You must use this type of mutual exclusion for multiple bit rate files.</td>
     * </tr>
     * <tr>
     * <td>CLSID_WMMUTEX_Language</td>
     * <td>The mutual exclusion streams are the same content only in a different language. A common use of this type of mutual exclusion is for dubbing soundtracks into multiple languages.</td>
     * </tr>
     * <tr>
     * <td>CLSID_WMMUTEX_Presentation</td>
     * <td>The mutual exclusion streams are the same video in a different presentation format. The presentation format is usually defined by the aspect ratio of the video frame.</td>
     * </tr>
     * <tr>
     * <td>CLSID_WMMUTEX_Unknown</td>
     * <td>The mutual exclusion streams are of a custom type. This sort of mutual exclusion can contain streams of varying types.</td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  If you create a multiple bit rate audio file, you may encounter problems streaming the file from Windows Media Services 4.1. To avoid problems, disable auto indexing with a call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setautoindexing">IWMWriterFileSink3::SetAutoIndexing</a> before writing the file.</div>
     * <div> </div>
     * @returns {Guid} Pointer to a GUID that specifies the type of mutual exclusion.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion-gettype
     */
    GetType() {
        pguidType := Guid()
        result := ComCall(6, this, Guid.Ptr, pguidType, "HRESULT")
        return pguidType
    }

    /**
     * The SetType method specifies the GUID of the type of mutual exclusion required.
     * @remarks
     * If you create a multiple bit rate audio file, you may encounter problems streaming the file from Windows Media Services 4.1. To avoid problems, disable auto indexing by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setautoindexing">IWMWriterFileSink3::SetAutoIndexing</a> before writing the file.
     * @param {Pointer<Guid>} guidType GUID specifying the type of mutual exclusion. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion-gettype">IWMMutualExclusion::GetType</a>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion-settype
     */
    SetType(guidType) {
        result := ComCall(7, this, Guid.Ptr, guidType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMMutualExclusion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.SetType := CallbackCreate(GetMethod(implObj, "SetType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.SetType)
    }
}
