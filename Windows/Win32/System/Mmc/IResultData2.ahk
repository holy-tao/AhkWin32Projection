#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IResultData.ahk

/**
 * The IResultData2 interface supersedes the IResultData interface. The IResultData2 interface contains the IResultData2::RenameResultItem method, which allows a result node to programmatically be put in rename mode.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iresultdata2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IResultData2 extends IResultData{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResultData2
     * @type {Guid}
     */
    static IID => Guid("{0f36e0eb-a7f1-4a81-be5a-9247f7de4b1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RenameResultItem"]

    /**
     * The RenameResultItem method programmatically places the specified result item into rename mode, after which, the user can manually enter the new name.
     * @param {Pointer} itemID The result item being placed into rename mode. When applied to virtual lists, pass the item index instead of the result item.
     * @returns {HRESULT} If successful, the return value is S_OK; otherwise, the return value is an error code.  The <a href="/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and/or <a href="/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros can be used to evaluate the return value. If the Rename verb is not enabled, this method returns E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata2-renameresultitem
     */
    RenameResultItem(itemID) {
        result := ComCall(18, this, "ptr", itemID, "HRESULT")
        return result
    }
}
