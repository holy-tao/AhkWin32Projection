#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Creates and accesses the shared properties in a shared property group.
 * @remarks
 * You can create a **SharedPropertyGroup** object using the [**CreatePropertyGroup**](/windows/desktop/api/ComSvcs/nf-comsvcs-isharedpropertygroupmanager-createpropertygroup) method of [**ISharedPropertyGroupManager**](/windows/desktop/api/ComSvcs/nn-comsvcs-isharedpropertygroupmanager).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. A SharedPropertyGroup object is created by calling the [**CreatePropertyGroup**](/windows/desktop/api/ComSvcs/nf-comsvcs-isharedpropertygroupmanager-createpropertygroup) method of the [**SharedPropertyGroupManager**](sharedpropertygroupmanager.md) object.
 * @see https://learn.microsoft.com/windows/win32/cossdk/sharedpropertygroup
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct SharedPropertyGroup {
    #StructPack 1

}
