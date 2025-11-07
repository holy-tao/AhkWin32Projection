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
     * 
     * @param {Pointer<Guid>} guidMajorMediaType 
     * @param {Integer} dwSampleFlags 
     * @param {Integer} llSampleTime 
     * @param {Integer} llSampleDuration 
     * @param {Pointer} pSampleBuffer 
     * @param {Integer} dwSampleSize 
     * @param {IMFAttributes} pAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamplegrabbersinkcallback2-onprocesssampleex
     */
    OnProcessSampleEx(guidMajorMediaType, dwSampleFlags, llSampleTime, llSampleDuration, pSampleBuffer, dwSampleSize, pAttributes) {
        result := ComCall(11, this, "ptr", guidMajorMediaType, "uint", dwSampleFlags, "int64", llSampleTime, "int64", llSampleDuration, "ptr", pSampleBuffer, "uint", dwSampleSize, "ptr", pAttributes, "HRESULT")
        return result
    }
}
