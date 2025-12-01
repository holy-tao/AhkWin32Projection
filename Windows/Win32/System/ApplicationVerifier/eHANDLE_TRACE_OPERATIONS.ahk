#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of handle operation that has occurred.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ne-avrfsdk-ehandle_trace_operations
 * @namespace Windows.Win32.System.ApplicationVerifier
 * @version v4.0.30319
 */
class eHANDLE_TRACE_OPERATIONS extends Win32Enum{

    /**
     * Not used at this time.
     * @type {Integer (Int32)}
     */
    static OperationDbUnused => 0

    /**
     * Specifies an open (create) handle operation.
     * @type {Integer (Int32)}
     */
    static OperationDbOPEN => 1

    /**
     * Specifies a close handle operation.
     * @type {Integer (Int32)}
     */
    static OperationDbCLOSE => 2

    /**
     * Specifies an invalid handle operation.
     * @type {Integer (Int32)}
     */
    static OperationDbBADREF => 3
}
