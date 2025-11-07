#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used to notify an application that a change has occurred in the TAPI object.
 * @remarks
 * 
 * Call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-put_eventfilter">ITTAPI::put_EventFilter</a> method and set the event filter mask to enable receiving events. If <b>ITTAPI::put_EventFilter</b> is not called, the application cannot receive events.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-tapi_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TAPI_EVENT{

    /**
     * Change is in TAPI object itself. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ittapiobjectevent">ITTAPIObjectEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_TAPIOBJECT => 1

    /**
     * An Address object has changed. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddressevent">ITAddressEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_ADDRESS => 2

    /**
     * A new communications session has appeared on the address and the TAPI DLL has created a new call object. This could be a result from an incoming session, a session handed off by another application, or a session being parked on the address. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallnotificationevent">ITCallNotificationEvent</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @type {Integer (Int32)}
     */
    static TE_CALLNOTIFICATION => 4

    /**
     * The Call state has changed. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallstateevent">ITCallStateEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_CALLSTATE => 8

    /**
     * The media associated with a call has changed. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallmediaevent">ITCallMediaEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_CALLMEDIA => 16

    /**
     * A CallHub object has changed. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallhubevent">ITCallHubEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_CALLHUB => 32

    /**
     * The call information has changed. 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfochangeevent">ITCallInfoChangeEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_CALLINFOCHANGE => 64

    /**
     * A provider-specific private object has changed. The precise type of object referenced is implementation dependent. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Tapi/provider-specific-interfaces">Provider-Specific Interfaces</a>.
     * @type {Integer (Int32)}
     */
    static TE_PRIVATE => 128

    /**
     * A Request object has changed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itrequestevent">ITRequestEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_REQUEST => 256

    /**
     * An Agent object has changed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentevent">ITAgentEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_AGENT => 512

    /**
     * An AgentSession object has changed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagentsessionevent">ITAgentSessionEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_AGENTSESSION => 1024

    /**
     * A QOS event has occurred. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itqosevent">ITQOSEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_QOSEVENT => 2048

    /**
     * An AgentHandler object has changed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itagenthandlerevent">ITAgentHandlerEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_AGENTHANDLER => 4096

    /**
     * An ACDGroup object has changed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroupevent">ITACDGroupEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_ACDGROUP => 8192

    /**
     * A Queue object has changed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3cc/nn-tapi3cc-itqueueevent">ITQueueEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_QUEUE => 16384

    /**
     * A digit event has occurred. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itdigitdetectionevent">ITDigitDetectionEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_DIGITEVENT => 32768

    /**
     * A digit generation event has occurred. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itdigitgenerationevent">ITDigitGenerationEvent</a>.
     * @type {Integer (Int32)}
     */
    static TE_GENERATEEVENT => 65536

    /**
     * An Automatic Speech Recognition terminal event has occurred. Valid only for computers running on Windows XP and later.
     * @type {Integer (Int32)}
     */
    static TE_ASRTERMINAL => 131072

    /**
     * An event has occurred on a TTS terminal. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itttsterminalevent">ITTTSTerminalEvent</a>. Valid only for computers running on Windows XP and later.
     * @type {Integer (Int32)}
     */
    static TE_TTSTERMINAL => 262144

    /**
     * An event has occurred on a file terminal. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itfileterminalevent">ITFileTerminalEvent</a>. Valid only for computers running on Windows XP and later.
     * @type {Integer (Int32)}
     */
    static TE_FILETERMINAL => 524288

    /**
     * An event has occurred on a tone terminal. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ittoneterminalevent">ITToneTerminalEvent</a>. Valid only for computers running on Windows XP and later.
     * @type {Integer (Int32)}
     */
    static TE_TONETERMINAL => 1048576

    /**
     * A Phone object has changed. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphoneevent">ITPhoneEvent</a>. Valid only for computers running on Windows XP and later.
     * @type {Integer (Int32)}
     */
    static TE_PHONEEVENT => 2097152

    /**
     * A tone event has been fired. Detection of in-band tones will be enabled or disabled. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ittonedetectionevent">ITToneDetectionEvent</a>. Valid only for computers running on Windows XP and later.
     * @type {Integer (Int32)}
     */
    static TE_TONEEVENT => 4194304

    /**
     * A gather digits event has been fired. Digits will be gathered on the current call. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itdigitsgatheredevent">ITDigitsGatheredEvent</a>. Valid only for computers running on Windows XP and later.
     * @type {Integer (Int32)}
     */
    static TE_GATHERDIGITS => 8388608

    /**
     * An address device-specific event has occurred. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddressdevicespecificevent">ITAddressDeviceSpecificEvent</a>. Valid only for computers running on Windows XP and later.
     * @type {Integer (Int32)}
     */
    static TE_ADDRESSDEVSPECIFIC => 16777216

    /**
     * A phone device-specific event has occurred. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddressdevicespecificevent">ITPhoneDeviceSpecificEvent</a>. Valid only for computers running on Windows XP and later.
     * @type {Integer (Int32)}
     */
    static TE_PHONEDEVSPECIFIC => 33554432
}
