#Requires AutoHotkey v2.0.0 64-bit

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
 * @version v4.0.30319
 */
class READYSTATE{

    /**
     * Default initialization state.
     * @type {Integer (Int32)}
     */
    static READYSTATE_UNINITIALIZED => 0

    /**
     * Object is loading its properties.
     * @type {Integer (Int32)}
     */
    static READYSTATE_LOADING => 1

    /**
     * Object has been initialized.
     * @type {Integer (Int32)}
     */
    static READYSTATE_LOADED => 2

    /**
     * Object is interactive, but not all its data is available.
     * @type {Integer (Int32)}
     */
    static READYSTATE_INTERACTIVE => 3

    /**
     * Object has received all its data.
     * @type {Integer (Int32)}
     */
    static READYSTATE_COMPLETE => 4
}
