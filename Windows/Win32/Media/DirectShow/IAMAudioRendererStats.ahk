#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMAudioRendererStats interface retrieves statistical performance information from an audio renderer filter.This interface is intended for use during development, to log performance data from the audio renderer.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamaudiorendererstats
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMAudioRendererStats extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMAudioRendererStats
     * @type {Guid}
     */
    static IID => Guid("{22320cb2-d41a-11d2-bf7c-d7cb9df0bf93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatParam"]

    /**
     * The GetStatParam method retrieves performance information from the audio renderer.
     * @param {Integer} dwParam Specifies a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_am_audio_renderer_stat_param">_AM_AUDIO_RENDERER_STAT_PARAM</a> enumeration, indicating which information to retrieve.
     * @param {Pointer<Integer>} pdwParam1 Pointer to a variable that receives performance information. The meaning of the returned value depends on the value of <i>dwParam</i>.
     * @param {Pointer<Integer>} pdwParam2 Pointer to a variable that receives performance information. The meaning of the returned value depends on the value of <i>dwParam</i>.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The renderer does not track the specified information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamaudiorendererstats-getstatparam
     */
    GetStatParam(dwParam, pdwParam1, pdwParam2) {
        pdwParam1Marshal := pdwParam1 is VarRef ? "uint*" : "ptr"
        pdwParam2Marshal := pdwParam2 is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwParam, pdwParam1Marshal, pdwParam1, pdwParam2Marshal, pdwParam2, "HRESULT")
        return result
    }
}
