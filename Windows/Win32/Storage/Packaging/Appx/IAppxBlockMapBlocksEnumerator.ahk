#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBlockMapBlock.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates the blocks from a block map in a single file.
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxblockmapblocksenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBlockMapBlocksEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBlockMapBlocksEnumerator
     * @type {Guid}
     */
    static IID => Guid("{6b429b5b-36ef-479e-b9eb-0c1482b49e16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrent", "GetHasCurrent", "MoveNext"]

    /**
     * Gets the block at the current position of the enumerator.
     * @remarks
     * The enumerator returned can be empty. In this case, a call to  <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxblockmapblocksenumerator-gethascurrent">GetHasCurrent</a> returns <b>false</b>. If the enumerator is not empty, it points to the first element, and this method returns the first item. Subsequently, the user should use <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxblockmapblocksenumerator-movenext">MoveNext</a> to move through the items, and call <b>GetHasCurrent</b> before using <b>GetCurrent</b> to access the item.
     * @returns {IAppxBlockMapBlock} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapblock">IAppxBlockMapBlock</a>**</b>
     * 
     * The current block.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxblockmapblocksenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(3, this, "ptr*", &block := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxBlockMapBlock(block)
    }

    /**
     * Determines whether there is a block at the current position of the enumerator.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the enumerator's current position references an item; <b>FALSE</b> if the enumerator has passed the last item in the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxblockmapblocksenumerator-gethascurrent
     */
    GetHasCurrent() {
        result := ComCall(4, this, "int*", &hasCurrent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hasCurrent
    }

    /**
     * Advances the position of the enumerator to the next block.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the enumerator successfully advances
     * 
     * <b>FALSE</b> if the enumerator has passed the end of the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxblockmapblocksenumerator-movenext
     */
    MoveNext() {
        result := ComCall(5, this, "int*", &hasNext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hasNext
    }
}
