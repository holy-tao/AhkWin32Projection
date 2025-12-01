#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Binds a managed object to an application domain, which is an isolated environment where applications execute.
 * @remarks
 * To create this object, call [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. An AppDomainHelper object can be declared using "COMSVCSLib.AppDomainHelper" as the class name.
 * @see https://learn.microsoft.com/windows/win32/cossdk/appdomainhelper
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class AppDomainHelper extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
