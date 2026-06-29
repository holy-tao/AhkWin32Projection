#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents application sequence information relating to WS-Discovery messages.
 * @remarks
 * The application sequencing header block allows a receiver to maintain the sequence messages that contain this header block though they may have been received out of order. This allows proper sequencing of <a href="https://docs.microsoft.com/windows/desktop/WsdApi/hello-message">Hello</a> and <a href="https://docs.microsoft.com/windows/desktop/WsdApi/bye-message">Bye</a> messages from a target service.
 * 
 * The normative outline for the application sequence header block is:
 * 
 * 
 * 
 * 
 * ``` syntax
 * &lt;s:Envelope ...&gt; 
 *   &lt;s:Header ...&gt; 
 *     &lt;d:AppSequence InstanceId='xs:nonNegativeInteger' [SequenceId='xs:anyURI']? MessageNumber='xs:nonNegativeInteger' ... /&gt;
 *   &lt;/s:Header&gt; 
 *   &lt;s:Body ...&gt; ... 
 *   &lt;/s:Body&gt; 
 * &lt;/s:Envelope&gt;
 * ```
 * 
 * The following describes normative constraints of this outline. 
 * 
 * 
 * 
 * <c>/s:Envelope/s:Header/d:AppSequence/@InstanceId</c>
 * 
 * This setting must be incremented by a value of at least 1 each time the service has terminated, lost state, and been restored. An application can set this value by using a counter that is incremented each time a service is restarted. The restart time of the service is expressed as seconds elapsed since 12:00 a.m. January 1, 1970.
 * 
 * <c>/s:Envelope/s:Header/d:AppSequence/@SequenceId</c>
 * 
 *  
 * 
 * This setting identifies a sequence within the context of an instance identifier. If it is omitted, the implied value is the null sequence. The value in this setting must be unique within ./@InstanceId.
 * 
 * <c>/s:Envelope/s:Header/d:AppSequence/@MessageNumber</c>
 * 
 * This setting identifies a message within the context of a sequence identifier and an instance identifier. must be incremented by a value of at least 1 for each message sent. Retransmission of this message at the transport level must maintain this value.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_app_sequence
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_APP_SEQUENCE {
    #StructPack 8

    /**
     * The instance identifier.
     */
    InstanceId : Int64

    /**
     * The sequence identifier.
     */
    SequenceId : PWSTR

    /**
     * The message number.
     */
    MessageNumber : Int64

}
