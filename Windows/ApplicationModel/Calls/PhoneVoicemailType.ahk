#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of voice mail associated with a [PhoneLine](phoneline.md) instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonevoicemailtype
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneVoicemailType extends Win32Enum{

    /**
     * The phone line has no voice mail.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The phone line has traditional voice mail.
     * @type {Integer (Int32)}
     */
    static Traditional => 1

    /**
     * The phone line has visual voice mail.
     * @type {Integer (Int32)}
     */
    static Visual => 2
}
