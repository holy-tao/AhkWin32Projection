#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidStreamBufferSourceEvent.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The IMSVidStreamBufferSourceEvent2 interface is used to receive events from the MSVidStreamBufferSource object.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSourceEvent2)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersourceevent2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSourceEvent2 extends IMSVidStreamBufferSourceEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSourceEvent2
     * @type {Guid}
     */
    static IID => Guid("{7aef50ce-8e22-4ba8-bc06-a92a458b4ef2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RateChange"]

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Float} qwNewRate Specifies the new playback rate.
     * @param {Float} qwOldRate Specifies the previous playback rate.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersourceevent2-ratechange
     */
    RateChange(qwNewRate, qwOldRate) {
        result := ComCall(17, this, "double", qwNewRate, "double", qwOldRate, "HRESULT")
        return result
    }
}
