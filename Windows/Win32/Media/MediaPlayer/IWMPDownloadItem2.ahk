#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPDownloadItem.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPDownloadItem2 extends IWMPDownloadItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPDownloadItem2
     * @type {Guid}
     */
    static IID => Guid("{9fbb3336-6da3-479d-b8ff-67d46e20a987}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getItemInfo"]

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     */
    getItemInfo(bstrItemName, pbstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(15, this, "ptr", bstrItemName, "ptr", pbstrVal, "HRESULT")
        return result
    }
}
