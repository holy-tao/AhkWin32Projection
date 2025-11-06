#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Ole\IEnumVARIANT.ahk
#Include .\IProgressItem.ahk
#Include .\IEnumProgressItems.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to enumerate the progress items in a result image.
 * @remarks
 * 
  * This is a <b>ProgressItems</b> object in script.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-iprogressitems
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IProgressItems extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProgressItems
     * @type {Guid}
     */
    static IID => Guid("{2c941fd7-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for ProgressItems
     * @type {Guid}
     */
    static CLSID => Guid("{2c941fc9-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "ProgressItemFromBlock", "ProgressItemFromDescription", "get_EnumProgressItems"]

    /**
     * 
     * @returns {IEnumVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitems-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumVARIANT(NewEnum)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IProgressItem} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitems-get_item
     */
    get_Item(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &item := 0, "HRESULT")
        return IProgressItem(item)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitems-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {Integer} block 
     * @returns {IProgressItem} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitems-progressitemfromblock
     */
    ProgressItemFromBlock(block) {
        result := ComCall(10, this, "uint", block, "ptr*", &item := 0, "HRESULT")
        return IProgressItem(item)
    }

    /**
     * 
     * @param {BSTR} description 
     * @returns {IProgressItem} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitems-progressitemfromdescription
     */
    ProgressItemFromDescription(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(11, this, "ptr", description, "ptr*", &item := 0, "HRESULT")
        return IProgressItem(item)
    }

    /**
     * 
     * @returns {IEnumProgressItems} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitems-get_enumprogressitems
     */
    get_EnumProgressItems() {
        result := ComCall(12, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumProgressItems(NewEnum)
    }
}
