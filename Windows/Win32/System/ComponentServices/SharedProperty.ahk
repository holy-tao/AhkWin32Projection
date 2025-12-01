#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sets or retrieves the value of a shared property.
 * @remarks
 * You can create a **SharedProperty** object by using the [**CreateProperty**](/windows/desktop/api/ComSvcs/nf-comsvcs-isharedpropertygroup-createproperty) or [**CreatePropertyByPosition**](/windows/desktop/api/ComSvcs/nf-comsvcs-isharedpropertygroup-createpropertybyposition) methods of [**ISharedPropertyGroup**](/windows/desktop/api/ComSvcs/nn-comsvcs-isharedpropertygroup).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. A SharedProperty object is created by calling the [**CreateProperty**](/windows/desktop/api/ComSvcs/nf-comsvcs-isharedpropertygroup-createproperty) or [**CreatePropertyByPosition**](/windows/desktop/api/ComSvcs/nf-comsvcs-isharedpropertygroup-createpropertybyposition) methods of the [**SharedPropertyGroup**](sharedpropertygroup.md) object.
 * @see https://learn.microsoft.com/windows/win32/cossdk/sharedproperty
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class SharedProperty extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
