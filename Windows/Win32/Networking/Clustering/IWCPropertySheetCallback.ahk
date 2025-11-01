#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWCPropertySheetCallback interface is called by a Failover Cluster Administrator extension to add property pages to a Failover Cluster Administrator property sheet.
 * @remarks
 * 
  * Use the <i>piCallback</i> pointer that you receive when Failover Cluster Administrator calls 
  *      your 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendpropertysheet-createpropertysheetpages">IWEExtendPropertySheet::CreatePropertySheetPages</a> 
  *      method to call the <b>IWCPropertySheetCallback</b> 
  *      interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-iwcpropertysheetcallback
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWCPropertySheetCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWCPropertySheetCallback
     * @type {Guid}
     */
    static IID => Guid("{97dede60-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPropertySheetPage"]

    /**
     * 
     * @param {Pointer<Integer>} hpage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iwcpropertysheetcallback-addpropertysheetpage
     */
    AddPropertySheetPage(hpage) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, hpageMarshal, hpage, "HRESULT")
        return result
    }
}
