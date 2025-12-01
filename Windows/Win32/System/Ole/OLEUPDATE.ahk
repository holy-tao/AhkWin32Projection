#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the linked object updates the cached data for the linked object automatically or only when the container calls either the IOleObject::Update or IOleLink::Update methods. The constants are used in the IOleLink interface.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-oleupdate
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLEUPDATE extends Win32Enum{

    /**
     * Update the link object whenever possible, this option corresponds to the <b>Automatic update</b> option in the <b>Links</b> dialog box.
     * @type {Integer (Int32)}
     */
    static OLEUPDATE_ALWAYS => 1

    /**
     * Update the link object only when <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-update">IOleObject::Update</a> or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-update">IOleLink::Update</a> is called, this option corresponds to the <b>Manual update</b> option in the <b>Links</b> dialog box.
     * @type {Integer (Int32)}
     */
    static OLEUPDATE_ONCALL => 3
}
