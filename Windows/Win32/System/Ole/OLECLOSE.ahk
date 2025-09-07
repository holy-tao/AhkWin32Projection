#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether an object should be saved before closing.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-oleclose
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECLOSE{

    /**
     * The object should be saved if it is dirty.
     * @type {Integer (Int32)}
     */
    static OLECLOSE_SAVEIFDIRTY => 0

    /**
     * The object should not be saved, even if it is dirty. This flag is typically used when an object is being deleted.
     * @type {Integer (Int32)}
     */
    static OLECLOSE_NOSAVE => 1

    /**
     * If the object is dirty, the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a> implementation should display a dialog box to let the end user determine whether to save the object. However, if the object is in the running state but its user interface is invisible, the end user should not be prompted, and the close should be handled as if OLECLOSE_SAVEIFDIRTY had been specified.
     * @type {Integer (Int32)}
     */
    static OLECLOSE_PROMPTSAVE => 2
}
