#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidStreamBufferSink2.ahk" { IMSVidStreamBufferSink2 }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMSVidStreamBufferSink3 interface represents the Stream Buffer Sink filter within the Video Control.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSink3)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambuffersink3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferSink3 extends IMSVidStreamBufferSink2 {
    /**
     * The interface identifier for IMSVidStreamBufferSink3
     * @type {Guid}
     */
    static IID := Guid("{4f8721d7-7d59-4d8b-99f5-a77775586bd5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferSink3 interfaces
    */
    struct Vtbl extends IMSVidStreamBufferSink2.Vtbl {
        SetMinSeek               : IntPtr
        get_AudioCounter         : IntPtr
        get_VideoCounter         : IntPtr
        get_CCCounter            : IntPtr
        get_WSTCounter           : IntPtr
        put_AudioAnalysisFilter  : IntPtr
        get_AudioAnalysisFilter  : IntPtr
        put__AudioAnalysisFilter : IntPtr
        get__AudioAnalysisFilter : IntPtr
        put_VideoAnalysisFilter  : IntPtr
        get_VideoAnalysisFilter  : IntPtr
        put__VideoAnalysisFilter : IntPtr
        get__VideoAnalysisFilter : IntPtr
        put_DataAnalysisFilter   : IntPtr
        get_DataAnalysisFilter   : IntPtr
        put__DataAnalysisFilter  : IntPtr
        get__DataAnalysisFilter  : IntPtr
        get_LicenseErrorCode     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferSink3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {Integer} Receives the current position, in hundredths of seconds.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-setminseek
     */
    SetMinSeek() {
        result := ComCall(23, this, "int*", &pdwMin := 0, "HRESULT")
        return pdwMin
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_audiocounter
     */
    get_AudioCounter() {
        result := ComCall(24, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_videocounter
     */
    get_VideoCounter() {
        result := ComCall(25, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_cccounter
     */
    get_CCCounter() {
        result := ComCall(26, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_wstcounter
     */
    get_WSTCounter() {
        result := ComCall(27, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {BSTR} szCLSID Reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put_audioanalysisfilter
     */
    put_AudioAnalysisFilter(szCLSID) {
        szCLSID := szCLSID is String ? BSTR.Alloc(szCLSID).Value : szCLSID

        result := ComCall(28, this, BSTR, szCLSID, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {BSTR} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_audioanalysisfilter
     */
    get_AudioAnalysisFilter() {
        pszCLSID := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, pszCLSID, "HRESULT")
        return pszCLSID
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Guid} guid Reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put__audioanalysisfilter
     */
    put__AudioAnalysisFilter(guid) {
        result := ComCall(30, this, Guid, guid, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {Guid} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get__audioanalysisfilter
     */
    get__AudioAnalysisFilter() {
        pGuid := Guid()
        result := ComCall(31, this, Guid.Ptr, pGuid, "HRESULT")
        return pGuid
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {BSTR} szCLSID Reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put_videoanalysisfilter
     */
    put_VideoAnalysisFilter(szCLSID) {
        szCLSID := szCLSID is String ? BSTR.Alloc(szCLSID).Value : szCLSID

        result := ComCall(32, this, BSTR, szCLSID, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {BSTR} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_videoanalysisfilter
     */
    get_VideoAnalysisFilter() {
        pszCLSID := BSTR.Owned()
        result := ComCall(33, this, BSTR.Ptr, pszCLSID, "HRESULT")
        return pszCLSID
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Guid} guid Reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put__videoanalysisfilter
     */
    put__VideoAnalysisFilter(guid) {
        result := ComCall(34, this, Guid, guid, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {Guid} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get__videoanalysisfilter
     */
    get__VideoAnalysisFilter() {
        pGuid := Guid()
        result := ComCall(35, this, Guid.Ptr, pGuid, "HRESULT")
        return pGuid
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {BSTR} szCLSID Reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put_dataanalysisfilter
     */
    put_DataAnalysisFilter(szCLSID) {
        szCLSID := szCLSID is String ? BSTR.Alloc(szCLSID).Value : szCLSID

        result := ComCall(36, this, BSTR, szCLSID, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {BSTR} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_dataanalysisfilter
     */
    get_DataAnalysisFilter() {
        pszCLSID := BSTR.Owned()
        result := ComCall(37, this, BSTR.Ptr, pszCLSID, "HRESULT")
        return pszCLSID
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Guid} guid Reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-put__dataanalysisfilter
     */
    put__DataAnalysisFilter(guid) {
        result := ComCall(38, this, Guid, guid, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {Guid} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get__dataanalysisfilter
     */
    get__DataAnalysisFilter() {
        pGuid := Guid()
        result := ComCall(39, this, Guid.Ptr, pGuid, "HRESULT")
        return pGuid
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {HRESULT} Receives an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink3-get_licenseerrorcode
     */
    get_LicenseErrorCode() {
        result := ComCall(40, this, "int*", &hres := 0, "HRESULT")
        return hres
    }

    Query(iid) {
        if (IMSVidStreamBufferSink3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMinSeek := CallbackCreate(GetMethod(implObj, "SetMinSeek"), flags, 2)
        this.vtbl.get_AudioCounter := CallbackCreate(GetMethod(implObj, "get_AudioCounter"), flags, 2)
        this.vtbl.get_VideoCounter := CallbackCreate(GetMethod(implObj, "get_VideoCounter"), flags, 2)
        this.vtbl.get_CCCounter := CallbackCreate(GetMethod(implObj, "get_CCCounter"), flags, 2)
        this.vtbl.get_WSTCounter := CallbackCreate(GetMethod(implObj, "get_WSTCounter"), flags, 2)
        this.vtbl.put_AudioAnalysisFilter := CallbackCreate(GetMethod(implObj, "put_AudioAnalysisFilter"), flags, 2)
        this.vtbl.get_AudioAnalysisFilter := CallbackCreate(GetMethod(implObj, "get_AudioAnalysisFilter"), flags, 2)
        this.vtbl.put__AudioAnalysisFilter := CallbackCreate(GetMethod(implObj, "put__AudioAnalysisFilter"), flags, 2)
        this.vtbl.get__AudioAnalysisFilter := CallbackCreate(GetMethod(implObj, "get__AudioAnalysisFilter"), flags, 2)
        this.vtbl.put_VideoAnalysisFilter := CallbackCreate(GetMethod(implObj, "put_VideoAnalysisFilter"), flags, 2)
        this.vtbl.get_VideoAnalysisFilter := CallbackCreate(GetMethod(implObj, "get_VideoAnalysisFilter"), flags, 2)
        this.vtbl.put__VideoAnalysisFilter := CallbackCreate(GetMethod(implObj, "put__VideoAnalysisFilter"), flags, 2)
        this.vtbl.get__VideoAnalysisFilter := CallbackCreate(GetMethod(implObj, "get__VideoAnalysisFilter"), flags, 2)
        this.vtbl.put_DataAnalysisFilter := CallbackCreate(GetMethod(implObj, "put_DataAnalysisFilter"), flags, 2)
        this.vtbl.get_DataAnalysisFilter := CallbackCreate(GetMethod(implObj, "get_DataAnalysisFilter"), flags, 2)
        this.vtbl.put__DataAnalysisFilter := CallbackCreate(GetMethod(implObj, "put__DataAnalysisFilter"), flags, 2)
        this.vtbl.get__DataAnalysisFilter := CallbackCreate(GetMethod(implObj, "get__DataAnalysisFilter"), flags, 2)
        this.vtbl.get_LicenseErrorCode := CallbackCreate(GetMethod(implObj, "get_LicenseErrorCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMinSeek)
        CallbackFree(this.vtbl.get_AudioCounter)
        CallbackFree(this.vtbl.get_VideoCounter)
        CallbackFree(this.vtbl.get_CCCounter)
        CallbackFree(this.vtbl.get_WSTCounter)
        CallbackFree(this.vtbl.put_AudioAnalysisFilter)
        CallbackFree(this.vtbl.get_AudioAnalysisFilter)
        CallbackFree(this.vtbl.put__AudioAnalysisFilter)
        CallbackFree(this.vtbl.get__AudioAnalysisFilter)
        CallbackFree(this.vtbl.put_VideoAnalysisFilter)
        CallbackFree(this.vtbl.get_VideoAnalysisFilter)
        CallbackFree(this.vtbl.put__VideoAnalysisFilter)
        CallbackFree(this.vtbl.get__VideoAnalysisFilter)
        CallbackFree(this.vtbl.put_DataAnalysisFilter)
        CallbackFree(this.vtbl.get_DataAnalysisFilter)
        CallbackFree(this.vtbl.put__DataAnalysisFilter)
        CallbackFree(this.vtbl.get__DataAnalysisFilter)
        CallbackFree(this.vtbl.get_LicenseErrorCode)
    }
}
