#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumTuneRequests.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTuneRequests interface provides access to a collection of tune requests returned from a call to IGuideData::GetServices. This collection of tune requests represents all the services available in the tuning space.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEnumTuneRequests)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdatif/nn-bdatif-ienumtunerequests
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IEnumTuneRequests extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTuneRequests
     * @type {Guid}
     */
    static IID => Guid("{1993299c-ced6-4788-87a3-420067dce0c7}")

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
     * The Next method retrieves the specified number of items in the collection.
     * @param {Integer} celt Specifies the number of items to retrieve.
     * @param {Pointer<ITuneRequest>} ppprop Array of size <i>celt</i> that is filled with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface pointers.
     * @param {Pointer<Integer>} pcelt Receives the number of items retrieved.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection is at the end of the enumeration sequence.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-ienumtunerequests-next
     */
    Next(celt, ppprop, pcelt) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", ppprop, pceltMarshal, pcelt, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over the specified number of items in the collection.
     * @param {Integer} celt Specifies the number of items to skip.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-ienumtunerequests-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Reset method sets the enumerator to the first item in the collection.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-ienumtunerequests-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a copy of the collection.
     * @returns {IEnumTuneRequests} Receives the new collection.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-ienumtunerequests-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumTuneRequests(ppenum)
    }
}
