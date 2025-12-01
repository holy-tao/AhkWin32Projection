#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves information about an assembly when using managed code in the .NET Framework common language runtime.
 * @remarks
 * To create this object, call [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. A ClrAssemblyLocator object can be declared using "COMSVCSLib.ClrAssemblyLocator" as the class name.
 * @see https://learn.microsoft.com/windows/win32/cossdk/clrassemblylocator
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ClrAssemblyLocator extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
