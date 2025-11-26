#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IMSVidStreamBufferRecordingControl.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IMSVidOutputDevice.ahk

/**
 * The IMSVidStreamBufferSink interface represents the Stream Buffer Sink filter within the Video Control.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSink)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersink
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSink extends IMSVidOutputDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSink
     * @type {Guid}
     */
    static IID => Guid("{159dbb45-cd1b-4dab-83ea-5cb1f4f21d07}")

    /**
     * The class identifier for MSVidStreamBufferSink
     * @type {Guid}
     */
    static CLSID => Guid("{9e77aac4-35e5-42a1-bdc2-8f3ff399847c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentRecorder", "get_ReferenceRecorder", "get_SinkName", "put_SinkName", "NameSetLock", "get_SBESink"]

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
     * @param {BSTR} pszFilename Specifies the name of the file to hold the recording.
     * @returns {IMSVidStreamBufferRecordingControl} Receives a pointer to the recording object's <a href="https://docs.microsoft.com/windows/desktop/api/segment/nn-segment-imsvidstreambufferrecordingcontrol">IMSVidStreamBufferRecordingControl</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersink-get_contentrecorder
     */
    get_ContentRecorder(pszFilename) {
        pszFilename := pszFilename is String ? BSTR.Alloc(pszFilename).Value : pszFilename

        result := ComCall(16, this, "ptr", pszFilename, "ptr*", &pRecordingIUnknown := 0, "HRESULT")
        return IMSVidStreamBufferRecordingControl(pRecordingIUnknown)
    }

    /**
     * The get_ReferenceRecorder method creates a new reference recording object.
     * @param {BSTR} pszFilename Specifies the name of the file to hold the recording.
     * @returns {IMSVidStreamBufferRecordingControl} Receives a pointer to the recording object's <a href="https://docs.microsoft.com/windows/desktop/api/segment/nn-segment-imsvidstreambufferrecordingcontrol">IMSVidStreamBufferRecordingControl</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersink-get_referencerecorder
     */
    get_ReferenceRecorder(pszFilename) {
        pszFilename := pszFilename is String ? BSTR.Alloc(pszFilename).Value : pszFilename

        result := ComCall(17, this, "ptr", pszFilename, "ptr*", &pRecordingIUnknown := 0, "HRESULT")
        return IMSVidStreamBufferRecordingControl(pRecordingIUnknown)
    }

    /**
     * The get_SinkName method retrieves the name of the stub file that points to the backing files.
     * @returns {BSTR} Pointer to a variable that receives the file name.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersink-get_sinkname
     */
    get_SinkName() {
        pName := BSTR()
        result := ComCall(18, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * The put_SinkName method sets the name of the stub file that points to the backing files.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersink-put_sinkname
     */
    put_SinkName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(19, this, "ptr", Name, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersink-namesetlock
     */
    NameSetLock() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * The get_SBESink method retrieves a pointer to the Stream Buffer Sink filter.
     * @returns {IUnknown} Receives a pointer to the filter's <b>IUnknown</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersink-get_sbesink
     */
    get_SBESink() {
        result := ComCall(21, this, "ptr*", &sbeConfig := 0, "HRESULT")
        return IUnknown(sbeConfig)
    }
}
