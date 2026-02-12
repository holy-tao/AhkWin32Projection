#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values in the pages have changed, so the state of the <b>Apply</b> button should be updated.
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipropertypagesite-onstatuschange
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PROPPAGESTATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PROPPAGESTATUS_DIRTY => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROPPAGESTATUS_VALIDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROPPAGESTATUS_CLEAN => 4
}
