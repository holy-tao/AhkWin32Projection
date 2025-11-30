#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/Rpc/rpc-status
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_ACCESS_DENIED => 5

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_ARG => 87

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_OUT_OF_MEMORY => 14

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_OUT_OF_THREADS => 164

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_LEVEL => 87

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_BUFFER_TOO_SMALL => 122

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_SECURITY_DESC => 1338

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_SERVER_OUT_OF_MEMORY => 1130

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_ASYNC_CALL_PENDING => 997

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNKNOWN_PRINCIPAL => 1332

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_TIMEOUT => 1460

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_RUNTIME_UNINITIALIZED => 1

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NOT_ENOUGH_QUOTA => 1816

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_STRING_BINDING => 1700

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_WRONG_KIND_OF_BINDING => 1701

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_BINDING => 1702

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_PROTSEQ_NOT_SUPPORTED => 1703

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_RPC_PROTSEQ => 1704

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_STRING_UUID => 1705

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_ENDPOINT_FORMAT => 1706

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_NET_ADDR => 1707

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_ENDPOINT_FOUND => 1708

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_TIMEOUT => 1709

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_OBJECT_NOT_FOUND => 1710

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_ALREADY_REGISTERED => 1711

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_TYPE_ALREADY_REGISTERED => 1712

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_ALREADY_LISTENING => 1713

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_PROTSEQS_REGISTERED => 1714

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NOT_LISTENING => 1715

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNKNOWN_MGR_TYPE => 1716

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNKNOWN_IF => 1717

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_BINDINGS => 1718

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_PROTSEQS => 1719

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_CANT_CREATE_ENDPOINT => 1720

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_OUT_OF_RESOURCES => 1721

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_SERVER_UNAVAILABLE => 1722

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_SERVER_TOO_BUSY => 1723

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_NETWORK_OPTIONS => 1724

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_CALL_ACTIVE => 1725

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_CALL_FAILED => 1726

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_CALL_FAILED_DNE => 1727

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_PROTOCOL_ERROR => 1728

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_PROXY_ACCESS_DENIED => 1729

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNSUPPORTED_TRANS_SYN => 1730

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNSUPPORTED_TYPE => 1732

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_TAG => 1733

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_BOUND => 1734

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_ENTRY_NAME => 1735

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_NAME_SYNTAX => 1736

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNSUPPORTED_NAME_SYNTAX => 1737

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UUID_NO_ADDRESS => 1739

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_DUPLICATE_ENDPOINT => 1740

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNKNOWN_AUTHN_TYPE => 1741

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_MAX_CALLS_TOO_SMALL => 1742

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_STRING_TOO_LONG => 1743

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_PROTSEQ_NOT_FOUND => 1744

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_PROCNUM_OUT_OF_RANGE => 1745

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_BINDING_HAS_NO_AUTH => 1746

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNKNOWN_AUTHN_SERVICE => 1747

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNKNOWN_AUTHN_LEVEL => 1748

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_AUTH_IDENTITY => 1749

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNKNOWN_AUTHZ_SERVICE => 1750

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
     * @type {Integer (Int32)}
     */
    static RPC_S_NOTHING_TO_EXPORT => 1754

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INCOMPLETE_NAME => 1755

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_VERS_OPTION => 1756

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_MORE_MEMBERS => 1757

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NOT_ALL_OBJS_UNEXPORTED => 1758

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INTERFACE_NOT_FOUND => 1759

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_ENTRY_ALREADY_EXISTS => 1760

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_ENTRY_NOT_FOUND => 1761

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NAME_SERVICE_UNAVAILABLE => 1762

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_NAF_ID => 1763

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_CANNOT_SUPPORT => 1764

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_CONTEXT_AVAILABLE => 1765

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INTERNAL_ERROR => 1766

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_ZERO_DIVIDE => 1767

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_ADDRESS_ERROR => 1768

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_FP_DIV_ZERO => 1769

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_FP_UNDERFLOW => 1770

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_FP_OVERFLOW => 1771

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_CALL_IN_PROGRESS => 1791

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_MORE_BINDINGS => 1806

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_INTERFACES => 1817

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_CALL_CANCELLED => 1818

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_BINDING_INCOMPLETE => 1819

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_COMM_FAILURE => 1820

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UNSUPPORTED_AUTHN_LEVEL => 1821

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NO_PRINC_NAME => 1822

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NOT_RPC_ERROR => 1823

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_UUID_LOCAL_ONLY => 1824

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_SEC_PKG_ERROR => 1825

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NOT_CANCELLED => 1826

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_COOKIE_AUTH_FAILED => 1833

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_DO_NOT_DISTURB => 1834

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_SYSTEM_HANDLE_COUNT_EXCEEDED => 1835

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_SYSTEM_HANDLE_TYPE_MISMATCH => 1836

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_GROUP_MEMBER_NOT_FOUND => 1898

    /**
     * @type {Integer (Int32)}
     */
    static EPT_S_CANT_CREATE => 1899

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_OBJECT => 1900

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_SEND_INCOMPLETE => 1913

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_ASYNC_HANDLE => 1914

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INVALID_ASYNC_CALL => 1915

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_ENTRY_TYPE_MISMATCH => 1922

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_NOT_ALL_OBJS_EXPORTED => 1923

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_INTERFACE_NOT_EXPORTED => 1924

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_PROFILE_NOT_ADDED => 1925

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_PRF_ELT_NOT_ADDED => 1926

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_PRF_ELT_NOT_REMOVED => 1927

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_GRP_ELT_NOT_ADDED => 1928

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_GRP_ELT_NOT_REMOVED => 1929
}
