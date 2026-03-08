#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Adds a resource to the connection in RemoteApp and Desktop Connection. (IWorkspaceRegistration2.AddResource)
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspaceregistration-addresource
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class Workspace extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
