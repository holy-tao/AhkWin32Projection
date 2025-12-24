#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides formatting support for controls on a Visual Basic container.
 * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nn-vbinterf-ivbformat
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IVBFormat extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBFormat
     * @type {Guid}
     */
    static IID => Guid("{9849fd60-3768-101b-8d72-ae6164ffe3cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Format"]

    /**
     * Formats a string according to a pattern.
     * @param {Pointer<VARIANT>} vData Data to be formatted.
     * @param {BSTR} bstrFormat Format string to be applied to the data.
     * @param {Pointer<Void>} lpBuffer Pointer to result buffer.
     * @param {Integer} cb Length of result buffer.
     * @param {Integer} lcid Locale ID.
     * @param {Integer} sFirstDayOfWeek Affects the 'w', FirstDayOfWeek, format result.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbUseSystem"></a><a id="vbusesystem"></a><a id="VBUSESYSTEM"></a><dl>
     * <dt><b>vbUseSystem</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>FirstWeekday</b> setting in the host UI. If no host value is provided, 
     *         use the current system value from the NLS API.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbSunday"></a><a id="vbsunday"></a><a id="VBSUNDAY"></a><dl>
     * <dt><b>vbSunday</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sunday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbMonday"></a><a id="vbmonday"></a><a id="VBMONDAY"></a><dl>
     * <dt><b>vbMonday</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Monday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbTuesday"></a><a id="vbtuesday"></a><a id="VBTUESDAY"></a><dl>
     * <dt><b>vbTuesday</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tuesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbWednesday"></a><a id="vbwednesday"></a><a id="VBWEDNESDAY"></a><dl>
     * <dt><b>vbWednesday</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Wednesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbThursday"></a><a id="vbthursday"></a><a id="VBTHURSDAY"></a><dl>
     * <dt><b>vbThursday</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Thursday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbFriday"></a><a id="vbfriday"></a><a id="VBFRIDAY"></a><dl>
     * <dt><b>vbFriday</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Friday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbSaturday"></a><a id="vbsaturday"></a><a id="VBSATURDAY"></a><dl>
     * <dt><b>vbSaturday</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Saturday
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} sFirstWeekOfYear Affects the 'ww', FirstWeekOfYear, format result.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbUseSystem"></a><a id="vbusesystem"></a><a id="VBUSESYSTEM"></a><dl>
     * <dt><b>vbUseSystem</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>FirstWeekOfYear</b> setting in the host UI. If no host value is provided, 
     *         use the current system value from the NLS API.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbFirstJan1"></a><a id="vbfirstjan1"></a><a id="VBFIRSTJAN1"></a><dl>
     * <dt><b>vbFirstJan1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Start on January 1 (default).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbFirstFourDays"></a><a id="vbfirstfourdays"></a><a id="VBFIRSTFOURDAYS"></a><dl>
     * <dt><b>vbFirstFourDays</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Start with the first four-day week.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="vbFirstFullWeek"></a><a id="vbfirstfullweek"></a><a id="VBFIRSTFULLWEEK"></a><dl>
     * <dt><b>vbFirstFullWeek</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Start with the first full week.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} rcb Number of bytes copied to the result buffer.
     * @returns {HRESULT} This method supports the standard return values <b>E_INVALIDARG</b>, 
     *       <b>E_OUTOFMEMORY</b>, and <b>E_UNEXPECTED</b>, as well as the 
     *       following:
     * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nf-vbinterf-ivbformat-format
     */
    Format(vData, bstrFormat, lpBuffer, cb, lcid, sFirstDayOfWeek, sFirstWeekOfYear, rcb) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"
        rcbMarshal := rcb is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ptr", vData, "ptr", bstrFormat, lpBufferMarshal, lpBuffer, "ushort", cb, "int", lcid, "short", sFirstDayOfWeek, "ushort", sFirstWeekOfYear, rcbMarshal, rcb, "HRESULT")
        return result
    }
}
