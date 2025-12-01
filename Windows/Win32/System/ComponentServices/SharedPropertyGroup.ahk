#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Creates and accesses the shared properties in a shared property group.
 * @remarks
 * You can create a **SharedPropertyGroup** object using the [**CreatePropertyGroup**](/windows/desktop/api/ComSvcs/nf-comsvcs-isharedpropertygroupmanager-createpropertygroup) method of [**ISharedPropertyGroupManager**](/windows/desktop/api/ComSvcs/nn-comsvcs-isharedpropertygroupmanager).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. A SharedPropertyGroup object is created by calling the [**CreatePropertyGroup**](/windows/desktop/api/ComSvcs/nf-comsvcs-isharedpropertygroupmanager-createpropertygroup) method of the [**SharedPropertyGroupManager**](sharedpropertygroupmanager.md) object.
 * @see https://learn.microsoft.com/windows/win32/cossdk/sharedpropertygroup
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class SharedPropertyGroup extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
