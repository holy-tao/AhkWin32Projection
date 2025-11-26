#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfLangBarItems.ahk
#Include .\ITfLangBarItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfLangBarItems interface is implemented by the TSF manager to provide an enumeration of langauge bar item objects.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-ienumtflangbaritems
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfLangBarItems extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTfLangBarItems
     * @type {Guid}
     */
    static IID => Guid("{583f34d0-de25-11d2-afdd-00105a2799b5}")

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
     * IEnumTfLangBarItems::Clone method
     * @returns {IEnumTfLangBarItems} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-ienumtflangbaritems">IEnumTfLangBarItems</a> interface pointer that receives the new enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-ienumtflangbaritems-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfLangBarItems(ppEnum)
    }

    /**
     * IEnumTfLangBarItems::Next method
     * @param {Integer} ulCount Specifies the number of elements to obtain.
     * @param {Pointer<Integer>} pcFetched [in, out] Pointer to a ULONG value that receives the number of elements obtained. This value can be less than the number of items requested. This parameter can be <b>NULL</b>.
     * @returns {ITfLangBarItem} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itflangbaritem">ITfLangBarItem</a> interface pointers that receives the requested objects. This array must be at least <i>ulCount</i> elements in size.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-ienumtflangbaritems-next
     */
    Next(ulCount, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, "ptr*", &ppItem := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return ITfLangBarItem(ppItem)
    }

    /**
     * IEnumTfLangBarItems::Reset method
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-ienumtflangbaritems-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * IEnumTfLangBarItems::Skip method
     * @param {Integer} ulCount Contains the number of elements to skip.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * The method reached the end of the enumeration before the specified number of elements could be skipped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-ienumtflangbaritems-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }
}
