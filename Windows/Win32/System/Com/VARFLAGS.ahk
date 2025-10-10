#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies variable flags.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ne-oaidl-varflags
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class VARFLAGS{

    /**
     * Assignment to the variable should not be allowed.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FREADONLY => 1

    /**
     * The variable returns an object that is a source of events.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FSOURCE => 2

    /**
     * The variable supports data binding.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FBINDABLE => 4

    /**
     * When set, any attempt to directly change the property results in a call to <b>IPropertyNotifySink::OnRequestEdit</b>. The implementation of <b>OnRequestEdit</b> determines if the change is accepted.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FREQUESTEDIT => 8

    /**
     * The variable is displayed to the user as bindable. VARFLAG_FBINDABLE must also be set.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FDISPLAYBIND => 16

    /**
     * The variable is the single property that best represents the object. Only one variable in type information can have this attribute.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FDEFAULTBIND => 32

    /**
     * The variable should not be displayed to the user in a browser, although it exists and is bindable.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FHIDDEN => 64

    /**
     * The variable should not be accessible from macro languages. This flag is intended for system-level variables or variables that you do not want type browsers to display.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FRESTRICTED => 128

    /**
     * Permits an optimization in which the compiler looks for a member named "xyz" on the type of abc. If such a member is found and is flagged as an accessor function for an element of the default collection, then a call is generated to that member function. Permitted on members in dispinterfaces and interfaces; not permitted on modules.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FDEFAULTCOLLELEM => 256

    /**
     * The variable is the default display in the user interface.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FUIDEFAULT => 512

    /**
     * The variable appears in an object browser, but not in a properties browser.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FNONBROWSABLE => 1024

    /**
     * Tags the interface as having default behaviors.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FREPLACEABLE => 2048

    /**
     * The variable is mapped as individual bindable properties.
     * @type {Integer (UInt16)}
     */
    static VARFLAG_FIMMEDIATEBIND => 4096
}
