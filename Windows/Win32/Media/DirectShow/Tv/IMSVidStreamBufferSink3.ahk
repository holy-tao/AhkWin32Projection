#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IMSVidStreamBufferSink2.ahk

/**
 * The IMSVidStreamBufferSink3 interface represents the Stream Buffer Sink filter within the Video Control.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSink3)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersink3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSink3 extends IMSVidStreamBufferSink2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSink3
     * @type {Guid}
     */
    static IID => Guid("{4f8721d7-7d59-4d8b-99f5-a77775586bd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMinSeek", "get_AudioCounter", "get_VideoCounter", "get_CCCounter", "get_WSTCounter", "put_AudioAnalysisFilter", "get_AudioAnalysisFilter", "put__AudioAnalysisFilter", "get__AudioAnalysisFilter", "put_VideoAnalysisFilter", "get_VideoAnalysisFilter", "put__VideoAnalysisFilter", "get__VideoAnalysisFilter", "put_DataAnalysisFilter", "get_DataAnalysisFilter", "put__DataAnalysisFilter", "get__DataAnalysisFilter", "get_LicenseErrorCode"]

    /**
     * @type {IUnknown} 
     */
    AudioCounter {
        get => this.get_AudioCounter()
    }

    /**
     * @type {IUnknown} 
     */
    VideoCounter {
        get => this.get_VideoCounter()
    }

    /**
     * @type {IUnknown} 
     */
    CCCounter {
        get => this.get_CCCounter()
    }

    /**
     * @type {IUnknown} 
     */
    WSTCounter {
        get => this.get_WSTCounter()
    }

    /**
     * @type {BSTR} 
     */
    AudioAnalysisFilter {
        get => this.get_AudioAnalysisFilter()
        set => this.put_AudioAnalysisFilter(value)
    }

    /**
     * @type {Guid} 
     */
    _AudioAnalysisFilter {
        get => this.get__AudioAnalysisFilter()
        set => this.put__AudioAnalysisFilter(value)
    }

    /**
     * @type {BSTR} 
     */
    VideoAnalysisFilter {
        get => this.get_VideoAnalysisFilter()
        set => this.put_VideoAnalysisFilter(value)
    }

    /**
     * @type {Guid} 
     */
    _VideoAnalysisFilter {
        get => this.get__VideoAnalysisFilter()
        set => this.put__VideoAnalysisFilter(value)
    }

    /**
     * @type {BSTR} 
     */
    DataAnalysisFilter {
        get => this.get_DataAnalysisFilter()
        set => this.put_DataAnalysisFilter(value)
    }

    /**
     * @type {Guid} 
     */
    _DataAnalysisFilter {
        get => this.get__DataAnalysisFilter()
        set => this.put__DataAnalysisFilter(value)
    }

    /**
     * @type {HRESULT} 
     */
    LicenseErrorCode {
        get => this.get_LicenseErrorCode()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-setminseek
     */
    SetMinSeek() {
        result := ComCall(23, this, "int*", &pdwMin := 0, "HRESULT")
        return pdwMin
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_audiocounter
     */
    get_AudioCounter() {
        result := ComCall(24, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_videocounter
     */
    get_VideoCounter() {
        result := ComCall(25, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_cccounter
     */
    get_CCCounter() {
        result := ComCall(26, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_wstcounter
     */
    get_WSTCounter() {
        result := ComCall(27, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @param {BSTR} szCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put_audioanalysisfilter
     */
    put_AudioAnalysisFilter(szCLSID) {
        szCLSID := szCLSID is String ? BSTR.Alloc(szCLSID).Value : szCLSID

        result := ComCall(28, this, "ptr", szCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_audioanalysisfilter
     */
    get_AudioAnalysisFilter() {
        pszCLSID := BSTR()
        result := ComCall(29, this, "ptr", pszCLSID, "HRESULT")
        return pszCLSID
    }

    /**
     * 
     * @param {Guid} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put__audioanalysisfilter
     */
    put__AudioAnalysisFilter(guid) {
        result := ComCall(30, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get__audioanalysisfilter
     */
    get__AudioAnalysisFilter() {
        pGuid := Guid()
        result := ComCall(31, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @param {BSTR} szCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put_videoanalysisfilter
     */
    put_VideoAnalysisFilter(szCLSID) {
        szCLSID := szCLSID is String ? BSTR.Alloc(szCLSID).Value : szCLSID

        result := ComCall(32, this, "ptr", szCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_videoanalysisfilter
     */
    get_VideoAnalysisFilter() {
        pszCLSID := BSTR()
        result := ComCall(33, this, "ptr", pszCLSID, "HRESULT")
        return pszCLSID
    }

    /**
     * 
     * @param {Guid} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put__videoanalysisfilter
     */
    put__VideoAnalysisFilter(guid) {
        result := ComCall(34, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get__videoanalysisfilter
     */
    get__VideoAnalysisFilter() {
        pGuid := Guid()
        result := ComCall(35, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @param {BSTR} szCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put_dataanalysisfilter
     */
    put_DataAnalysisFilter(szCLSID) {
        szCLSID := szCLSID is String ? BSTR.Alloc(szCLSID).Value : szCLSID

        result := ComCall(36, this, "ptr", szCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_dataanalysisfilter
     */
    get_DataAnalysisFilter() {
        pszCLSID := BSTR()
        result := ComCall(37, this, "ptr", pszCLSID, "HRESULT")
        return pszCLSID
    }

    /**
     * 
     * @param {Guid} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put__dataanalysisfilter
     */
    put__DataAnalysisFilter(guid) {
        result := ComCall(38, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get__dataanalysisfilter
     */
    get__DataAnalysisFilter() {
        pGuid := Guid()
        result := ComCall(39, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_licenseerrorcode
     */
    get_LicenseErrorCode() {
        result := ComCall(40, this, "int*", &hres := 0, "HRESULT")
        return hres
    }
}
