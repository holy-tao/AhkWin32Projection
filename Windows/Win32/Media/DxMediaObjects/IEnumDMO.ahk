#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumDMO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumDMO interface provides methods for enumerating Microsoft DirectX Media Objects (DMOs). It is based on the OLE enumeration interfaces. For more information, see the IEnumXXXX topic in the Platform SDK.
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nn-mediaobj-ienumdmo
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class IEnumDMO extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumDMO
     * @type {Guid}
     */
    static IID => Guid("{2c3cd98a-2bfa-4a53-9c27-5249ba64ba0f}")

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
     * The Next method retrieves a specified number of items in the enumeration sequence.
     * @param {Integer} cItemsToFetch Number of items to retrieve.
     * @param {Pointer<Guid>} pCLSID Array of size <i>cItemsToFetch</i> that is filled with the CLSIDs of the enumerated DMOs.
     * @param {Pointer<PWSTR>} Names Array of size <i>cItemsToFetch</i> that is filled with the friendly names of the enumerated DMOs.
     * @param {Pointer<Integer>} pcItemsFetched Pointer to a variable that receives the actual number of items retrieved. Can be <b>NULL</b> if <i>cItemsToFetch</i> equals 1.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieved fewer items than requested.
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
     * Retrieved the requested number of items.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-ienumdmo-next
     */
    Next(cItemsToFetch, pCLSID, Names, pcItemsFetched) {
        NamesMarshal := Names is VarRef ? "ptr*" : "ptr"
        pcItemsFetchedMarshal := pcItemsFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cItemsToFetch, "ptr", pCLSID, NamesMarshal, Names, pcItemsFetchedMarshal, pcItemsFetched, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over a specified number of items in the enumeration sequence.
     * @param {Integer} cItemsToSkip Number of items to skip.
     * @returns {HRESULT} Returns S_OK if the number items skipped equals <i>cItemsToSkip</i>. Otherwise, returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-ienumdmo-skip
     */
    Skip(cItemsToSkip) {
        result := ComCall(4, this, "uint", cItemsToSkip, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-ienumdmo-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * This method is not implemented.
     * @returns {IEnumDMO} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-ienumdmo-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDMO(ppEnum)
    }
}
