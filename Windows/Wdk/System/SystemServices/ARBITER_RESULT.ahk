#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class ARBITER_RESULT extends Win32Enum {

    /**
     * Native name: ArbiterResultUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => -1

    /**
     * Native name: ArbiterResultSuccess
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Native name: ArbiterResultExternalConflict
     * @type {Integer (Int32)}
     */
    static ExternalConflict => 1

    /**
     * Native name: ArbiterResultNullRequest
     * @type {Integer (Int32)}
     */
    static NullRequest => 2
}
