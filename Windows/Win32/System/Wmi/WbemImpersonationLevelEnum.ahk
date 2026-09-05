#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Define the security impersonation levels. These constants are used with SWbemSecurity.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemimpersonationlevelenum
 * @namespace Windows.Win32.System.Wmi
 */
class WbemImpersonationLevelEnum extends Win32Enum {

    /**
     * Short name: Anonymous
     * 
     * Hides the credentials of the caller. Calls to WMI may fail with this impersonation level.
     * Native name: wbemImpersonationLevelAnonymous
     * @type {Integer (Int32)}
     */
    static Anonymous => 1

    /**
     * Short name: Identify
     * 
     * Allows objects to query the credentials of the caller. Calls to WMI may fail with this impersonation level.
     * Native name: wbemImpersonationLevelIdentify
     * @type {Integer (Int32)}
     */
    static Identify => 2

    /**
     * Short name: Impersonate
     * 
     * Allows objects to use the credentials of the caller. This is the recommended impersonation level for Scripting API for WMI calls.
     * Native name: wbemImpersonationLevelImpersonate
     * @type {Integer (Int32)}
     */
    static Impersonate => 3

    /**
     * Short name: Delegate
     * 
     * Allows objects to permit other objects to use the credentials of the caller. This impersonation will work with Scripting API for WMI calls but may constitute an unnecessary security risk.
     * Native name: wbemImpersonationLevelDelegate
     * @type {Integer (Int32)}
     */
    static Delegate => 4
}
