#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Creates shared property groups and to obtain access to existing shared property groups.
 * @remarks
 * To create this object, call [**IObjectContext::CreateInstance**](/windows/desktop/api/ComSvcs/nf-comsvcs-iobjectcontext-createinstance).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. A SharedPropertyGroupManager object can be declared using "COMSVCSLib.SharedPropertyGroupManager" as the class name.
 * @see https://learn.microsoft.com/windows/win32/cossdk/sharedpropertygroupmanager
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class SharedPropertyGroupManager extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
