#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMSVidPlayback.ahk" { IMSVidPlayback }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IMSVidFilePlayback interface enables the client to specify a local file for playback. It is implemented by the MSVidFilePlaybackDevice object.
 * @remarks
 * To play a media file using the Video Control, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method with the name of the file. The <b>View</b> method automatically loads the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidfileplaybackdevice">MSVidFilePlayback</a> object.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidFilePlayback)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidfileplayback
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidFilePlayback extends IMSVidPlayback {
    /**
     * The interface identifier for IMSVidFilePlayback
     * @type {Guid}
     */
    static IID := Guid("{37b03539-a4c8-11d2-b634-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidFilePlayback interfaces
    */
    struct Vtbl extends IMSVidPlayback.Vtbl {
        get_FileName : IntPtr
        put_FileName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidFilePlayback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    FileName {
        get => this.get_FileName()
        set => this.put_FileName(value)
    }

    /**
     * The get_FileName method retrieves the name of the file to play.
     * @remarks
     * The caller must release the returned string, using the <b>CoTaskMemFree</b> function.
     * @returns {BSTR} Pointer to a variable that receives the file name.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidfileplayback-get_filename
     */
    get_FileName() {
        FileName := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, FileName, "HRESULT")
        return FileName
    }

    /**
     * The put_FileName method sets the name of the file to play.
     * @param {BSTR} FileName Specifies the file name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include the following.
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidfileplayback-put_filename
     */
    put_FileName(FileName) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(33, this, BSTR, FileName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidFilePlayback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_FileName := CallbackCreate(GetMethod(implObj, "get_FileName"), flags, 2)
        this.vtbl.put_FileName := CallbackCreate(GetMethod(implObj, "put_FileName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_FileName)
        CallbackFree(this.vtbl.put_FileName)
    }
}
