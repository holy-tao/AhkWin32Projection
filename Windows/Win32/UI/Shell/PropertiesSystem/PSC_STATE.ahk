#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the state of a property. They are set manually by the code that is hosting the in-memory property store cache.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/ne-propsys-psc_state
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
class PSC_STATE extends Win32Enum {

    /**
     * The property has not been altered.
     * Native name: PSC_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * The requested property does not exist for the file or stream on which the property handler was initialized.
     * Native name: PSC_NOTINSOURCE
     * @type {Integer (Int32)}
     */
    static NOTINSOURCE => 1

    /**
     * The property has been altered but has not yet been committed to the file or stream.
     * Native name: PSC_DIRTY
     * @type {Integer (Int32)}
     */
    static DIRTY => 2

    /**
     * Native name: PSC_READONLY
     * @type {Integer (Int32)}
     */
    static READONLY => 3
}
