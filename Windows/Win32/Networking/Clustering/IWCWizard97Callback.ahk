#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWCWizard97Callback interface is called by a Failover Cluster Administrator extension to add a Wizard97 property page to a Wizard97 wizard, such as the Cluster Application Wizard.
 * @remarks
 * 
  * Use the piCallback pointer that you receive when Cluster Administrator calls your 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendwizard97-createwizard97pages">IWEExtendWizard97::CreateWizard97Pages</a> 
  *      method to call the methods of the 
  *      <b>IWCWizard97Callback</b> interface.
  * 
  * To add non-Wizard97 pages use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-iwcwizardcallback">IWCWizardCallback</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-iwcwizard97callback
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWCWizard97Callback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWCWizard97Callback
     * @type {Guid}
     */
    static IID => Guid("{97dede67-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddWizard97Page", "EnableNext"]

    /**
     * 
     * @param {Pointer<Integer>} hpage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iwcwizard97callback-addwizard97page
     */
    AddWizard97Page(hpage) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, hpageMarshal, hpage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} hpage 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iwcwizard97callback-enablenext
     */
    EnableNext(hpage, bEnable) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, hpageMarshal, hpage, "int", bEnable, "HRESULT")
        return result
    }
}
