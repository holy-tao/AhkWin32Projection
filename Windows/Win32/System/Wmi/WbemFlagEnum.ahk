#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that are used by SWbemServices.ExecQuery, SWbemServices.ExecQueryAsync, SWbemServices.SubclassesOf, and SWbemServices.InstancesOf.
 * @see https://docs.microsoft.com/windows/win32/api//wbemdisp/ne-wbemdisp-wbemflagenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemFlagEnum{

    /**
     * Causes the call to return immediately.
     * @type {Integer (Int32)}
     */
    static wbemFlagReturnImmediately => 16

    /**
     * Causes this call to block until the call has completed.
     * @type {Integer (Int32)}
     */
    static wbemFlagReturnWhenComplete => 0

    /**
     * Causes WMI to retain pointers to objects of the enumeration until the client releases the enumerator.
     * @type {Integer (Int32)}
     */
    static wbemFlagBidirectional => 0

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
     * @type {Integer (Int32)}
     */
    static wbemFlagForwardOnly => 32

    /**
     * This flag must not be set, and must be ignored on receipt.
     * @type {Integer (Int32)}
     */
    static wbemFlagNoErrorObject => 64

    /**
     * Causes asynchronous calls to return an error object in the event of an error.
     * @type {Integer (Int32)}
     */
    static wbemFlagReturnErrorObject => 0

    /**
     * Causes asynchronous calls to send status updates to the 
 *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemsink-onprogress">SWbemSink.OnProgress</a> event handler for your object 
 *      sink.
     * @type {Integer (Int32)}
     */
    static wbemFlagSendStatus => 128

    /**
     * Prevents asynchronous calls from sending status updates to the 
 *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemsink-onprogress">SWbemSink.OnProgress</a> event handler for your object 
 *      sink.
     * @type {Integer (Int32)}
     */
    static wbemFlagDontSendStatus => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemFlagEnsureLocatable => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemFlagDirectRead => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemFlagSendOnlySelected => 0

    /**
     * Causes WMI to return class amendment data along with the base class definition. For more information about 
 *      amended qualifiers, see 
 *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/localizing-wmi-class-information">Localizing WMI Class Information</a>.
     * @type {Integer (Int32)}
     */
    static wbemFlagUseAmendedQualifiers => 131072

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemFlagGetDefault => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemFlagSpawnInstance => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemFlagUseCurrentTime => 1
}
