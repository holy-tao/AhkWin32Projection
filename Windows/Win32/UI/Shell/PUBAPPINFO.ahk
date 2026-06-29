#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * Provides information about a published application from an application publisher to Add/Remove Programs in Control Panel.
 * @see https://learn.microsoft.com/windows/win32/api/shappmgr/ns-shappmgr-pubappinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PUBAPPINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A value of type <b>DWORD</b> that specifies the size of the structure. This member is set by the <b>Add/Remove Programs</b> utility.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * A bitmask that indicates which items in the structure are valid. This member can contain one or more <a href="https://docs.microsoft.com/windows/win32/api/shappmgr/ne-shappmgr-pubappinfoflags">PUBAPPINFOFLAGS</a>.
     */
    dwMask : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a string containing the display name of the publisher. This name appears in <b>Add/Remove Programs</b> if duplicate application names are encountered. The string buffer must be allocated using the Shell task allocator.
     */
    pszSource : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * The time when an application manager schedules the application installation.  <b>Add/Remove Programs</b> does not allow the user to schedule an installation time later than the value in this member. This member is ignored if it describes a time prior to the current time.
     */
    stAssigned : SYSTEMTIME

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     */
    stPublished : SYSTEMTIME

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * The installation time that the user sets by clicking <b>Add Later</b>. <b>Add/Remove Programs</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ipublishedapp-install">IPublishedApp::Install</a> method with the <i>pInstallTime</i> parameter pointing to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the time the user entered. The application publisher maintains this value for installation scheduling. <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ipublishedapp-getpublishedappinfo">IPublishedApp::GetPublishedAppInfo</a> returns the scheduled installation time in this member if the scheduled time has not been canceled using <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ipublishedapp-unschedule">IPublishedApp::Unschedule</a>.
     */
    stScheduled : SYSTEMTIME

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * The time after which you cannot install the published application using <b>Add/Remove Programs</b>.
     */
    stExpire : SYSTEMTIME

}
