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
     * 
     * @param {Pointer} itemID 
     * @returns {HRESULT} 
     */
    RenameResultItem(itemID) {
        result := ComCall(18, this, "ptr", itemID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
