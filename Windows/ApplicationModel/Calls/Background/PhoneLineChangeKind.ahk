#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of change for a background phone line change trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonelinechangekind
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneLineChangeKind extends Win32Enum{

    /**
     * A new phone line was added.
     * @type {Integer (Int32)}
     */
    static Added => 0

    /**
     * A phone line was removed.
     * @type {Integer (Int32)}
     */
    static Removed => 1

    /**
     * A phone line has updated properties.
     * @type {Integer (Int32)}
     */
    static PropertiesChanged => 2
}
