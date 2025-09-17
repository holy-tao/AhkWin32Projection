#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * Provides information about a published application from an application publisher to Add/Remove Programs in Control Panel.
 * @see https://learn.microsoft.com/windows/win32/api/shappmgr/ns-shappmgr-pubappinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class PUBAPPINFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A value of type <b>DWORD</b> that specifies the size of the structure. This member is set by the <b>Add/Remove Programs</b> utility.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A bitmask that indicates which items in the structure are valid. This member can contain one or more <a href="https://docs.microsoft.com/windows/win32/api/shappmgr/ne-shappmgr-pubappinfoflags">PUBAPPINFOFLAGS</a>.
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a string containing the display name of the publisher. This name appears in <b>Add/Remove Programs</b> if duplicate application names are encountered. The string buffer must be allocated using the Shell task allocator.
     * @type {Pointer<Char>}
     */
    pszSource {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * The time when an application manager schedules the application installation.  <b>Add/Remove Programs</b> does not allow the user to schedule an installation time later than the value in this member. This member is ignored if it describes a time prior to the current time.
     * @type {SYSTEMTIME}
     */
    stAssigned{
        get {
            if(!this.HasProp("__stAssigned"))
                this.__stAssigned := SYSTEMTIME(this.ptr + 16)
            return this.__stAssigned
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * @type {SYSTEMTIME}
     */
    stPublished{
        get {
            if(!this.HasProp("__stPublished"))
                this.__stPublished := SYSTEMTIME(this.ptr + 32)
            return this.__stPublished
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * The installation time that the user sets by clicking <b>Add Later</b>. <b>Add/Remove Programs</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ipublishedapp-install">IPublishedApp::Install</a> method with the <i>pInstallTime</i> parameter pointing to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the time the user entered. The application publisher maintains this value for installation scheduling. <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ipublishedapp-getpublishedappinfo">IPublishedApp::GetPublishedAppInfo</a> returns the scheduled installation time in this member if the scheduled time has not been canceled using <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ipublishedapp-unschedule">IPublishedApp::Unschedule</a>.
     * @type {SYSTEMTIME}
     */
    stScheduled{
        get {
            if(!this.HasProp("__stScheduled"))
                this.__stScheduled := SYSTEMTIME(this.ptr + 48)
            return this.__stScheduled
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * The time after which you cannot install the published application using <b>Add/Remove Programs</b>.
     * @type {SYSTEMTIME}
     */
    stExpire{
        get {
            if(!this.HasProp("__stExpire"))
                this.__stExpire := SYSTEMTIME(this.ptr + 64)
            return this.__stExpire
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 80
    }
}
