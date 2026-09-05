#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EApiCategories extends Win32Enum {

    /**
     * Native name: eNoChecks
     * @type {Integer (Int32)}
     */
    static NoChecks => 0

    /**
     * Native name: eSynchronization
     * @type {Integer (Int32)}
     */
    static Synchronization => 1

    /**
     * Native name: eSharedState
     * @type {Integer (Int32)}
     */
    static SharedState => 2

    /**
     * Native name: eExternalProcessMgmt
     * @type {Integer (Int32)}
     */
    static ExternalProcessMgmt => 4

    /**
     * Native name: eSelfAffectingProcessMgmt
     * @type {Integer (Int32)}
     */
    static SelfAffectingProcessMgmt => 8

    /**
     * Native name: eExternalThreading
     * @type {Integer (Int32)}
     */
    static ExternalThreading => 16

    /**
     * Native name: eSelfAffectingThreading
     * @type {Integer (Int32)}
     */
    static SelfAffectingThreading => 32

    /**
     * Native name: eSecurityInfrastructure
     * @type {Integer (Int32)}
     */
    static SecurityInfrastructure => 64

    /**
     * @type {Integer (Int32)}
     */
    static eUI => 128

    /**
     * Native name: eMayLeakOnAbort
     * @type {Integer (Int32)}
     */
    static MayLeakOnAbort => 256

    /**
     * Native name: eAll
     * @type {Integer (Int32)}
     */
    static All => 511
}
