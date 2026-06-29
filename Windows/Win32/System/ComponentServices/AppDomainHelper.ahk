#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Binds a managed object to an application domain, which is an isolated environment where applications execute.
 * @remarks
 * To create this object, call [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. An AppDomainHelper object can be declared using "COMSVCSLib.AppDomainHelper" as the class name.
 * @see https://learn.microsoft.com/windows/win32/cossdk/appdomainhelper
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct AppDomainHelper {
    #StructPack 1

}
