#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement the IWEExtendWizard interface to add wizard pages to Failover Cluster Administrator's New Resource Wizard or Cluster Application Wizard.
 * @remarks
 * 
  * To support Wizard97 wizards and wizard pages, implement the 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-iweextendwizard97">IWEExtendWizard97</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-iweextendwizard
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWEExtendWizard extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWEExtendWizard
     * @type {Guid}
     */
    static IID => Guid("{97dede63-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWizardPages"]

    /**
     * 
     * @param {IUnknown} piData 
     * @param {IWCWizardCallback} piCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iweextendwizard-createwizardpages
     */
    CreateWizardPages(piData, piCallback) {
        result := ComCall(3, this, "ptr", piData, "ptr", piCallback, "HRESULT")
        return result
    }
}
