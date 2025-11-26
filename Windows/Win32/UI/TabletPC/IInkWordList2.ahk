#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Adds members to the InkWordList Class.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkwordlist2
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkWordList2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkWordList2
     * @type {Guid}
     */
    static IID => Guid("{14542586-11bf-4f5f-b6e7-49d0744aab6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddWords"]

    /**
     * Adds more than one word to an InkWordList in a single operation.
     * @param {BSTR} NewWords A <b>BSTR</b> of <b>NULL</b> separated words terminated by a double <b>NULL</b> containing the words to add to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkwordlist-class">InkWordList</a>.
     * 
     * For more information about the <b>BSTR</b> data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
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
     * At least one word already exists in the list.
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
     * Cannot allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkwordlist2-addwords
     */
    AddWords(NewWords) {
        NewWords := NewWords is String ? BSTR.Alloc(NewWords).Value : NewWords

        result := ComCall(7, this, "ptr", NewWords, "HRESULT")
        return result
    }
}
