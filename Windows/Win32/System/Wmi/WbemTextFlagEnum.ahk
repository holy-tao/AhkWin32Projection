#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the content of generated object text and is used by SWbemObject.GetObjectText_.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemtextflagenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemTextFlagEnum extends Win32Enum{

    /**
     * Excludes qualifier flavors from the object text.
     * @type {Integer (Int32)}
     */
    static wbemTextFlagNoFlavors => 1
}
