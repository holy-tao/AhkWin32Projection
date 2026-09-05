#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of information that an object should store in the OLECMDTEXT structure passed in IOleCommandTarget::QueryStatus.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ne-docobj-olecmdtextf
 * @namespace Windows.Win32.System.Ole
 */
class OLECMDTEXTF extends Win32Enum {

    /**
     * No extra information is requested.
     * Native name: OLECMDTEXTF_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The object should provide the localized name of the command.
     * Native name: OLECMDTEXTF_NAME
     * @type {Integer (Int32)}
     */
    static NAME => 1

    /**
     * The object should provide a localized status string for the command.
     * Native name: OLECMDTEXTF_STATUS
     * @type {Integer (Int32)}
     */
    static STATUS => 2
}
