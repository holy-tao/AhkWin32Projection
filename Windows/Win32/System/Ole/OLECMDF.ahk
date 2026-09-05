#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of support provided by an object for the command specified in an OLECMD structure.
 * @remarks
 * Values from the <b>OLECMDF</b> enumeration are used to fill the value of the <b>cmdf</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ns-docobj-olecmd">OLECMD</a> structures passed to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-querystatus">IOleCommandTarget::QueryStatus</a>.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ne-docobj-olecmdf
 * @namespace Windows.Win32.System.Ole
 */
class OLECMDF extends Win32Enum {

    /**
     * The command is supported by this object.
     * Native name: OLECMDF_SUPPORTED
     * @type {Integer (Int32)}
     */
    static SUPPORTED => 1

    /**
     * The command is available and enabled.
     * Native name: OLECMDF_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 2

    /**
     * The command is an on-off toggle and is currently on.
     * Native name: OLECMDF_LATCHED
     * @type {Integer (Int32)}
     */
    static LATCHED => 4

    /**
     * Reserved for future use.
     * Native name: OLECMDF_NINCHED
     * @type {Integer (Int32)}
     */
    static NINCHED => 8

    /**
     * The command is hidden.
     * Native name: OLECMDF_INVISIBLE
     * @type {Integer (Int32)}
     */
    static INVISIBLE => 16

    /**
     * The command is hidden on the context menu.
     * Native name: OLECMDF_DEFHIDEONCTXTMENU
     * @type {Integer (Int32)}
     */
    static DEFHIDEONCTXTMENU => 32
}
