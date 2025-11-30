#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of information that an object should store in the OLECMDTEXT structure passed in IOleCommandTarget::QueryStatus.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/ne-docobj-olecmdtextf
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECMDTEXTF extends Win32Enum{

    /**
     * No extra information is requested.
     * @type {Integer (Int32)}
     */
    static OLECMDTEXTF_NONE => 0

    /**
     * The object should provide the localized name of the command.
     * @type {Integer (Int32)}
     */
    static OLECMDTEXTF_NAME => 1

    /**
     * The object should provide a localized status string for the command.
     * @type {Integer (Int32)}
     */
    static OLECMDTEXTF_STATUS => 2
}
