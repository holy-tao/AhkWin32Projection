#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConfigAsfWriter.ahk

/**
 * The IConfigAsfWriter2 interface extends the IConfigAsfWriter interface, which configures the WM ASF Writer filter.
 * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nn-dshowasf-iconfigasfwriter2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IConfigAsfWriter2 extends IConfigAsfWriter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConfigAsfWriter2
     * @type {Guid}
     */
    static IID => Guid("{7989ccaa-53f0-44f0-884a-f3b03f6ae066}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StreamNumFromPin", "SetParam", "GetParam", "ResetMultiPassState"]

    /**
     * The StreamNumFromPin method retrieves the stream number associated with the specified input pin.
     * @param {IPin} pPin Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface on the input pin.
     * @returns {Integer} Receives the stream number.
     * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nf-dshowasf-iconfigasfwriter2-streamnumfrompin
     */
    StreamNumFromPin(pPin) {
        result := ComCall(11, this, "ptr", pPin, "ushort*", &pwStreamNum := 0, "HRESULT")
        return pwStreamNum
    }

    /**
     * The SetParam method sets the value of the specified filter configuration parameter.
     * @param {Integer} dwParam Specifies the parameter to set,as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd758054(v=vs.85)">_AM_ASFWRITERCONFIG_PARAM</a> enumeration.
     * @param {Integer} dwParam1 Specifies the value to assign to the <i>dwParam</i> parameter.
     * @param {Integer} dwParam2 Reserved. Must be zero.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nf-dshowasf-iconfigasfwriter2-setparam
     */
    SetParam(dwParam, dwParam1, dwParam2) {
        result := ComCall(12, this, "uint", dwParam, "uint", dwParam1, "uint", dwParam2, "HRESULT")
        return result
    }

    /**
     * The GetParam method retrieves the current value of the specified filter configuration parameter.
     * @param {Integer} dwParam Specifies the parameter to retrieve, as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd758054(v=vs.85)">_AM_ASFWRITERCONFIG_PARAM</a> enumeration.
     * @param {Pointer<Integer>} pdwParam1 Receives the value of the parameter specified in <i>dwParam</i>.
     * @param {Pointer<Integer>} pdwParam2 Reserved. Must be zero.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nf-dshowasf-iconfigasfwriter2-getparam
     */
    GetParam(dwParam, pdwParam1, pdwParam2) {
        pdwParam1Marshal := pdwParam1 is VarRef ? "uint*" : "ptr"
        pdwParam2Marshal := pdwParam2 is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwParam, pdwParam1Marshal, pdwParam1, pdwParam2Marshal, pdwParam2, "HRESULT")
        return result
    }

    /**
     * The ResetMultiPassState method resets the filter when a preprocessing encoding pass is canceled before it is completed.
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
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter was not in a stopped state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nf-dshowasf-iconfigasfwriter2-resetmultipassstate
     */
    ResetMultiPassState() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
