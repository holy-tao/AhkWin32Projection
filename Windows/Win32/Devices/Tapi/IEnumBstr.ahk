#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumBstr.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumBstr interface provides COM-standard methods to enumerate BSTR strings.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-ienumbstr
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumBstr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumBstr
     * @type {Guid}
     */
    static IID => Guid("{35372049-0bc6-11d2-a033-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Reset", "Skip", "Clone"]

    /**
     * The Next method gets the next specified number of elements in the enumeration sequence. This method is hidden from Visual Basic and scripting languages. (IEnumBstr.Next)
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppStrings</i> parameter.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Integer>} pceltFetched Pointer to number of elements actually supplied. May be <b>NULL</b> if <i>celt</i> is one.
     * @returns {BSTR} Pointer to the list of <b>BSTR</b> pointers returned.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumbstr-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        ppStrings := BSTR()
        result := ComCall(3, this, "uint", celt, "ptr", ppStrings, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ppStrings
    }

    /**
     * The Reset method resets to the beginning of the enumeration sequence. This method is hidden from Visual Basic and scripting languages. (IEnumBstr.Reset)
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumbstr-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over the next specified number of elements in the enumeration sequence. This method is hidden from Visual Basic and scripting languages. (IEnumBstr.Skip)
     * @param {Integer} celt Number of elements to skip.
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
     * Number of elements skipped was <i>celt</i>.
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
     * Number of elements skipped was not <i>celt</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumbstr-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Clone method creates another enumerator that contains the same enumeration state as the current one. This method is hidden from Visual Basic and scripting languages. (IEnumBstr.Clone)
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumbstr">IEnumBstr</a> interface returned by this method. The application must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method on the 
     * <b>IEnumBstr</b> interface to free resources associated with it.
     * @returns {IEnumBstr} Pointer to new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumbstr">IEnumBstr</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumbstr-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumBstr(ppEnum)
    }
}
