#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason that an app broadcast plugin was activated in the foreground.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.foregroundactivationargument
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ForegroundActivationArgument extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SignInRequired => 0

    /**
     * @type {Integer (Int32)}
     */
    static MoreSettings => 1
}
