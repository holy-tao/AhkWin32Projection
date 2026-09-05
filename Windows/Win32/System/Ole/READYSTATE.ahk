#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ReadyState property retrieves the ReadyState of the MSWebDVD object.
 * @remarks
 * This property is read-only with no default value.
 * 
 * Returns an integer value representing the control's ReadyState.
 * 
 * Any object embedded in a Web page exposes the <c>ReadyState</c> property.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-readystate
 * @namespace Windows.Win32.System.Ole
 */
class READYSTATE extends Win32Enum {

    /**
     * Default initialization state.
     * Native name: READYSTATE_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static UNINITIALIZED => 0

    /**
     * Object is loading its properties.
     * Native name: READYSTATE_LOADING
     * @type {Integer (Int32)}
     */
    static LOADING => 1

    /**
     * Object has been initialized.
     * Native name: READYSTATE_LOADED
     * @type {Integer (Int32)}
     */
    static LOADED => 2

    /**
     * Object is interactive, but not all its data is available.
     * Native name: READYSTATE_INTERACTIVE
     * @type {Integer (Int32)}
     */
    static INTERACTIVE => 3

    /**
     * Object has received all its data.
     * Native name: READYSTATE_COMPLETE
     * @type {Integer (Int32)}
     */
    static COMPLETE => 4
}
