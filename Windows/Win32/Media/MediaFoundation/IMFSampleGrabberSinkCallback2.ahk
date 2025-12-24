#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSampleGrabberSinkCallback.ahk

/**
 * Extends the IMFSampleGrabberSinkCallback interface.
 * @remarks
 * 
 * This callback interface is used with the sample-grabber sink. It extends the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsamplegrabbersinkcallback">IMFSampleGrabberSinkCallback</a> interface by adding the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsamplegrabbersinkcallback2-onprocesssampleex">OnProcessSampleEx</a> method, which supersedes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsamplegrabbersinkcallback-onprocesssample">IMFSampleGrabberSinkCallback::OnProcessSample</a> method.
 * 
 *  The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsamplegrabbersinkcallback2-onprocesssampleex">OnProcessSampleEx</a> method adds a parameter that contains the attributes for the media sample. You can use the attributes to get information about the sample, such as  field dominance and telecine flags. 
 * 
 * To use this interface, do the following: 
 * 
 * <ol>
 * <li>Implement  a callback object that exposes the interface.</li>
 * <li>Create the sample-grabber sink by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesamplegrabbersinkactivate">MFCreateSampleGrabberSinkActivate</a> function. Pass the callback pointer in the <i>pIMFSampleGrabberSinkCallback</i> parameter.</li>
 * <li>The sample-grabber sink will call <b>QueryInterface</b> on the callback object.</li>
 * <li>If the callback object exposes the <b>IMFSampleGrabberSinkCallback2</b> interface, the sample-grabber sink will use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsamplegrabbersinkcallback2-onprocesssampleex">OnProcessSampleEx</a> callback method.  Otherwise, the sample-grabber sink will use the older <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsamplegrabbersinkcallback-onprocesssample">OnProcessSample</a> callback method.</li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsamplegrabbersinkcallback2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSampleGrabberSinkCallback2 extends IMFSampleGrabberSinkCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSampleGrabberSinkCallback2
     * @type {Guid}
     */
    static IID => Guid("{ca86aa50-c46e-429e-ab27-16d6ac6844cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnProcessSampleEx"]

    /**
     * Called when the sample-grabber sink receives a new media sample.
     * @param {Pointer<Guid>} guidMajorMediaType The major type GUID that specifies the format of the data. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     * @param {Integer} dwSampleFlags Sample flags. The sample-grabber sink gets the value of this parameter by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-getsampleflags">IMFSample::GetSampleFlags</a> method of the media sample.
     * @param {Integer} llSampleTime The presentation time for this sample, in 100-nanosecond units. If the sample does not have a presentation time, the value of this parameter is <b>_I64_MAX</b>
     * @param {Integer} llSampleDuration The duration of the sample, in 100-nanosecond units.
     * 
     * If the sample does not have a duration, the value of this parameter is <b>_I64_MAX</b>.
     * @param {Pointer} pSampleBuffer A pointer to a buffer that contains the sample data.
     * @param {Integer} dwSampleSize The size, in bytes, of the <i>pSampleBuffer</i> buffer.
     * @param {IMFAttributes} pAttributes A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. Use this interface to get the attributes for this sample (if any). For a list of sample attributes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/sample-attributes">Sample Attributes</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsamplegrabbersinkcallback2-onprocesssampleex
     */
    OnProcessSampleEx(guidMajorMediaType, dwSampleFlags, llSampleTime, llSampleDuration, pSampleBuffer, dwSampleSize, pAttributes) {
        result := ComCall(11, this, "ptr", guidMajorMediaType, "uint", dwSampleFlags, "int64", llSampleTime, "int64", llSampleDuration, "ptr", pSampleBuffer, "uint", dwSampleSize, "ptr", pAttributes, "HRESULT")
        return result
    }
}
