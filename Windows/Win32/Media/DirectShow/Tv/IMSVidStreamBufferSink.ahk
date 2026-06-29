#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidOutputDevice.ahk" { IMSVidOutputDevice }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMSVidStreamBufferRecordingControl.ahk" { IMSVidStreamBufferRecordingControl }

/**
 * The IMSVidStreamBufferSink interface represents the Stream Buffer Sink filter within the Video Control.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSink)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambuffersink
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferSink extends IMSVidOutputDevice {
    /**
     * The interface identifier for IMSVidStreamBufferSink
     * @type {Guid}
     */
    static IID := Guid("{159dbb45-cd1b-4dab-83ea-5cb1f4f21d07}")

    /**
     * The class identifier for MSVidStreamBufferSink
     * @type {Guid}
     */
    static CLSID := Guid("{9e77aac4-35e5-42a1-bdc2-8f3ff399847c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferSink interfaces
    */
    struct Vtbl extends IMSVidOutputDevice.Vtbl {
        get_ContentRecorder   : IntPtr
        get_ReferenceRecorder : IntPtr
        get_SinkName          : IntPtr
        put_SinkName          : IntPtr
        NameSetLock           : IntPtr
        get_SBESink           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    SinkName {
        get => this.get_SinkName()
        set => this.put_SinkName(value)
    }

    /**
     * @type {IUnknown} 
     */
    SBESink {
        get => this.get_SBESink()
    }

    /**
     * The get_ContentRecorder method creates a new content recording object.
     * @remarks
     * The caller must release the returned <a href="https://docs.microsoft.com/windows/desktop/api/segment/nn-segment-imsvidstreambufferrecordingcontrol">IMSVidStreamBufferRecordingControl</a> interface.
     * @param {BSTR} pszFilename Specifies the name of the file to hold the recording.
     * @returns {IMSVidStreamBufferRecordingControl} Receives a pointer to the recording object's <a href="https://docs.microsoft.com/windows/desktop/api/segment/nn-segment-imsvidstreambufferrecordingcontrol">IMSVidStreamBufferRecordingControl</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-get_contentrecorder
     */
    get_ContentRecorder(pszFilename) {
        pszFilename := pszFilename is String ? BSTR.Alloc(pszFilename).Value : pszFilename

        result := ComCall(16, this, BSTR, pszFilename, "ptr*", &pRecordingIUnknown := 0, "HRESULT")
        return IMSVidStreamBufferRecordingControl(pRecordingIUnknown)
    }

    /**
     * The get_ReferenceRecorder method creates a new reference recording object.
     * @remarks
     * The caller must release the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nn-segment-imsvidstreambufferrecordingcontrol">IMSVidStreamBufferRecordingControl</a> interface.
     * @param {BSTR} pszFilename Specifies the name of the file to hold the recording.
     * @returns {IMSVidStreamBufferRecordingControl} Receives a pointer to the recording object's <a href="https://docs.microsoft.com/windows/desktop/api/segment/nn-segment-imsvidstreambufferrecordingcontrol">IMSVidStreamBufferRecordingControl</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-get_referencerecorder
     */
    get_ReferenceRecorder(pszFilename) {
        pszFilename := pszFilename is String ? BSTR.Alloc(pszFilename).Value : pszFilename

        result := ComCall(17, this, BSTR, pszFilename, "ptr*", &pRecordingIUnknown := 0, "HRESULT")
        return IMSVidStreamBufferRecordingControl(pRecordingIUnknown)
    }

    /**
     * The get_SinkName method retrieves the name of the stub file that points to the backing files.
     * @remarks
     * The caller must release the returned string, using the <b>SysFreeString</b> function.
     * @returns {BSTR} Pointer to a variable that receives the file name.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-get_sinkname
     */
    get_SinkName() {
        pName := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, pName, "HRESULT")
        return pName
    }

    /**
     * The put_SinkName method sets the name of the stub file that points to the backing files.
     * @remarks
     * Call this method before calling <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidstreambuffersink-namesetlock">NameSetLock</a>, while the graph is stopped. Otherwise, the method fails and returns E_FAIL.
     * @param {BSTR} Name Specifies the file name.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
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
     * Invalid argument.
     * 
     * </td>
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-put_sinkname
     */
    put_SinkName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(19, this, BSTR, Name, "HRESULT")
        return result
    }

    /**
     * The NameSetLock method locks the stream buffer profile.
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-namesetlock
     */
    NameSetLock() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * The get_SBESink method retrieves a pointer to the Stream Buffer Sink filter.
     * @remarks
     * The caller must release the <b>IUnknown</b> interface.
     * @returns {IUnknown} Receives a pointer to the filter's <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-get_sbesink
     */
    get_SBESink() {
        result := ComCall(21, this, "ptr*", &sbeConfig := 0, "HRESULT")
        return IUnknown(sbeConfig)
    }

    Query(iid) {
        if (IMSVidStreamBufferSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ContentRecorder := CallbackCreate(GetMethod(implObj, "get_ContentRecorder"), flags, 3)
        this.vtbl.get_ReferenceRecorder := CallbackCreate(GetMethod(implObj, "get_ReferenceRecorder"), flags, 3)
        this.vtbl.get_SinkName := CallbackCreate(GetMethod(implObj, "get_SinkName"), flags, 2)
        this.vtbl.put_SinkName := CallbackCreate(GetMethod(implObj, "put_SinkName"), flags, 2)
        this.vtbl.NameSetLock := CallbackCreate(GetMethod(implObj, "NameSetLock"), flags, 1)
        this.vtbl.get_SBESink := CallbackCreate(GetMethod(implObj, "get_SBESink"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ContentRecorder)
        CallbackFree(this.vtbl.get_ReferenceRecorder)
        CallbackFree(this.vtbl.get_SinkName)
        CallbackFree(this.vtbl.put_SinkName)
        CallbackFree(this.vtbl.NameSetLock)
        CallbackFree(this.vtbl.get_SBESink)
    }
}
