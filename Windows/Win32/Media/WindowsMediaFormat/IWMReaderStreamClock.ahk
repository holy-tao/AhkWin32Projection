#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderStreamClock interface provides access to the clock used by the reader.This interface exists for every reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderstreamclock
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderStreamClock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderStreamClock
     * @type {Guid}
     */
    static IID => Guid("{96406bed-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTime", "SetTimer", "KillTimer"]

    /**
     * The GetTime method retrieves the current value of the stream clock.
     * @param {Pointer<Integer>} pcnsNow Pointer to the current time of the stream clock, in 100-nanosecond units.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pcnsNow</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderstreamclock-gettime
     */
    GetTime(pcnsNow) {
        pcnsNowMarshal := pcnsNow is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcnsNowMarshal, pcnsNow, "HRESULT")
        return result
    }

    /**
     * The SetTimer method sets a timer on the clock.
     * @param {Integer} cnsWhen Specifies the time at which the reader notifies the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">OnStatus</a> callback, in 100-nanosecond units.
     * @param {Pointer<Void>} pvParam Specifies a pointer to the timer context parameters that are returned in the <b>OnStatus</b> callback.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the timer identifier.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderstreamclock-settimer
     */
    SetTimer(cnsWhen, pvParam) {
        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", cnsWhen, pvParamMarshal, pvParam, "uint*", &pdwTimerId := 0, "HRESULT")
        return pdwTimerId
    }

    /**
     * The KillTimer method cancels a timer that has been set on the clock.
     * @param {Integer} dwTimerId <b>DWORD</b> containing the timer identifier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderstreamclock-killtimer
     */
    KillTimer(dwTimerId) {
        result := ComCall(5, this, "uint", dwTimerId, "HRESULT")
        return result
    }
}
