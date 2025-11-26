#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IQualityControl interface provides support for quality control.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iqualitycontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IQualityControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQualityControl
     * @type {Guid}
     */
    static IID => Guid("{56a868a5-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Notify", "SetSink"]

    /**
     * The Notify method notifies the filter that a quality change is requested.
     * @param {IBaseFilter} pSelf Pointer to the filter that is sending the quality notification.
     * @param {Quality} q [Quality](/windows/desktop/api/strmif/ns-strmif-quality) structure.
     * @returns {HRESULT} Returns S_OK if the method succeeds; otherwise, returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iqualitycontrol-notify
     */
    Notify(pSelf, q) {
        result := ComCall(3, this, "ptr", pSelf, "ptr", q, "HRESULT")
        return result
    }

    /**
     * The SetSink method sets the IQualityControl object that will receive quality messages.
     * @param {IQualityControl} piqc Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iqualitycontrol">IQualityControl</a> object to which the notifications should be sent.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation. <b>HRESULT</b> can be one of the following standard constants, or other values not listed.
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
     * Method isn't supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK or NOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iqualitycontrol-setsink
     */
    SetSink(piqc) {
        result := ComCall(4, this, "ptr", piqc, "HRESULT")
        return result
    }
}
