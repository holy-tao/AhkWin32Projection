#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsSignatureBlock.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsSignatureBlock interfaces.
 * @remarks
 * 
  * This interface cannot exist independently from the signature manager from which it was instantiated.
  * 
  * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblockcollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSignatureBlockCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsSignatureBlockCollection
     * @type {Guid}
     */
    static IID => Guid("{23397050-fe99-467a-8dce-9237f074ffe4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "RemoveAt"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblockcollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IXpsSignatureBlock} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblockcollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &signatureBlock := 0, "HRESULT")
        return IXpsSignatureBlock(signatureBlock)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblockcollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(5, this, "uint", index, "HRESULT")
        return result
    }
}
