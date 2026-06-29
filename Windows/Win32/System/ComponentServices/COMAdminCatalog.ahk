#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Accesses the data that is stored in the COM+ catalog.
 * @remarks
 * To create this object, call [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Admin Type Library. A COMAdminCatalog object can be declared using "COMAdmin.COMAdminCatalog" as the class name.
 * 
 * In COM+ 1.5, released with Windows XP, the **COMAdminCatalog** class implements the [**ICOMAdminCatalog2**](/windows/desktop/api/ComAdmin/nn-comadmin-icomadmincatalog2) interface. However, in COM+ 1.0, released with Windows 2000, the **COMAdminCatalog** class implements only the [**ICOMAdminCatalog**](/windows/desktop/api/ComAdmin/nn-comadmin-icomadmincatalog) interface.
 * @see https://learn.microsoft.com/windows/win32/cossdk/comadmincatalog
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMAdminCatalog {
    #StructPack 1

}
