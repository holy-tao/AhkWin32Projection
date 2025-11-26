#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumEventObject.ahk
#Include ..\IUnknown.ahk

/**
 * Enumerates the event objects that are registered in the COM+ events store.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ienumeventobject
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEnumEventObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumEventObject
     * @type {Guid}
     */
    static IID => Guid("{f4a07d63-2e25-11d1-9964-00c04fbbb345}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Next", "Reset", "Skip"]

    /**
     * Creates an enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumEventObject} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ienumeventobject">IEnumEventObject</a> interface on the enumeration object. This parameter cannot be <b>NULL</b>. If the method is unsuccessful, the value of this output variable is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ienumeventobject-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppInterface := 0, "HRESULT")
        return IEnumEventObject(ppInterface)
    }

    /**
     * Retrieves the specified number of items in the enumeration sequence.
     * @param {Integer} cReqElem The number of elements being requested. If there are fewer than the requested number of elements left in the sequence, this method obtains the remaining elements.
     * @param {Pointer<IUnknown>} ppInterface The address to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the first object obtained. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Integer>} cRetElem The number of elements actually obtained. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_POINTER, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
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
     * All elements requested were obtained.
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
     * Not all elements requested were obtained. The number of elements obtained was written to <i>pcRetElem</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ienumeventobject-next
     */
    Next(cReqElem, ppInterface, cRetElem) {
        cRetElemMarshal := cRetElem is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", cReqElem, "ptr*", ppInterface, cRetElemMarshal, cRetElem, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning.
     * @returns {HRESULT} This method can return the following values.
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
     * The enumeration sequence was reset.
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
     * The enumeration sequence was reset, but there are no items in the enumerator.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ienumeventobject-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * Skips over the specified number of items in the enumeration sequence.
     * @param {Integer} cSkipElem The number of elements to be skipped.
     * @returns {HRESULT} This method can return the following values.
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
     * The requested number of elements was skipped.
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
     * The number of elements skipped was not the same as the number requested.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ienumeventobject-skip
     */
    Skip(cSkipElem) {
        result := ComCall(6, this, "uint", cSkipElem, "HRESULT")
        return result
    }
}
