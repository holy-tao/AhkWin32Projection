#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IMSVidStreamBufferSource.ahk

/**
 * The IMSVidStreamBufferSource2 interface represents the Stream Buffer Source filter within the Video Control.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSource2)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersource2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSource2 extends IMSVidStreamBufferSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSource2
     * @type {Guid}
     */
    static IID => Guid("{e4ba9059-b1ce-40d8-b9a0-d4ea4a9989d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 41

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_RateEx", "get_AudioCounter", "get_VideoCounter", "get_CCCounter", "get_WSTCounter"]

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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource2-put_rateex
     */
    put_RateEx(dwRate, dwFramesPerSecond) {
        result := ComCall(41, this, "double", dwRate, "uint", dwFramesPerSecond, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource2-get_audiocounter
     */
    get_AudioCounter() {
        result := ComCall(42, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource2-get_videocounter
     */
    get_VideoCounter() {
        result := ComCall(43, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource2-get_cccounter
     */
    get_CCCounter() {
        result := ComCall(44, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The get_WSTCounter method enables the caller to get performance statistics from the Stream Buffer Source for the World Standard Teletext (WST) stream.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. Query this pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambufferdatacounters">IStreamBufferDataCounters</a> interface. The caller must release the <b>IUnknown</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource2-get_wstcounter
     */
    get_WSTCounter() {
        result := ComCall(45, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }
}
