#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of support provided by an object for the command specified in an OLECMD structure.
 * @remarks
 * 
 * Values from the <b>OLECMDF</b> enumeration are used to fill the value of the <b>cmdf</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ns-docobj-olecmd">OLECMD</a> structures passed to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-querystatus">IOleCommandTarget::QueryStatus</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//docobj/ne-docobj-olecmdf
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECMDF{

    /**
     * The command is supported by this object.
     * @type {Integer (Int32)}
     */
    static OLECMDF_SUPPORTED => 1

    /**
     * The command is available and enabled.
     * @type {Integer (Int32)}
     */
    static OLECMDF_ENABLED => 2

    /**
     * The command is an on-off toggle and is currently on.
     * @type {Integer (Int32)}
     */
    static OLECMDF_LATCHED => 4

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static OLECMDF_NINCHED => 8

    /**
     * The command is hidden.
     * @type {Integer (Int32)}
     */
    static OLECMDF_INVISIBLE => 16

    /**
     * The command is hidden on the context menu.
     * @type {Integer (Int32)}
     */
    static OLECMDF_DEFHIDEONCTXTMENU => 32
}
