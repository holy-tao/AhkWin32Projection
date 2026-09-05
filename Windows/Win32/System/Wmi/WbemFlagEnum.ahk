#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that are used by SWbemServices.ExecQuery, SWbemServices.ExecQueryAsync, SWbemServices.SubclassesOf, and SWbemServices.InstancesOf.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemflagenum
 * @namespace Windows.Win32.System.Wmi
 */
class WbemFlagEnum extends Win32Enum {

    /**
     * Causes the call to return immediately.
     * Native name: wbemFlagReturnImmediately
     * @type {Integer (Int32)}
     */
    static ReturnImmediately => 16

    /**
     * Causes this call to block until the call has completed.
     * Native name: wbemFlagReturnWhenComplete
     * @type {Integer (Int32)}
     */
    static ReturnWhenComplete => 0

    /**
     * Causes WMI to retain pointers to objects of the enumeration until the client releases the enumerator.
     * Native name: wbemFlagBidirectional
     * @type {Integer (Int32)}
     */
    static Bidirectional => 0

    /**
     * Causes a forward-only enumerator to be returned. Use this flag in combination with 
     *       <b>wbemFlagReturnImmediately</b> to request semisynchronous access. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * You can only iterate (as in a VBScript For Each statement) through a forward-only enumerator one time. The 
     *       memory containing the instances is released by WMI so that the enumerator cannot be rewound. Therefore, the 
     *       <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemobjectset-count">SWbemObjectSet.Count</a> method cannot be used since 
     *       it requires rewinding the enumerator.
     * 
     * Forward-only enumerators are generally much faster and use less 
     *       memory than conventional enumerators, but they do not allow calls to 
     *       <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemobject-clone-">SWbemObject.Clone</a>.
     * Native name: wbemFlagForwardOnly
     * @type {Integer (Int32)}
     */
    static ForwardOnly => 32

    /**
     * This flag must not be set, and must be ignored on receipt.
     * Native name: wbemFlagNoErrorObject
     * @type {Integer (Int32)}
     */
    static NoErrorObject => 64

    /**
     * Causes asynchronous calls to return an error object in the event of an error.
     * Native name: wbemFlagReturnErrorObject
     * @type {Integer (Int32)}
     */
    static ReturnErrorObject => 0

    /**
     * Causes asynchronous calls to send status updates to the 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemsink-onprogress">SWbemSink.OnProgress</a> event handler for your object 
     *      sink.
     * Native name: wbemFlagSendStatus
     * @type {Integer (Int32)}
     */
    static SendStatus => 128

    /**
     * Prevents asynchronous calls from sending status updates to the 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemsink-onprogress">SWbemSink.OnProgress</a> event handler for your object 
     *      sink.
     * Native name: wbemFlagDontSendStatus
     * @type {Integer (Int32)}
     */
    static DontSendStatus => 0

    /**
     * Native name: wbemFlagEnsureLocatable
     * @type {Integer (Int32)}
     */
    static EnsureLocatable => 256

    /**
     * Native name: wbemFlagDirectRead
     * @type {Integer (Int32)}
     */
    static DirectRead => 512

    /**
     * Native name: wbemFlagSendOnlySelected
     * @type {Integer (Int32)}
     */
    static SendOnlySelected => 0

    /**
     * Causes WMI to return class amendment data along with the base class definition. For more information about 
     *      amended qualifiers, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/localizing-wmi-class-information">Localizing WMI Class Information</a>.
     * Native name: wbemFlagUseAmendedQualifiers
     * @type {Integer (Int32)}
     */
    static UseAmendedQualifiers => 131072

    /**
     * Native name: wbemFlagGetDefault
     * @type {Integer (Int32)}
     */
    static GetDefault => 0

    /**
     * Native name: wbemFlagSpawnInstance
     * @type {Integer (Int32)}
     */
    static SpawnInstance => 1

    /**
     * Native name: wbemFlagUseCurrentTime
     * @type {Integer (Int32)}
     */
    static UseCurrentTime => 1
}
