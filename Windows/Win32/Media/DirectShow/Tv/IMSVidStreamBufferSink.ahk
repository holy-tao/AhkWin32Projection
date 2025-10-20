#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} pszFilename 
     * @param {Pointer<IMSVidStreamBufferRecordingControl>} pRecordingIUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-get_contentrecorder
     */
    get_ContentRecorder(pszFilename, pRecordingIUnknown) {
        pszFilename := pszFilename is String ? BSTR.Alloc(pszFilename).Value : pszFilename

        result := ComCall(16, this, "ptr", pszFilename, "ptr*", pRecordingIUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pszFilename 
     * @param {Pointer<IMSVidStreamBufferRecordingControl>} pRecordingIUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-get_referencerecorder
     */
    get_ReferenceRecorder(pszFilename, pRecordingIUnknown) {
        pszFilename := pszFilename is String ? BSTR.Alloc(pszFilename).Value : pszFilename

        result := ComCall(17, this, "ptr", pszFilename, "ptr*", pRecordingIUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-get_sinkname
     */
    get_SinkName(pName) {
        result := ComCall(18, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-put_sinkname
     */
    put_SinkName(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(19, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-namesetlock
     */
    NameSetLock() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} sbeConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink-get_sbesink
     */
    get_SBESink(sbeConfig) {
        result := ComCall(21, this, "ptr*", sbeConfig, "HRESULT")
        return result
    }
}
