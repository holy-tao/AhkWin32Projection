#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement the IWEExtendWizard97 interface to add Wizard97-style wizard pages to a Failover Cluster Administrator wizard.
 * @remarks
 * 
  * To create non-Wizard97 pages, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-iweextendwizard">IWEExtendWizard</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-iweextendwizard97
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWEExtendWizard97 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWEExtendWizard97
     * @type {Guid}
     */
    static IID => Guid("{97dede68-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWizard97Pages"]

    /**
     * 
     * @param {IUnknown} piData 
     * @param {IWCWizard97Callback} piCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iweextendwizard97-createwizard97pages
     */
    CreateWizard97Pages(piData, piCallback) {
        result := ComCall(3, this, "ptr", piData, "ptr", piCallback, "HRESULT")
        return result
    }
}
