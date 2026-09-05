#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The data type RPC\_STATUS represents a platform-specific status code type.
 * @remarks
 * The **RPC\_STATUS** type is returned by most RPC functions and is part of the [**RPC\_OBJECT\_INQ\_FN**](/windows/desktop/api/Rpcdce/nc-rpcdce-rpc_object_inq_fn) function type definition.
 * @see https://learn.microsoft.com/windows/win32/Rpc/rpc-status
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_STATUS extends Win32Enum {

    /**
     * Native name: RPC_S_OK
     * @type {Integer (Int32)}
     */
    static S_OK => 0

    /**
     * Native name: RPC_S_ACCESS_DENIED
     * @type {Integer (Int32)}
     */
    static S_ACCESS_DENIED => 5

    /**
     * Native name: RPC_S_INVALID_ARG
     * @type {Integer (Int32)}
     */
    static S_INVALID_ARG => 87

    /**
     * Native name: RPC_S_OUT_OF_MEMORY
     * @type {Integer (Int32)}
     */
    static S_OUT_OF_MEMORY => 14

    /**
     * Native name: RPC_S_OUT_OF_THREADS
     * @type {Integer (Int32)}
     */
    static S_OUT_OF_THREADS => 164

    /**
     * Native name: RPC_S_INVALID_LEVEL
     * @type {Integer (Int32)}
     */
    static S_INVALID_LEVEL => 87

    /**
     * Native name: RPC_S_BUFFER_TOO_SMALL
     * @type {Integer (Int32)}
     */
    static S_BUFFER_TOO_SMALL => 122

    /**
     * Native name: RPC_S_INVALID_SECURITY_DESC
     * @type {Integer (Int32)}
     */
    static S_INVALID_SECURITY_DESC => 1338

    /**
     * Native name: RPC_S_SERVER_OUT_OF_MEMORY
     * @type {Integer (Int32)}
     */
    static S_SERVER_OUT_OF_MEMORY => 1130

    /**
     * Native name: RPC_S_ASYNC_CALL_PENDING
     * @type {Integer (Int32)}
     */
    static S_ASYNC_CALL_PENDING => 997

    /**
     * Native name: RPC_S_UNKNOWN_PRINCIPAL
     * @type {Integer (Int32)}
     */
    static S_UNKNOWN_PRINCIPAL => 1332

    /**
     * Native name: RPC_S_TIMEOUT
     * @type {Integer (Int32)}
     */
    static S_TIMEOUT => 1460

    /**
     * Native name: RPC_S_RUNTIME_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static S_RUNTIME_UNINITIALIZED => 1

    /**
     * Native name: RPC_S_NOT_ENOUGH_QUOTA
     * @type {Integer (Int32)}
     */
    static S_NOT_ENOUGH_QUOTA => 1816

    /**
     * Native name: RPC_S_INVALID_STRING_BINDING
     * @type {Integer (Int32)}
     */
    static S_INVALID_STRING_BINDING => 1700

    /**
     * Native name: RPC_S_WRONG_KIND_OF_BINDING
     * @type {Integer (Int32)}
     */
    static S_WRONG_KIND_OF_BINDING => 1701

    /**
     * Native name: RPC_S_INVALID_BINDING
     * @type {Integer (Int32)}
     */
    static S_INVALID_BINDING => 1702

    /**
     * Native name: RPC_S_PROTSEQ_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static S_PROTSEQ_NOT_SUPPORTED => 1703

    /**
     * Native name: RPC_S_INVALID_RPC_PROTSEQ
     * @type {Integer (Int32)}
     */
    static S_INVALID_RPC_PROTSEQ => 1704

    /**
     * Native name: RPC_S_INVALID_STRING_UUID
     * @type {Integer (Int32)}
     */
    static S_INVALID_STRING_UUID => 1705

    /**
     * Native name: RPC_S_INVALID_ENDPOINT_FORMAT
     * @type {Integer (Int32)}
     */
    static S_INVALID_ENDPOINT_FORMAT => 1706

    /**
     * Native name: RPC_S_INVALID_NET_ADDR
     * @type {Integer (Int32)}
     */
    static S_INVALID_NET_ADDR => 1707

    /**
     * Native name: RPC_S_NO_ENDPOINT_FOUND
     * @type {Integer (Int32)}
     */
    static S_NO_ENDPOINT_FOUND => 1708

    /**
     * Native name: RPC_S_INVALID_TIMEOUT
     * @type {Integer (Int32)}
     */
    static S_INVALID_TIMEOUT => 1709

    /**
     * Native name: RPC_S_OBJECT_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static S_OBJECT_NOT_FOUND => 1710

    /**
     * Native name: RPC_S_ALREADY_REGISTERED
     * @type {Integer (Int32)}
     */
    static S_ALREADY_REGISTERED => 1711

    /**
     * Native name: RPC_S_TYPE_ALREADY_REGISTERED
     * @type {Integer (Int32)}
     */
    static S_TYPE_ALREADY_REGISTERED => 1712

    /**
     * Native name: RPC_S_ALREADY_LISTENING
     * @type {Integer (Int32)}
     */
    static S_ALREADY_LISTENING => 1713

    /**
     * Native name: RPC_S_NO_PROTSEQS_REGISTERED
     * @type {Integer (Int32)}
     */
    static S_NO_PROTSEQS_REGISTERED => 1714

    /**
     * Native name: RPC_S_NOT_LISTENING
     * @type {Integer (Int32)}
     */
    static S_NOT_LISTENING => 1715

    /**
     * Native name: RPC_S_UNKNOWN_MGR_TYPE
     * @type {Integer (Int32)}
     */
    static S_UNKNOWN_MGR_TYPE => 1716

    /**
     * Native name: RPC_S_UNKNOWN_IF
     * @type {Integer (Int32)}
     */
    static S_UNKNOWN_IF => 1717

    /**
     * Native name: RPC_S_NO_BINDINGS
     * @type {Integer (Int32)}
     */
    static S_NO_BINDINGS => 1718

    /**
     * Native name: RPC_S_NO_PROTSEQS
     * @type {Integer (Int32)}
     */
    static S_NO_PROTSEQS => 1719

    /**
     * Native name: RPC_S_CANT_CREATE_ENDPOINT
     * @type {Integer (Int32)}
     */
    static S_CANT_CREATE_ENDPOINT => 1720

    /**
     * Native name: RPC_S_OUT_OF_RESOURCES
     * @type {Integer (Int32)}
     */
    static S_OUT_OF_RESOURCES => 1721

    /**
     * Native name: RPC_S_SERVER_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static S_SERVER_UNAVAILABLE => 1722

    /**
     * Native name: RPC_S_SERVER_TOO_BUSY
     * @type {Integer (Int32)}
     */
    static S_SERVER_TOO_BUSY => 1723

    /**
     * Native name: RPC_S_INVALID_NETWORK_OPTIONS
     * @type {Integer (Int32)}
     */
    static S_INVALID_NETWORK_OPTIONS => 1724

    /**
     * Native name: RPC_S_NO_CALL_ACTIVE
     * @type {Integer (Int32)}
     */
    static S_NO_CALL_ACTIVE => 1725

    /**
     * Native name: RPC_S_CALL_FAILED
     * @type {Integer (Int32)}
     */
    static S_CALL_FAILED => 1726

    /**
     * Native name: RPC_S_CALL_FAILED_DNE
     * @type {Integer (Int32)}
     */
    static S_CALL_FAILED_DNE => 1727

    /**
     * Native name: RPC_S_PROTOCOL_ERROR
     * @type {Integer (Int32)}
     */
    static S_PROTOCOL_ERROR => 1728

    /**
     * Native name: RPC_S_PROXY_ACCESS_DENIED
     * @type {Integer (Int32)}
     */
    static S_PROXY_ACCESS_DENIED => 1729

    /**
     * Native name: RPC_S_UNSUPPORTED_TRANS_SYN
     * @type {Integer (Int32)}
     */
    static S_UNSUPPORTED_TRANS_SYN => 1730

    /**
     * Native name: RPC_S_UNSUPPORTED_TYPE
     * @type {Integer (Int32)}
     */
    static S_UNSUPPORTED_TYPE => 1732

    /**
     * Native name: RPC_S_INVALID_TAG
     * @type {Integer (Int32)}
     */
    static S_INVALID_TAG => 1733

    /**
     * Native name: RPC_S_INVALID_BOUND
     * @type {Integer (Int32)}
     */
    static S_INVALID_BOUND => 1734

    /**
     * Native name: RPC_S_NO_ENTRY_NAME
     * @type {Integer (Int32)}
     */
    static S_NO_ENTRY_NAME => 1735

    /**
     * Native name: RPC_S_INVALID_NAME_SYNTAX
     * @type {Integer (Int32)}
     */
    static S_INVALID_NAME_SYNTAX => 1736

    /**
     * Native name: RPC_S_UNSUPPORTED_NAME_SYNTAX
     * @type {Integer (Int32)}
     */
    static S_UNSUPPORTED_NAME_SYNTAX => 1737

    /**
     * Native name: RPC_S_UUID_NO_ADDRESS
     * @type {Integer (Int32)}
     */
    static S_UUID_NO_ADDRESS => 1739

    /**
     * Native name: RPC_S_DUPLICATE_ENDPOINT
     * @type {Integer (Int32)}
     */
    static S_DUPLICATE_ENDPOINT => 1740

    /**
     * Native name: RPC_S_UNKNOWN_AUTHN_TYPE
     * @type {Integer (Int32)}
     */
    static S_UNKNOWN_AUTHN_TYPE => 1741

    /**
     * Native name: RPC_S_MAX_CALLS_TOO_SMALL
     * @type {Integer (Int32)}
     */
    static S_MAX_CALLS_TOO_SMALL => 1742

    /**
     * Native name: RPC_S_STRING_TOO_LONG
     * @type {Integer (Int32)}
     */
    static S_STRING_TOO_LONG => 1743

    /**
     * Native name: RPC_S_PROTSEQ_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static S_PROTSEQ_NOT_FOUND => 1744

    /**
     * Native name: RPC_S_PROCNUM_OUT_OF_RANGE
     * @type {Integer (Int32)}
     */
    static S_PROCNUM_OUT_OF_RANGE => 1745

    /**
     * Native name: RPC_S_BINDING_HAS_NO_AUTH
     * @type {Integer (Int32)}
     */
    static S_BINDING_HAS_NO_AUTH => 1746

    /**
     * Native name: RPC_S_UNKNOWN_AUTHN_SERVICE
     * @type {Integer (Int32)}
     */
    static S_UNKNOWN_AUTHN_SERVICE => 1747

    /**
     * Native name: RPC_S_UNKNOWN_AUTHN_LEVEL
     * @type {Integer (Int32)}
     */
    static S_UNKNOWN_AUTHN_LEVEL => 1748

    /**
     * Native name: RPC_S_INVALID_AUTH_IDENTITY
     * @type {Integer (Int32)}
     */
    static S_INVALID_AUTH_IDENTITY => 1749

    /**
     * Native name: RPC_S_UNKNOWN_AUTHZ_SERVICE
     * @type {Integer (Int32)}
     */
    static S_UNKNOWN_AUTHZ_SERVICE => 1750

    /**
     * @type {Integer (Int32)}
     */
    static EPT_S_INVALID_ENTRY => 1751

    /**
     * @type {Integer (Int32)}
     */
    static EPT_S_CANT_PERFORM_OP => 1752

    /**
     * @type {Integer (Int32)}
     */
    static EPT_S_NOT_REGISTERED => 1753

    /**
     * Native name: RPC_S_NOTHING_TO_EXPORT
     * @type {Integer (Int32)}
     */
    static S_NOTHING_TO_EXPORT => 1754

    /**
     * Native name: RPC_S_INCOMPLETE_NAME
     * @type {Integer (Int32)}
     */
    static S_INCOMPLETE_NAME => 1755

    /**
     * Native name: RPC_S_INVALID_VERS_OPTION
     * @type {Integer (Int32)}
     */
    static S_INVALID_VERS_OPTION => 1756

    /**
     * Native name: RPC_S_NO_MORE_MEMBERS
     * @type {Integer (Int32)}
     */
    static S_NO_MORE_MEMBERS => 1757

    /**
     * Native name: RPC_S_NOT_ALL_OBJS_UNEXPORTED
     * @type {Integer (Int32)}
     */
    static S_NOT_ALL_OBJS_UNEXPORTED => 1758

    /**
     * Native name: RPC_S_INTERFACE_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static S_INTERFACE_NOT_FOUND => 1759

    /**
     * Native name: RPC_S_ENTRY_ALREADY_EXISTS
     * @type {Integer (Int32)}
     */
    static S_ENTRY_ALREADY_EXISTS => 1760

    /**
     * Native name: RPC_S_ENTRY_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static S_ENTRY_NOT_FOUND => 1761

    /**
     * Native name: RPC_S_NAME_SERVICE_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static S_NAME_SERVICE_UNAVAILABLE => 1762

    /**
     * Native name: RPC_S_INVALID_NAF_ID
     * @type {Integer (Int32)}
     */
    static S_INVALID_NAF_ID => 1763

    /**
     * Native name: RPC_S_CANNOT_SUPPORT
     * @type {Integer (Int32)}
     */
    static S_CANNOT_SUPPORT => 1764

    /**
     * Native name: RPC_S_NO_CONTEXT_AVAILABLE
     * @type {Integer (Int32)}
     */
    static S_NO_CONTEXT_AVAILABLE => 1765

    /**
     * Native name: RPC_S_INTERNAL_ERROR
     * @type {Integer (Int32)}
     */
    static S_INTERNAL_ERROR => 1766

    /**
     * Native name: RPC_S_ZERO_DIVIDE
     * @type {Integer (Int32)}
     */
    static S_ZERO_DIVIDE => 1767

    /**
     * Native name: RPC_S_ADDRESS_ERROR
     * @type {Integer (Int32)}
     */
    static S_ADDRESS_ERROR => 1768

    /**
     * Native name: RPC_S_FP_DIV_ZERO
     * @type {Integer (Int32)}
     */
    static S_FP_DIV_ZERO => 1769

    /**
     * Native name: RPC_S_FP_UNDERFLOW
     * @type {Integer (Int32)}
     */
    static S_FP_UNDERFLOW => 1770

    /**
     * Native name: RPC_S_FP_OVERFLOW
     * @type {Integer (Int32)}
     */
    static S_FP_OVERFLOW => 1771

    /**
     * Native name: RPC_S_CALL_IN_PROGRESS
     * @type {Integer (Int32)}
     */
    static S_CALL_IN_PROGRESS => 1791

    /**
     * Native name: RPC_S_NO_MORE_BINDINGS
     * @type {Integer (Int32)}
     */
    static S_NO_MORE_BINDINGS => 1806

    /**
     * Native name: RPC_S_NO_INTERFACES
     * @type {Integer (Int32)}
     */
    static S_NO_INTERFACES => 1817

    /**
     * Native name: RPC_S_CALL_CANCELLED
     * @type {Integer (Int32)}
     */
    static S_CALL_CANCELLED => 1818

    /**
     * Native name: RPC_S_BINDING_INCOMPLETE
     * @type {Integer (Int32)}
     */
    static S_BINDING_INCOMPLETE => 1819

    /**
     * Native name: RPC_S_COMM_FAILURE
     * @type {Integer (Int32)}
     */
    static S_COMM_FAILURE => 1820

    /**
     * Native name: RPC_S_UNSUPPORTED_AUTHN_LEVEL
     * @type {Integer (Int32)}
     */
    static S_UNSUPPORTED_AUTHN_LEVEL => 1821

    /**
     * Native name: RPC_S_NO_PRINC_NAME
     * @type {Integer (Int32)}
     */
    static S_NO_PRINC_NAME => 1822

    /**
     * Native name: RPC_S_NOT_RPC_ERROR
     * @type {Integer (Int32)}
     */
    static S_NOT_RPC_ERROR => 1823

    /**
     * Native name: RPC_S_UUID_LOCAL_ONLY
     * @type {Integer (Int32)}
     */
    static S_UUID_LOCAL_ONLY => 1824

    /**
     * Native name: RPC_S_SEC_PKG_ERROR
     * @type {Integer (Int32)}
     */
    static S_SEC_PKG_ERROR => 1825

    /**
     * Native name: RPC_S_NOT_CANCELLED
     * @type {Integer (Int32)}
     */
    static S_NOT_CANCELLED => 1826

    /**
     * Native name: RPC_S_COOKIE_AUTH_FAILED
     * @type {Integer (Int32)}
     */
    static S_COOKIE_AUTH_FAILED => 1833

    /**
     * Native name: RPC_S_DO_NOT_DISTURB
     * @type {Integer (Int32)}
     */
    static S_DO_NOT_DISTURB => 1834

    /**
     * Native name: RPC_S_SYSTEM_HANDLE_COUNT_EXCEEDED
     * @type {Integer (Int32)}
     */
    static S_SYSTEM_HANDLE_COUNT_EXCEEDED => 1835

    /**
     * Native name: RPC_S_SYSTEM_HANDLE_TYPE_MISMATCH
     * @type {Integer (Int32)}
     */
    static S_SYSTEM_HANDLE_TYPE_MISMATCH => 1836

    /**
     * Native name: RPC_S_GROUP_MEMBER_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static S_GROUP_MEMBER_NOT_FOUND => 1898

    /**
     * @type {Integer (Int32)}
     */
    static EPT_S_CANT_CREATE => 1899

    /**
     * Native name: RPC_S_INVALID_OBJECT
     * @type {Integer (Int32)}
     */
    static S_INVALID_OBJECT => 1900

    /**
     * Native name: RPC_S_SEND_INCOMPLETE
     * @type {Integer (Int32)}
     */
    static S_SEND_INCOMPLETE => 1913

    /**
     * Native name: RPC_S_INVALID_ASYNC_HANDLE
     * @type {Integer (Int32)}
     */
    static S_INVALID_ASYNC_HANDLE => 1914

    /**
     * Native name: RPC_S_INVALID_ASYNC_CALL
     * @type {Integer (Int32)}
     */
    static S_INVALID_ASYNC_CALL => 1915

    /**
     * Native name: RPC_S_ENTRY_TYPE_MISMATCH
     * @type {Integer (Int32)}
     */
    static S_ENTRY_TYPE_MISMATCH => 1922

    /**
     * Native name: RPC_S_NOT_ALL_OBJS_EXPORTED
     * @type {Integer (Int32)}
     */
    static S_NOT_ALL_OBJS_EXPORTED => 1923

    /**
     * Native name: RPC_S_INTERFACE_NOT_EXPORTED
     * @type {Integer (Int32)}
     */
    static S_INTERFACE_NOT_EXPORTED => 1924

    /**
     * Native name: RPC_S_PROFILE_NOT_ADDED
     * @type {Integer (Int32)}
     */
    static S_PROFILE_NOT_ADDED => 1925

    /**
     * Native name: RPC_S_PRF_ELT_NOT_ADDED
     * @type {Integer (Int32)}
     */
    static S_PRF_ELT_NOT_ADDED => 1926

    /**
     * Native name: RPC_S_PRF_ELT_NOT_REMOVED
     * @type {Integer (Int32)}
     */
    static S_PRF_ELT_NOT_REMOVED => 1927

    /**
     * Native name: RPC_S_GRP_ELT_NOT_ADDED
     * @type {Integer (Int32)}
     */
    static S_GRP_ELT_NOT_ADDED => 1928

    /**
     * Native name: RPC_S_GRP_ELT_NOT_REMOVED
     * @type {Integer (Int32)}
     */
    static S_GRP_ELT_NOT_REMOVED => 1929
}
