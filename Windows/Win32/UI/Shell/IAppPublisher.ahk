#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for publishing applications through Add/Remove Programs in Control Panel. This is the principal interface implemented for this purpose.
 * @remarks
 * 
  * <b>Add/Remove Programs</b> in Control Panel creates a registered publisher object and requests its <b>IAppPublisher</b> interface.  You can create published application objects using the application enumerator, which you create using <b>IAppPublisher</b>.
  * 
  * <b>Add/Remove Programs</b> gathers a list of published applications from publishers and then uses a publisher to display these applications with Microsoft Active Directory.  When the user clicks <b>Add New Programs</b> in <b>Add/Remove Programs,</b> a list of published applications appears.
  * 
  * You can publish applications in <b>Add/Remove Programs </b> using the following Component Object Model (COM) interfaces.
  * 
  * <ul>
  * <li><b>IAppPublisher</b></li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ienumpublishedapps">IEnumPublishedApps</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ipublishedapp">IPublishedApp</a>
  * </li>
  * </ul>
  * When you implement these interfaces, you must register your COM object in the registry.  To register your publisher, add your object's class identifier (CLSID) under the following registry key.
  * 
  * 
  * <pre xml:space="preserve"><b>HKEY_LOCAL_MACHINE</b>
  *    <b>Software</b>
  *       <b>Microsoft</b>
  *          <b>Windows</b>
  *             <b>CurrentVersion</b>
  *                <b>AppManagement</b>
  *                   <b>Publishers</b></pre>
  * 
  * 
  * For example, if your publisher is named "My Publisher", you  create a new key under "Publishers" named "My Publisher" with its default REG_SZ value as the publisher's CLSID:
  * 
  * 
  * <pre xml:space="preserve"><b>HKEY_LOCAL_MACHINE</b>
  *    <b>Software</b>
  *       <b>Microsoft</b>
  *          <b>Windows</b>
  *             <b>CurrentVersion</b>
  *                <b>AppManagement</b>
  *                   <b>Publishers</b>
  *                      <b>My Publisher</b>
  *                         (Default) = {4D05CD3D-FFED-46bb-B9F1-321C26BE6362}</pre>
  * 
  * 
  * You can also create the typical COM server registration entries as follows:
  * 
  * 
  * <pre xml:space="preserve"><b>HKEY_CLASSES_ROOT</b>
  *    <b>CLSID</b>
  *       <b>{469EE8CE-1B86-4524-9042-AAA44FD9C8F2}</b>
  *          (Default) = Sample Applications Publisher
  *          <b>InProcServer32</b>
  *             (Default) = pubdemo.dll
  *             <b>ThreadingModel</b> = Apartment</pre>
  * 
  * 
  * With the publisher registered in this way, <b>Add/Remove Programs</b> creates an instance of your object by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> for your object and requesting the approprite <b>IAppPublisher</b> interface when the <b>Add New Programs</b> view is populated. Using <b>IAppPublisher</b>, Add/Remove Programs retrieves the application enumerator (<a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ienumpublishedapps">IEnumPublishedApps</a>) and information that describes the published applications.  Your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ipublishedapp">IPublishedApp</a> is responsible for installing the associated application in its <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ipublishedapp-install">IPublishedApp::Install</a> method. Add/Remove Programs calls this method when the user clicks the <b>Add</b> or the <b>Add Later</b> button in the user interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nn-shappmgr-iapppublisher
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAppPublisher extends IUnknown{
    /**
     * The interface identifier for IAppPublisher
     * @type {Guid}
     */
    static IID => Guid("{07250a10-9cf9-11d1-9076-006008059382}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwCat 
     * @returns {HRESULT} 
     */
    GetNumberOfCategories(pdwCat) {
        result := ComCall(3, this, "uint*", pdwCat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<APPCATEGORYINFOLIST>} pAppCategoryList 
     * @returns {HRESULT} 
     */
    GetCategories(pAppCategoryList) {
        result := ComCall(4, this, "ptr", pAppCategoryList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwApps 
     * @returns {HRESULT} 
     */
    GetNumberOfApps(pdwApps) {
        result := ComCall(5, this, "uint*", pdwApps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pAppCategoryId 
     * @param {Pointer<IEnumPublishedApps>} ppepa 
     * @returns {HRESULT} 
     */
    EnumApps(pAppCategoryId, ppepa) {
        result := ComCall(6, this, "ptr", pAppCategoryId, "ptr", ppepa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
