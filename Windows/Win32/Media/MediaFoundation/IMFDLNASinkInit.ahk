#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFByteStream.ahk" { IMFByteStream }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Initializes the Digital Living Network Alliance (DLNA) media sink. (IMFDLNASinkInit)
 * @see https://learn.microsoft.com/windows/win32/api/mfmp2dlna/nn-mfmp2dlna-imfdlnasinkinit
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFDLNASinkInit extends IUnknown {
    /**
     * The interface identifier for IMFDLNASinkInit
     * @type {Guid}
     */
    static IID := Guid("{0c012799-1b61-4c10-bda9-04445be5f561}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFDLNASinkInit interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFDLNASinkInit.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the Digital Living Network Alliance (DLNA) media sink. (IMFDLNASinkInit.Initialize)
     * @param {IMFByteStream} pByteStream Pointer to a byte stream. The DLNA media sink writes data to this byte stream. The byte stream must be writable.
     * @param {BOOL} fPal If <b>TRUE</b>, the DLNA media sink accepts PAL video formats. Otherwise, it accepts NTSC video  formats.
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
     * <dt><b><b>MF_E_ALREADY_INITIALIZED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was already called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">IMFMediaSink::Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfmp2dlna/nf-mfmp2dlna-imfdlnasinkinit-initialize
     */
    Initialize(pByteStream, fPal) {
        result := ComCall(3, this, "ptr", pByteStream, BOOL, fPal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFDLNASinkInit.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
