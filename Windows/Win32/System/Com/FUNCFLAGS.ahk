#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies function flags.
 * @remarks
 * FUNCFLAG_FHIDDEN means that the property should never be shown in object browsers, property browsers, and so on. This function is useful for removing items from an object model. Code can bind to the member, but the user will never know that the member exists.
  * 
  * FUNCFLAG_FNONBROWSABLE means that the property should not be displayed in a properties browser. It is used in circumstances in which an error would occur if the property were shown in a properties browser.
  * 
  * FUNCFLAG_FRESRICTED means that macro-oriented programmers should not be allowed to access this member. These members are usually treated as _FHIDDEN by tools such as Visual Basic, with the main difference being that code cannot bind to those members.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-funcflags
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class FUNCFLAGS{

    /**
     * The function should not be accessible from macro languages. This flag is intended for system-level functions or functions that type browsers should not display.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FRESTRICTED => 1

    /**
     * The function returns an object that is a source of events.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FSOURCE => 2

    /**
     * The function that supports data binding.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FBINDABLE => 4

    /**
     * When set, any call to a method that sets the property results first in a call to <b>IPropertyNotifySink::OnRequestEdit</b>. The implementation of <b>OnRequestEdit</b> determines if the call is allowed to set the property.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FREQUESTEDIT => 8

    /**
     * The function that is displayed to the user as bindable. FUNC_FBINDABLE must also be set.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FDISPLAYBIND => 16

    /**
     * The function that best represents the object. Only one function in a type information can have this attribute.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FDEFAULTBIND => 32

    /**
     * The function should not be displayed to the user, although it exists and is bindable.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FHIDDEN => 64

    /**
     * The function supports <b>GetLastError</b>. If an error occurs during the function, the caller can call <b>GetLastError</b> to retrieve the error code.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FUSESGETLASTERROR => 128

    /**
     * Permits an optimization in which the compiler looks for a member named xyz on the type of abc. If such a member is found and is flagged as an accessor function for an element of the default collection, then a call is generated to that member function. Permitted on members in dispinterfaces and interfaces; not permitted on modules. For more information, refer to defaultcollelem in Type Libraries and the Object Description Language.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FDEFAULTCOLLELEM => 256

    /**
     * The type information member is the default member for display in the user interface.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FUIDEFAULT => 512

    /**
     * The property appears in an object browser, but not in a properties browser.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FNONBROWSABLE => 1024

    /**
     * Tags the interface as having default behaviors.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FREPLACEABLE => 2048

    /**
     * Mapped as individual bindable properties.
     * @type {Integer (UInt16)}
     */
    static FUNCFLAG_FIMMEDIATEBIND => 4096
}
