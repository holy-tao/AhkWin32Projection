#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Creates shared property groups and to obtain access to existing shared property groups.
 * @remarks
 * To create this object, call [**IObjectContext::CreateInstance**](/windows/desktop/api/ComSvcs/nf-comsvcs-iobjectcontext-createinstance).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. A SharedPropertyGroupManager object can be declared using "COMSVCSLib.SharedPropertyGroupManager" as the class name.
 * @see https://learn.microsoft.com/windows/win32/cossdk/sharedpropertygroupmanager
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct SharedPropertyGroupManager {
    #StructPack 1

}
