#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies status values for a socket operation.
 * @remarks
 * An error encountered on socket operation is returned as **HRESULT** value. The [SocketError.GetStatus](socketerror_getstatus_1856274933.md) method is used to convert an error from a socket operation to a SocketErrorStatus enumeration value. Most of the SocketErrorStatus enumeration values correspond to an error returned by the native Windows sockets operation.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketerrorstatus
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketErrorStatus extends Win32Enum{

    /**
     * The socket status is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The operation was aborted.
     * @type {Integer (Int32)}
     */
    static OperationAborted => 1

    /**
     * A bad response was received from the HTTP server.
     * @type {Integer (Int32)}
     */
    static HttpInvalidServerResponse => 2

    /**
     * A connection timeout was exceeded.
     * @type {Integer (Int32)}
     */
    static ConnectionTimedOut => 3

    /**
     * The address family is not supported.
     * @type {Integer (Int32)}
     */
    static AddressFamilyNotSupported => 4

    /**
     * The socket type is not supported.
     * @type {Integer (Int32)}
     */
    static SocketTypeNotSupported => 5

    /**
     * The host was not found.
     * @type {Integer (Int32)}
     */
    static HostNotFound => 6

    /**
     * The requested name is valid and was found in the database, but it does not have the correct associated data being resolved for.
     * @type {Integer (Int32)}
     */
    static NoDataRecordOfRequestedType => 7

    /**
     * This is usually a temporary error during hostname resolution and means that the local server did not receive a response from an authoritative server.
     * @type {Integer (Int32)}
     */
    static NonAuthoritativeHostNotFound => 8

    /**
     * The specified class was not found.
     * @type {Integer (Int32)}
     */
    static ClassTypeNotFound => 9

    /**
     * The address is already in use.
     * @type {Integer (Int32)}
     */
    static AddressAlreadyInUse => 10

    /**
     * Cannot assign requested address.
     * @type {Integer (Int32)}
     */
    static CannotAssignRequestedAddress => 11

    /**
     * The connection was refused.
     * @type {Integer (Int32)}
     */
    static ConnectionRefused => 12

    /**
     * The network is unreachable.
     * @type {Integer (Int32)}
     */
    static NetworkIsUnreachable => 13

    /**
     * The host is unreachable.
     * @type {Integer (Int32)}
     */
    static UnreachableHost => 14

    /**
     * The network is down.
     * @type {Integer (Int32)}
     */
    static NetworkIsDown => 15

    /**
     * The network dropped connection on reset.
     * @type {Integer (Int32)}
     */
    static NetworkDroppedConnectionOnReset => 16

    /**
     * Software caused a connection abort.
     * @type {Integer (Int32)}
     */
    static SoftwareCausedConnectionAbort => 17

    /**
     * The connection was reset by the peer.
     * @type {Integer (Int32)}
     */
    static ConnectionResetByPeer => 18

    /**
     * The host is down.
     * @type {Integer (Int32)}
     */
    static HostIsDown => 19

    /**
     * The pipe is being closed.
     * @type {Integer (Int32)}
     */
    static NoAddressesFound => 20

    /**
     * Too many open files.
     * @type {Integer (Int32)}
     */
    static TooManyOpenFiles => 21

    /**
     * A message sent on a datagram socket was larger than the internal message buffer or some other network limit, or the buffer used to receive a datagram was smaller than the datagram itself.
     * @type {Integer (Int32)}
     */
    static MessageTooLong => 22

    /**
     * A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file. This error is also returned if the validity periods of the certification chain do not nest correctly.
     * @type {Integer (Int32)}
     */
    static CertificateExpired => 23

    /**
     * A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider. This error is also returned if a certificate chain could not be built to a trusted root authority.
     * @type {Integer (Int32)}
     */
    static CertificateUntrustedRoot => 24

    /**
     * The certificate is not valid for the requested usage. This error is also returned if the certificate has an invalid name. The name is not included in the permitted list or is explicitly excluded.
     * @type {Integer (Int32)}
     */
    static CertificateCommonNameIsIncorrect => 25

    /**
     * The certificate is not valid for the requested usage.
     * @type {Integer (Int32)}
     */
    static CertificateWrongUsage => 26

    /**
     * A certificate was explicitly revoked by its issuer. This error is also returned if the certificate was explicitly marked as untrusted by the user.
     * @type {Integer (Int32)}
     */
    static CertificateRevoked => 27

    /**
     * The revocation function was unable to check revocation for the certificate.
     * @type {Integer (Int32)}
     */
    static CertificateNoRevocationCheck => 28

    /**
     * The revocation function was unable to check revocation because the revocation server was offline.
     * @type {Integer (Int32)}
     */
    static CertificateRevocationServerOffline => 29

    /**
     * The supplied certificate is invalid. This can be returned for a number of reasons:
     * 
     * 
     * + A certificate that can only be used as an end-entity is being used as a CA or vice versa.
     * + A path length constraint in the certification chain has been violated.
     * + A certificate contains an unknown extension that is marked critical.
     * + A certificate is being used for a purpose other than the ones specified by its CA.
     * + A parent of a given certificate in fact did not issue that child certificate.
     * + A certificate is missing or has an empty value for an important field, such as a subject or issuer name.
     * + The signature of the certificate cannot be verified.
     * + The certificate has an invalid policy.
     * + A certificate's basic constraint extension has not been observed.
     * @type {Integer (Int32)}
     */
    static CertificateIsInvalid => 30
}
