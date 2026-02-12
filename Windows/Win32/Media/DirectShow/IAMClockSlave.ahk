#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMClockSlave interface controls the tolerance of an audio renderer when it is matching rates with another clock.If the audio renderer is matching rates with another clock, it allows the audio to drift up to the amount of the specified tolerance.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-iamclockslave
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMClockSlave extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMClockSlave
     * @type {Guid}
     */
    static IID => Guid("{9fd52741-176d-4b36-8f51-ca8f933223be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetErrorTolerance", "GetErrorTolerance"]

    /**
     * The SetErrorTolerance method sets the audio renderer's rate-matching tolerance.
     * @remarks
     * Changing the tolerance has no effect unless the audio renderer is matching rates with a different clock. If the audio renderer is the reference clock, the audio is always synchronized to the clock (by definition).
     * 
     * This method fails if the filter graph is not stopped.
     * @param {Integer} dwTolerance Specifies the maximum tolerance, in milliseconds. The value must be from 1 to 1000, inclusive.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter graph is not stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamclockslave-seterrortolerance
     */
    SetErrorTolerance(dwTolerance) {
        result := ComCall(3, this, "uint", dwTolerance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetErrorTolerance method retrieves the audio renderer's rate-matching tolerance.
     * @returns {Integer} Pointer to a variable that receives the maximum tolerance, in milliseconds.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamclockslave-geterrortolerance
     */
    GetErrorTolerance() {
        result := ComCall(4, this, "uint*", &pdwTolerance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwTolerance
    }
}
