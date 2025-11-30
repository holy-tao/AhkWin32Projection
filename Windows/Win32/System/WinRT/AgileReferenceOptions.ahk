#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies options for the RoGetAgileReference function.
 * @see https://docs.microsoft.com/windows/win32/api//combaseapi/ne-combaseapi-agilereferenceoptions
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class AgileReferenceOptions extends Win32Enum{

    /**
     * Use the default marshaling behavior, which is to marshal interfaces when an agile reference to the interface is obtained.
     * @type {Integer (Int32)}
     */
    static AGILEREFERENCE_DEFAULT => 0

    /**
     * Marshaling happens on demand.  Use this option only in situations where it's known that an object is only resolved from the same apartment in which it was registered.
     * @type {Integer (Int32)}
     */
    static AGILEREFERENCE_DELAYEDMARSHAL => 1
}
