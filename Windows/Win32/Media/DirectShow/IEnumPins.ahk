#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumPins.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enumerates pins on a filter.The IBaseFilter::EnumPins method returns this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ienumpins
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumPins extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumPins
     * @type {Guid}
     */
    static IID => Guid("{56a86892-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * The Next method retrieves a specified number of pins in the enumeration sequence.
     * @param {Integer} cPins Number of pins to retrieve.
     * @param {Pointer<IPin>} ppPins Array of size <i>cPins</i> that is filled with <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> pointers. The caller must release the interfaces.
     * @param {Pointer<Integer>} pcFetched Pointer to a variable that receives the number of pins retrieved. Can be <b>NULL</b> if <i>cPins</i> is 1.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Did not retrieve as many pins as requested.
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
     * <dt><b>VFW_E_ENUM_OUT_OF_SYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter's state has changed and is now inconsistent with the enumerator.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumpins-next
     */
    Next(cPins, ppPins, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cPins, "ptr*", ppPins, pcFetchedMarshal, pcFetched, "int")
        return result
    }

    /**
     * The Skip method skips over a specified number of pins.
     * @param {Integer} cPins Number of pins to skip.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b>
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Skipped past the end of the sequence.
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
     * <dt><b>VFW_E_ENUM_OUT_OF_SYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter's state has changed and is now inconsistent with the enumerator.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumpins-skip
     */
    Skip(cPins) {
        result := ComCall(4, this, "uint", cPins, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumpins-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method makes a copy of the enumerator with the same enumeration state.
     * @returns {IEnumPins} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumpins">IEnumPins</a> interface of the new enumerator. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumpins-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPins(ppEnum)
    }
}
