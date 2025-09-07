#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the state of a property. They are set manually by the code that is hosting the in-memory property store cache.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/ne-propsys-psc_state
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PSC_STATE{

    /**
     * The property has not been altered.
     * @type {Integer (Int32)}
     */
    static PSC_NORMAL => 0

    /**
     * The requested property does not exist for the file or stream on which the property handler was initialized.
     * @type {Integer (Int32)}
     */
    static PSC_NOTINSOURCE => 1

    /**
     * The property has been altered but has not yet been committed to the file or stream.
     * @type {Integer (Int32)}
     */
    static PSC_DIRTY => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PSC_READONLY => 3
}
