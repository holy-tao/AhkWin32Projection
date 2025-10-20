#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowsetScroll.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetExactScroll extends IRowsetScroll{
    /**
     * The interface identifier for IRowsetExactScroll
     * @type {Guid}
     */
    static IID => Guid("{0c733a7f-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Byte>} pBookmark 
     * @param {Pointer<UIntPtr>} pulPosition 
     * @param {Pointer<UIntPtr>} pcRows 
     * @returns {HRESULT} 
     */
    GetExactPosition(hChapter, cbBookmark, pBookmark, pulPosition, pcRows) {
        result := ComCall(14, this, "ptr", hChapter, "ptr", cbBookmark, "char*", pBookmark, "ptr*", pulPosition, "ptr*", pcRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
