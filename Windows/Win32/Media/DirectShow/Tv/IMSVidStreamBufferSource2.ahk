#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidStreamBufferSource.ahk" { IMSVidStreamBufferSource }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMSVidStreamBufferSource2 interface represents the Stream Buffer Source filter within the Video Control.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSource2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambuffersource2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferSource2 extends IMSVidStreamBufferSource {
    /**
     * The interface identifier for IMSVidStreamBufferSource2
     * @type {Guid}
     */
    static IID := Guid("{e4ba9059-b1ce-40d8-b9a0-d4ea4a9989d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferSource2 interfaces
    */
    struct Vtbl extends IMSVidStreamBufferSource.Vtbl {
        put_RateEx       : IntPtr
        get_AudioCounter : IntPtr
        get_VideoCounter : IntPtr
        get_CCCounter    : IntPtr
        get_WSTCounter   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferSource2.Vtbl()
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
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Float} dwRate Playback rate. The valid range is (<i>dRate</i> &gt;= 0.1 || <i>dRate</i> &lt;= –0.1).
     * @param {Integer} dwFramesPerSecond Frames per second for fast-forward play. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambuffermediaseeking2-setrateex">IStreamBufferMediaSeeking2::SetRateEx</a>.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource2-put_rateex
     */
    put_RateEx(dwRate, dwFramesPerSecond) {
        result := ComCall(41, this, "double", dwRate, "uint", dwFramesPerSecond, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource2-get_audiocounter
     */
    get_AudioCounter() {
        result := ComCall(42, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @remarks
     * Returns counter interface for the video path
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource2-get_videocounter
     */
    get_VideoCounter() {
        result := ComCall(43, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource2-get_cccounter
     */
    get_CCCounter() {
        result := ComCall(44, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The get_WSTCounter method enables the caller to get performance statistics from the Stream Buffer Source for the World Standard Teletext (WST) stream.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource2-get_wstcounter
     */
    get_WSTCounter() {
        result := ComCall(45, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    Query(iid) {
        if (IMSVidStreamBufferSource2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_RateEx := CallbackCreate(GetMethod(implObj, "put_RateEx"), flags, 3)
        this.vtbl.get_AudioCounter := CallbackCreate(GetMethod(implObj, "get_AudioCounter"), flags, 2)
        this.vtbl.get_VideoCounter := CallbackCreate(GetMethod(implObj, "get_VideoCounter"), flags, 2)
        this.vtbl.get_CCCounter := CallbackCreate(GetMethod(implObj, "get_CCCounter"), flags, 2)
        this.vtbl.get_WSTCounter := CallbackCreate(GetMethod(implObj, "get_WSTCounter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_RateEx)
        CallbackFree(this.vtbl.get_AudioCounter)
        CallbackFree(this.vtbl.get_VideoCounter)
        CallbackFree(this.vtbl.get_CCCounter)
        CallbackFree(this.vtbl.get_WSTCounter)
    }
}
