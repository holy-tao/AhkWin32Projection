#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicate why an [App Capability](/windows/uwp/packaging/app-capability-declarations) is unsupported on the current device
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.unsupportedapprequirementreasons
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class UnsupportedAppRequirementReasons extends Win32BitflagEnum{

    /**
     * The reason is unknown
     * @type {Integer (UInt32)}
     */
    static Unknown => 0

    /**
     * The system has indicated that the capability is not available
     * @type {Integer (UInt32)}
     */
    static DeniedBySystem => 1
}
