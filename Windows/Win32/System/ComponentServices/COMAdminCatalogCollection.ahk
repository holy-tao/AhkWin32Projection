#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents any collection in the COM+ catalog. Use it to enumerate, add, remove, and retrieve items in a collection and to access related collections.
 * @remarks
 * You cannot directly create a **COMAdminCatalogCollection** object. To use the methods this object, you must create a [**COMAdminCatalog**](comadmincatalog.md) object, obtain a reference to [**ICOMAdminCatalog**](/windows/desktop/api/ComAdmin/nn-comadmin-icomadmincatalog), and then use [**ICOMAdminCatalog::GetCollection**](/windows/desktop/api/ComAdmin/nf-comadmin-icomadmincatalog-getcollection) to get a reference to an [**ICatalogCollection**](/windows/desktop/api/ComAdmin/nn-comadmin-icatalogcollection) interface that represents a top-level collection. This is shown in the following example, where "TopCollection" must be replaced by the name of one of the top-level COM+ administration collections.
 * 
 * 
 * ```C++
 *     HRESULT hr = CoCreateInstance(CLSID_COMAdminCatalog, NULL, 
 *       CLSCTX_INPROC_SERVER, IID_IUnknown, (void**)&pUnknown);
 *     if (FAILED (hr)) exit(0);  // Replace with specific error handling.
 *     hr = pUnknown->QueryInterface(IID_ICOMAdminCatalog, 
 *       (void**)&pCatalog); 
 *     if (FAILED (hr)) exit(0);  // Replace with specific error handling.
 *     hr = pCatalog->GetCollection(L"TopCollection", 
 *       (IDispatch**)&pTopColl);
 *     if (FAILED (hr)) exit(0);  // Replace with specific error handling.
 * ```
 * 
 * 
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Admin Type Library. A COMAdminCatalogCollection object can be created by calling [**GetCollection**](/windows/desktop/api/ComAdmin/nf-comadmin-icomadmincatalog-getcollection) on a [**COMAdminCatalog**](comadmincatalog.md) object. This is shown in the following example, where "TopCollection" must be replaced by the name of one of the top-level COM+ administration collections.
 * 
 * 
 * ```VB
 * Dim objCatalog As COMAdmin.COMAdminCatalog
 * Set objCatalog = CreateObject("COMAdmin.COMAdminCatalog")
 * Dim objTopCollection As COMAdmin.COMAdminCatalogCollection
 * Set objTopCollection = objCatalog.GetCollection("TopCollection")
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/cossdk/comadmincatalogcollection
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminCatalogCollection extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
