#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides methods and properties used to create a session, represented by a Session object.
 * @remarks
 * The **WSMan** object has these types of members:
 * 
 * -   [Methods](#methods)
 * -   [Properties](#properties)
 * 
 * 
 * The **WSMan** object corresponds to the [**IWSMan**](/windows/desktop/api/WSManDisp/nn-wsmandisp-iwsman) and [**IWSManEx**](/windows/desktop/api/WSManDisp/nn-wsmandisp-iwsmanex) interfaces. **WSMan** is the only object that can be created directly using [CreateObject](/previous-versions//xzysf6hc(v=vs.85)).
 * @see https://learn.microsoft.com/windows/win32/WinRM/wsman
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMan extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
