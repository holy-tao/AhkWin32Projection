#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamSocketInformation.ahk
#Include .\IStreamSocketInformation2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket information on a [StreamSocket](streamsocket.md) object.
 * @remarks
 * The [StreamSocketInformation](datagramsocketinformation.md) class provides information about a [StreamSocket](streamsocket.md). This class retrieves information on a [StreamSocket](streamsocket.md) and can be called any time after the [StreamSocket](streamsocket.md) has been created.
 * 
 * A [StreamSocketInformation](datagramsocketinformation.md) object is automatically created with the parent [StreamSocket](streamsocket.md) object. The [StreamSocket.Information](streamsocket_information.md) property provides access to the associated [StreamSocketInformation](datagramsocketinformation.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class StreamSocketInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamSocketInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamSocketInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the local IP address associated with a [StreamSocket](streamsocket.md) object.
     * @remarks
     * The LocalAddress property represents the local IP address the [StreamSocket](streamsocket.md) object is bound to after a connection is established.
     * 
     * An app can set the local hostname or IP address to use by calling the [ConnectAsync(EndpointPair)](streamsocket_connectasync_13692504.md) or [ConnectAsync(EndpointPair, SocketProtectionLevel)](streamsocket_connectasync_706428084.md) method on the [StreamSocket](streamsocket.md). The connect operation will bind the socket to the specific local IP address and local UDP port number. After the bind or connect operation completes, the LocalAddress property contains the IP address and the [LocalPort](streamsocketinformation_localport.md) property contains the local TCP port number that the local hostname and service name resolved to.
     * 
     * If the local hostname or IP address passed to the [ConnectAsync(EndpointPair)](streamsocket_connectasync_13692504.md) or [ConnectAsync(EndpointPair, SocketProtectionLevel)](streamsocket_connectasync_706428084.md) method is null or the [ConnectAsync(HostName, String)](streamsocket_connectasync_1841953676.md) or [ConnectAsync(HostName, String, SocketProtectionLevel)](streamsocket_connectasync_945708620.md) method is called, the system will determine the local IP address to bind to the [StreamSocket](streamsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.localaddress
     * @type {HostName} 
     */
    LocalAddress {
        get => this.get_LocalAddress()
    }

    /**
     * Get the TCP port number associated with a [StreamSocket](streamsocket.md).
     * @remarks
     * The LocalPort property represents the local TCP port number the [StreamSocket](streamsocket.md) object is bound to after a connection is established.
     * 
     * An app can set the local service name or TCP port number to use by calling the [ConnectAsync(EndpointPair)](streamsocket_connectasync_13692504.md) or [ConnectAsync(EndpointPair, SocketProtectionLevel)](streamsocket_connectasync_706428084.md) method on the [StreamSocket](streamsocket.md). The connect operation will bind the socket to the specific local IP address and local UDP port number. After the bind or connect operation completes, the LocalPort property contains the IP address and the LocalPort property contains the local TCP port number that the local hostname and service name resolved to.
     * 
     * If the local service name or TCP port number passed to the [ConnectAsync(EndpointPair)](streamsocket_connectasync_13692504.md) or [ConnectAsync(EndpointPair, SocketProtectionLevel)](streamsocket_connectasync_706428084.md) method is an empty string or the [ConnectAsync(HostName, String)](streamsocket_connectasync_1841953676.md) or [ConnectAsync(HostName, String, SocketProtectionLevel)](streamsocket_connectasync_945708620.md) method is called, the system will determine the local TCP port number to bind to the [StreamSocket](streamsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.localport
     * @type {HSTRING} 
     */
    LocalPort {
        get => this.get_LocalPort()
    }

    /**
     * Get the hostname or IP address of the remote network destination associated with a [StreamSocket](streamsocket.md) object.
     * @remarks
     * The RemoteHostName property represents the remote hostname or IP address for the remote network destination associated with a [StreamSocket](streamsocket.md) object. The remote hostname or IP address that a [StreamSocket](streamsocket.md) object connects to is passed in the *remoteHostName* parameter to the [ConnectAsync](streamsocket_connectasync_13692504.md) method on the [StreamSocket](streamsocket.md).
     * 
     * The RemoteHostName property can be one of the following:
     * 
     * 
     * + The name of the local host that can be resolved by the Domain Name System (DNS) or by another namespace provider.
     * + The name of the local host that matches a string in the following file on the local computer: %WINDIR%\\system32\drivers\etc\hosts.
     * + A string that contains an IPv4 or an IPv6 network address of the local host. An IPv4 address string is in dotted-decimal notation ("192.168.1.111", for example). An IPv6 address is in hexadecimal notation ("21DA:00D3:0010:2F3B:02AA:00FF:FE28:9C5A", for example).
     * When this property is the "localhost" string, this represents all loopback addresses on the local computer.
     * 
     * The [RemoteServiceName](streamsocketinformation_remoteservicename.md) property represents the remote service name or TCP port number for the remote network destination associated with a [StreamSocket](streamsocket.md) object.
     * 
     * After a connection is established, the [RemoteAddress](streamsocketinformation_remoteaddress.md) property contains the IP address and the [RemotePort](streamsocketinformation_remoteport.md) property contains the TCP port number of the remote endpoint for the socket connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.remotehostname
     * @type {HostName} 
     */
    RemoteHostName {
        get => this.get_RemoteHostName()
    }

    /**
     * Get the IP address or hostname of the remote network destination associated with a [StreamSocket](streamsocket.md) object.
     * @remarks
     * The [RemoteHostName](streamsocketinformation_remotehostname.md) property represents the remote hostname or IP address for the remote network destination associated with a [StreamSocket](streamsocket.md) object. The [RemoteServiceName](streamsocketinformation_remoteservicename.md) property represents the remote service name or TCP port number for the remote network destination associated with a [StreamSocket](streamsocket.md) object. The [RemoteHostName](streamsocketinformation_remotehostname.md) and [RemoteServiceName](streamsocketinformation_remoteservicename.md) properties are passed to the [ConnectAsync](streamsocket_connectasync_13692504.md) method on the [StreamSocket](streamsocket.md) to establish a connection.
     * 
     * After a connection is established, the RemoteAddress property contains the IP address and the [RemotePort](streamsocketinformation_remoteport.md) property contains the TCP port number of the remote endpoint for the socket connection. Before a connection is established, the RemoteAddress property is null and the [RemotePort](streamsocketinformation_remoteport.md) property contains an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.remoteaddress
     * @type {HostName} 
     */
    RemoteAddress {
        get => this.get_RemoteAddress()
    }

    /**
     * Get the service name or TCP port number of the remote network destination associated with a [StreamSocket](streamsocket.md) object.
     * @remarks
     * The RemoteServiceName property represents the remote service name or TCP port number for the remote network destination associated with a [StreamSocket](streamsocket.md) object. The remote service name or TCP port that a [StreamSocket](streamsocket.md) object connects to is passed in the *remoteServiceName* parameter to the [ConnectAsync](streamsocket_connectasync_13692504.md) method on the [StreamSocket](streamsocket.md).
     * 
     * The RemoteServiceName property can be one of the following:
     * 
     * 
     * + A numeric literal for a TCP port number (80 for the TCP port typically used for the HTTP protocol, for example).
     * + A string alias for a port number ("http", for example) that matches a string in the following file on the local computer: %WINDIR%\system32\drivers\etc\services
     * + A service name that can be resolved by a namespace provider using a SRV record.
     * The [RemoteHostName](streamsocketinformation_remotehostname.md) property represents the remote service name or TCP port number for the remote network destination associated with a [StreamSocket](streamsocket.md) object.
     * 
     * After a connection is established, the [RemoteAddress](streamsocketinformation_remoteaddress.md) property contains the IP address and the [RemotePort](streamsocketinformation_remoteport.md) property contains the TCP port number of the remote endpoint for the socket connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.remoteservicename
     * @type {HSTRING} 
     */
    RemoteServiceName {
        get => this.get_RemoteServiceName()
    }

    /**
     * Get the TCP port number or service name of the remote network destination associated with a [StreamSocket](streamsocket.md) object.
     * @remarks
     * The [RemoteHostName](streamsocketinformation_remotehostname.md) property represents the remote hostname or IP address for the remote network destination associated with a [StreamSocket](streamsocket.md) object. The [RemoteServiceName](streamsocketinformation_remoteservicename.md) property represents the remote service name or TCP port number for the remote network destination associated with a [StreamSocket](streamsocket.md) object. The [RemoteHostName](streamsocketinformation_remotehostname.md) and [RemoteServiceName](streamsocketinformation_remoteservicename.md) properties are passed to the [ConnectAsync](streamsocket_connectasync_13692504.md) method on the [StreamSocket](streamsocket.md) to establish a connection.
     * 
     * After a connection is established, the [RemoteAddress](streamsocketinformation_remoteaddress.md) property contains the IP address and the RemotePort property contains the TCP port number of the remote endpoint for the socket connection. Before a connection is established, the [RemoteAddress](streamsocketinformation_remoteaddress.md) property is null and the RemotePort property contains an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.remoteport
     * @type {HSTRING} 
     */
    RemotePort {
        get => this.get_RemotePort()
    }

    /**
     * Gets round trip time information for a [StreamSocket](streamsocket.md) object.
     * 
     * Note that the returned statistics are based on extended TCP statistics, which are enabled by default on Client versions of Windows, but disabled by default for performance reasons on Server versions of Windows. If extended TCP statistics are not available, all returned numerical statistics are set to 0, and boolean statistics are set to false.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.roundtriptimestatistics
     * @type {RoundTripTimeStatistics} 
     */
    RoundTripTimeStatistics {
        get => this.get_RoundTripTimeStatistics()
    }

    /**
     * Gets bandwidth information for network data transfer on a [StreamSocket](streamsocket.md) object.
     * 
     * Note that the returned statistics are based on extended TCP statistics, which are enabled by default on Client versions of Windows, but disabled by default for performance reasons on Server versions of Windows. If extended TCP statistics are not available, all returned numerical statistics are set to 0, and boolean statistics are set to false.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.bandwidthstatistics
     * @type {BandwidthStatistics} 
     */
    BandwidthStatistics {
        get => this.get_BandwidthStatistics()
    }

    /**
     * Gets the protection level that represents the integrity and encryption set on a [StreamSocket](streamsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.protectionlevel
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
    }

    /**
     * Get a byte array that represents the private shared secret exchanged by proximity devices.
     * @remarks
     * The SessionKey property is only used with a [StreamSocket](streamsocket.md) object created by proximity devices when initiated by tapping. The SessionKey property for a tapping device may contain an array with a private shared secret. A private shared secret is not required by a tapping device, so this property can be null.
     * 
     * For proximity devices initiated by tapping, the SessionKey property can be passed to Crypto runtime classes to handle encryption. For more information, see [Supporting proximity and tapping](/previous-versions/windows/apps/hh465229(v=win.10)), the [Windows.Security.Cryptography.Core.SymmetricKeyAlgorithmProvider](../windows.security.cryptography.core/symmetrickeyalgorithmprovider.md) class, and related classes.
     * 
     * For other [StreamSocket](streamsocket.md) objects not initiated by tapping, the SessionKey property is always null.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.sessionkey
     * @type {IBuffer} 
     */
    SessionKey {
        get => this.get_SessionKey()
    }

    /**
     * Gets the category of an error that occurred making an SSL connection with a [StreamSocket](streamsocket.md).
     * @remarks
     * SSL server errors should only be ignored in advanced scenarios. Disregarding server certificate errors when the ServerCertificateErrorSeverity property is either **Ignorable** or **Fatal** may result in the loss of privacy or integrity of the content passed over the SSL session.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.servercertificateerrorseverity
     * @type {Integer} 
     */
    ServerCertificateErrorSeverity {
        get => this.get_ServerCertificateErrorSeverity()
    }

    /**
     * Gets the list of errors that occurred making an SSL connection with a [StreamSocket](streamsocket.md).
     * @remarks
     * The ServerCertificateErrors property gets a vector of [ChainValidationResult](../windows.security.cryptography.certificates/chainvalidationresult.md) enumeration values of errors that occurred making an SSL connection with a [StreamSocket](streamsocket.md).
     * 
     * SSL server certificate errors should only be ignored in advanced scenarios. Disregarding server certificate errors may result in the loss of privacy or integrity of the content passed over the SSL session.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.servercertificateerrors
     * @type {IVectorView<Integer>} 
     */
    ServerCertificateErrors {
        get => this.get_ServerCertificateErrors()
    }

    /**
     * Gets the certificate from the server when making an SSL connection with a [StreamSocket](streamsocket.md).
     * @remarks
     * This property gets the server certificate used for an SSL connection when connecting with a [StreamSocket](streamsocket.md). This certificate is provided by the server during the SSL connection negotiation. The properties on the [Certificate](../windows.security.cryptography.certificates/certificate.md) object returned can be used to get detailed information on the certificate.
     * 
     * This property is useful for notifying the user why an SSL connection failed.
     * 
     * This property can also be used to enforce stronger security than the default connection using the [Certificate](../windows.security.cryptography.certificates/certificate.md) object returned. The [BuildChainAsync](../windows.security.cryptography.certificates/certificate_buildchainasync_1634621379.md) methods and other properties on the [Certificate](../windows.security.cryptography.certificates/certificate.md) object and methods on the [CertificateChain](../windows.security.cryptography.certificates/certificatechain.md) object can be used when an app needs stronger security than the standard SSL negotiation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.servercertificate
     * @type {Certificate} 
     */
    ServerCertificate {
        get => this.get_ServerCertificate()
    }

    /**
     * Gets the intermediate certificates sent by the server during SSL negotiation when making an SSL connection with a [StreamSocket](streamsocket.md).
     * @remarks
     * This property returns the intermediate server certificates used when making an SSL connection with a [StreamSocket](streamsocket.md). These certificates are provided by the server during the SSL connection negotiation. The properties on the [Certificate](../windows.security.cryptography.certificates/certificate.md) objects in the returned vector can be used to get detailed information on the certificates.
     * 
     * This property can also be used to enforce stronger security than the default connection using the [Certificate](../windows.security.cryptography.certificates/certificate.md) objects returned. The [BuildChainAsync](../windows.security.cryptography.certificates/certificate_buildchainasync_1634621379.md) methods and other properties on the [Certificate](../windows.security.cryptography.certificates/certificate.md) objects and methods on the [CertificateChain](../windows.security.cryptography.certificates/certificatechain.md) object can be used when an app needs stronger security than the standard SSL negotiation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketinformation.serverintermediatecertificates
     * @type {IVectorView<Certificate>} 
     */
    ServerIntermediateCertificates {
        get => this.get_ServerIntermediateCertificates()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalAddress() {
        if (!this.HasProp("__IStreamSocketInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation := IStreamSocketInformation(outPtr)
        }

        return this.__IStreamSocketInformation.get_LocalAddress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalPort() {
        if (!this.HasProp("__IStreamSocketInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation := IStreamSocketInformation(outPtr)
        }

        return this.__IStreamSocketInformation.get_LocalPort()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteHostName() {
        if (!this.HasProp("__IStreamSocketInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation := IStreamSocketInformation(outPtr)
        }

        return this.__IStreamSocketInformation.get_RemoteHostName()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteAddress() {
        if (!this.HasProp("__IStreamSocketInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation := IStreamSocketInformation(outPtr)
        }

        return this.__IStreamSocketInformation.get_RemoteAddress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteServiceName() {
        if (!this.HasProp("__IStreamSocketInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation := IStreamSocketInformation(outPtr)
        }

        return this.__IStreamSocketInformation.get_RemoteServiceName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemotePort() {
        if (!this.HasProp("__IStreamSocketInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation := IStreamSocketInformation(outPtr)
        }

        return this.__IStreamSocketInformation.get_RemotePort()
    }

    /**
     * 
     * @returns {RoundTripTimeStatistics} 
     */
    get_RoundTripTimeStatistics() {
        if (!this.HasProp("__IStreamSocketInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation := IStreamSocketInformation(outPtr)
        }

        return this.__IStreamSocketInformation.get_RoundTripTimeStatistics()
    }

    /**
     * 
     * @returns {BandwidthStatistics} 
     */
    get_BandwidthStatistics() {
        if (!this.HasProp("__IStreamSocketInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation := IStreamSocketInformation(outPtr)
        }

        return this.__IStreamSocketInformation.get_BandwidthStatistics()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        if (!this.HasProp("__IStreamSocketInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation := IStreamSocketInformation(outPtr)
        }

        return this.__IStreamSocketInformation.get_ProtectionLevel()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SessionKey() {
        if (!this.HasProp("__IStreamSocketInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation := IStreamSocketInformation(outPtr)
        }

        return this.__IStreamSocketInformation.get_SessionKey()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerCertificateErrorSeverity() {
        if (!this.HasProp("__IStreamSocketInformation2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation2 := IStreamSocketInformation2(outPtr)
        }

        return this.__IStreamSocketInformation2.get_ServerCertificateErrorSeverity()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ServerCertificateErrors() {
        if (!this.HasProp("__IStreamSocketInformation2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation2 := IStreamSocketInformation2(outPtr)
        }

        return this.__IStreamSocketInformation2.get_ServerCertificateErrors()
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ServerCertificate() {
        if (!this.HasProp("__IStreamSocketInformation2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation2 := IStreamSocketInformation2(outPtr)
        }

        return this.__IStreamSocketInformation2.get_ServerCertificate()
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_ServerIntermediateCertificates() {
        if (!this.HasProp("__IStreamSocketInformation2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketInformation2 := IStreamSocketInformation2(outPtr)
        }

        return this.__IStreamSocketInformation2.get_ServerIntermediateCertificates()
    }

;@endregion Instance Methods
}
