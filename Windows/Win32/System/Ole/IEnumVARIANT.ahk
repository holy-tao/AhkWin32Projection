#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVARIANT.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a method for enumerating a collection of variants, including heterogeneous collections of objects and intrinsic types.
 * @remarks
 * 
 * To see how to implement a collection of objects using <b>IEnumVARIANT</b>, refer to the file Enumvar.cpp in the Lines sample code.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-ienumvariant
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IEnumVARIANT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumVARIANT
     * @type {Guid}
     */
    static IID => Guid("{00020404-0000-0000-c000-000000000046}")

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
     * Retrieves the specified items in the enumeration sequence.
     * @param {Integer} celt The number of elements to be retrieved
     * @param {Pointer<VARIANT>} rgVar An array of at least size <i>celt</i> in which the elements are to be returned.
     * @param {Pointer<Integer>} pCeltFetched The number of elements returned in <i>rgVar</i>, or NULL.
     * @returns {HRESULT} This method can return one of these values.
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
     * The number of elements returned is <i>celt</i>.
     * 
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
     * The number of elements returned is less than <i>celt</i>.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-ienumvariant-next
     */
    Next(celt, rgVar, pCeltFetched) {
        pCeltFetchedMarshal := pCeltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgVar, pCeltFetchedMarshal, pCeltFetched, "int")
        return result
    }

    /**
     * Attempts to skip over the next celt elements in the enumeration sequence.
     * @param {Integer} celt The number of elements to skip.
     * @returns {HRESULT} This method can return one of these values.
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
     * The specified number of elements was skipped.
     * 
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
     * The end of the sequence was reached before skipping the requested number of elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-ienumvariant-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning.
     * @returns {HRESULT} This method can return one of these values.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-ienumvariant-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the current state of enumeration.
     * @returns {IEnumVARIANT} The clone enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-ienumvariant-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVARIANT(ppEnum)
    }
}
