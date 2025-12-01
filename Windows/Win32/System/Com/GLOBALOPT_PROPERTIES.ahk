#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The GLOBALOPT_PROPERTIES (objidlbase.h) enumeration identifies process-global options that you can set or query by using the IGlobalOptions interface.
 * @remarks
 * The unmarshaling policy option <b>COMGLB_UNMARSHALING_POLICY</b> takes values from the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ne-objidl-globalopt_unmarshaling_policy_values">GLOBALOPT_UNMARSHALING_POLICY_VALUES</a> enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ne-objidlbase-globalopt_properties
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class GLOBALOPT_PROPERTIES extends Win32Enum{

    /**
     * Defines COM exception-handling behavior.
     * @type {Integer (Int32)}
     */
    static COMGLB_EXCEPTION_HANDLING => 1

    /**
     * Sets the AppID for the process.
     * @type {Integer (Int32)}
     */
    static COMGLB_APPID => 2

    /**
     * Sets the thread-pool behavior of the RPC runtime in the process.
     * @type {Integer (Int32)}
     */
    static COMGLB_RPC_THREADPOOL_SETTING => 3

    /**
     * Used for miscellaneous settings.
     * @type {Integer (Int32)}
     */
    static COMGLB_RO_SETTINGS => 4

    /**
     * Defines the policy that's applied in the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-counmarshalinterface">CoUnmarshalInterface</a> function.
     * @type {Integer (Int32)}
     */
    static COMGLB_UNMARSHALING_POLICY => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static COMGLB_PROPERTIES_RESERVED1 => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static COMGLB_PROPERTIES_RESERVED2 => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static COMGLB_PROPERTIES_RESERVED3 => 8
}
