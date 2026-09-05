#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class WSA_ERROR extends Win32Enum {

    /**
     * Native name: WSA_IO_PENDING
     * @type {Integer (Int32)}
     */
    static IO_PENDING => 997

    /**
     * Native name: WSA_IO_INCOMPLETE
     * @type {Integer (Int32)}
     */
    static IO_INCOMPLETE => 996

    /**
     * Native name: WSA_INVALID_HANDLE
     * @type {Integer (Int32)}
     */
    static INVALID_HANDLE => 6

    /**
     * Native name: WSA_INVALID_PARAMETER
     * @type {Integer (Int32)}
     */
    static INVALID_PARAMETER => 87

    /**
     * Native name: WSA_NOT_ENOUGH_MEMORY
     * @type {Integer (Int32)}
     */
    static NOT_ENOUGH_MEMORY => 8

    /**
     * Native name: WSA_OPERATION_ABORTED
     * @type {Integer (Int32)}
     */
    static OPERATION_ABORTED => 995

    /**
     * Native name: WSA_WAIT_EVENT_0
     * @type {Integer (Int32)}
     */
    static WAIT_EVENT_0 => 0

    /**
     * Native name: WSA_WAIT_IO_COMPLETION
     * @type {Integer (Int32)}
     */
    static WAIT_IO_COMPLETION => 192

    /**
     * @type {Integer (Int32)}
     */
    static WSABASEERR => 10000

    /**
     * @type {Integer (Int32)}
     */
    static WSAEINTR => 10004

    /**
     * @type {Integer (Int32)}
     */
    static WSAEBADF => 10009

    /**
     * @type {Integer (Int32)}
     */
    static WSAEACCES => 10013

    /**
     * @type {Integer (Int32)}
     */
    static WSAEFAULT => 10014

    /**
     * @type {Integer (Int32)}
     */
    static WSAEINVAL => 10022

    /**
     * @type {Integer (Int32)}
     */
    static WSAEMFILE => 10024

    /**
     * @type {Integer (Int32)}
     */
    static WSAEWOULDBLOCK => 10035

    /**
     * @type {Integer (Int32)}
     */
    static WSAEINPROGRESS => 10036

    /**
     * @type {Integer (Int32)}
     */
    static WSAEALREADY => 10037

    /**
     * @type {Integer (Int32)}
     */
    static WSAENOTSOCK => 10038

    /**
     * @type {Integer (Int32)}
     */
    static WSAEDESTADDRREQ => 10039

    /**
     * @type {Integer (Int32)}
     */
    static WSAEMSGSIZE => 10040

    /**
     * @type {Integer (Int32)}
     */
    static WSAEPROTOTYPE => 10041

    /**
     * @type {Integer (Int32)}
     */
    static WSAENOPROTOOPT => 10042

    /**
     * @type {Integer (Int32)}
     */
    static WSAEPROTONOSUPPORT => 10043

    /**
     * @type {Integer (Int32)}
     */
    static WSAESOCKTNOSUPPORT => 10044

    /**
     * @type {Integer (Int32)}
     */
    static WSAEOPNOTSUPP => 10045

    /**
     * @type {Integer (Int32)}
     */
    static WSAEPFNOSUPPORT => 10046

    /**
     * @type {Integer (Int32)}
     */
    static WSAEAFNOSUPPORT => 10047

    /**
     * @type {Integer (Int32)}
     */
    static WSAEADDRINUSE => 10048

    /**
     * @type {Integer (Int32)}
     */
    static WSAEADDRNOTAVAIL => 10049

    /**
     * @type {Integer (Int32)}
     */
    static WSAENETDOWN => 10050

    /**
     * @type {Integer (Int32)}
     */
    static WSAENETUNREACH => 10051

    /**
     * @type {Integer (Int32)}
     */
    static WSAENETRESET => 10052

    /**
     * @type {Integer (Int32)}
     */
    static WSAECONNABORTED => 10053

    /**
     * @type {Integer (Int32)}
     */
    static WSAECONNRESET => 10054

    /**
     * @type {Integer (Int32)}
     */
    static WSAENOBUFS => 10055

    /**
     * @type {Integer (Int32)}
     */
    static WSAEISCONN => 10056

    /**
     * @type {Integer (Int32)}
     */
    static WSAENOTCONN => 10057

    /**
     * @type {Integer (Int32)}
     */
    static WSAESHUTDOWN => 10058

    /**
     * @type {Integer (Int32)}
     */
    static WSAETOOMANYREFS => 10059

    /**
     * @type {Integer (Int32)}
     */
    static WSAETIMEDOUT => 10060

    /**
     * @type {Integer (Int32)}
     */
    static WSAECONNREFUSED => 10061

    /**
     * @type {Integer (Int32)}
     */
    static WSAELOOP => 10062

    /**
     * @type {Integer (Int32)}
     */
    static WSAENAMETOOLONG => 10063

    /**
     * @type {Integer (Int32)}
     */
    static WSAEHOSTDOWN => 10064

    /**
     * @type {Integer (Int32)}
     */
    static WSAEHOSTUNREACH => 10065

    /**
     * @type {Integer (Int32)}
     */
    static WSAENOTEMPTY => 10066

    /**
     * @type {Integer (Int32)}
     */
    static WSAEPROCLIM => 10067

    /**
     * @type {Integer (Int32)}
     */
    static WSAEUSERS => 10068

    /**
     * @type {Integer (Int32)}
     */
    static WSAEDQUOT => 10069

    /**
     * @type {Integer (Int32)}
     */
    static WSAESTALE => 10070

    /**
     * @type {Integer (Int32)}
     */
    static WSAEREMOTE => 10071

    /**
     * @type {Integer (Int32)}
     */
    static WSASYSNOTREADY => 10091

    /**
     * @type {Integer (Int32)}
     */
    static WSAVERNOTSUPPORTED => 10092

    /**
     * @type {Integer (Int32)}
     */
    static WSANOTINITIALISED => 10093

    /**
     * @type {Integer (Int32)}
     */
    static WSAEDISCON => 10101

    /**
     * @type {Integer (Int32)}
     */
    static WSAENOMORE => 10102

    /**
     * @type {Integer (Int32)}
     */
    static WSAECANCELLED => 10103

    /**
     * @type {Integer (Int32)}
     */
    static WSAEINVALIDPROCTABLE => 10104

    /**
     * @type {Integer (Int32)}
     */
    static WSAEINVALIDPROVIDER => 10105

    /**
     * @type {Integer (Int32)}
     */
    static WSAEPROVIDERFAILEDINIT => 10106

    /**
     * @type {Integer (Int32)}
     */
    static WSASYSCALLFAILURE => 10107

    /**
     * @type {Integer (Int32)}
     */
    static WSASERVICE_NOT_FOUND => 10108

    /**
     * @type {Integer (Int32)}
     */
    static WSATYPE_NOT_FOUND => 10109

    /**
     * Native name: WSA_E_NO_MORE
     * @type {Integer (Int32)}
     */
    static E_NO_MORE => 10110

    /**
     * Native name: WSA_E_CANCELLED
     * @type {Integer (Int32)}
     */
    static E_CANCELLED => 10111

    /**
     * @type {Integer (Int32)}
     */
    static WSAEREFUSED => 10112

    /**
     * @type {Integer (Int32)}
     */
    static WSAHOST_NOT_FOUND => 11001

    /**
     * @type {Integer (Int32)}
     */
    static WSATRY_AGAIN => 11002

    /**
     * @type {Integer (Int32)}
     */
    static WSANO_RECOVERY => 11003

    /**
     * @type {Integer (Int32)}
     */
    static WSANO_DATA => 11004

    /**
     * Native name: WSA_QOS_RECEIVERS
     * @type {Integer (Int32)}
     */
    static QOS_RECEIVERS => 11005

    /**
     * Native name: WSA_QOS_SENDERS
     * @type {Integer (Int32)}
     */
    static QOS_SENDERS => 11006

    /**
     * Native name: WSA_QOS_NO_SENDERS
     * @type {Integer (Int32)}
     */
    static QOS_NO_SENDERS => 11007

    /**
     * Native name: WSA_QOS_NO_RECEIVERS
     * @type {Integer (Int32)}
     */
    static QOS_NO_RECEIVERS => 11008

    /**
     * Native name: WSA_QOS_REQUEST_CONFIRMED
     * @type {Integer (Int32)}
     */
    static QOS_REQUEST_CONFIRMED => 11009

    /**
     * Native name: WSA_QOS_ADMISSION_FAILURE
     * @type {Integer (Int32)}
     */
    static QOS_ADMISSION_FAILURE => 11010

    /**
     * Native name: WSA_QOS_POLICY_FAILURE
     * @type {Integer (Int32)}
     */
    static QOS_POLICY_FAILURE => 11011

    /**
     * Native name: WSA_QOS_BAD_STYLE
     * @type {Integer (Int32)}
     */
    static QOS_BAD_STYLE => 11012

    /**
     * Native name: WSA_QOS_BAD_OBJECT
     * @type {Integer (Int32)}
     */
    static QOS_BAD_OBJECT => 11013

    /**
     * Native name: WSA_QOS_TRAFFIC_CTRL_ERROR
     * @type {Integer (Int32)}
     */
    static QOS_TRAFFIC_CTRL_ERROR => 11014

    /**
     * Native name: WSA_QOS_GENERIC_ERROR
     * @type {Integer (Int32)}
     */
    static QOS_GENERIC_ERROR => 11015

    /**
     * Native name: WSA_QOS_ESERVICETYPE
     * @type {Integer (Int32)}
     */
    static QOS_ESERVICETYPE => 11016

    /**
     * Native name: WSA_QOS_EFLOWSPEC
     * @type {Integer (Int32)}
     */
    static QOS_EFLOWSPEC => 11017

    /**
     * Native name: WSA_QOS_EPROVSPECBUF
     * @type {Integer (Int32)}
     */
    static QOS_EPROVSPECBUF => 11018

    /**
     * Native name: WSA_QOS_EFILTERSTYLE
     * @type {Integer (Int32)}
     */
    static QOS_EFILTERSTYLE => 11019

    /**
     * Native name: WSA_QOS_EFILTERTYPE
     * @type {Integer (Int32)}
     */
    static QOS_EFILTERTYPE => 11020

    /**
     * Native name: WSA_QOS_EFILTERCOUNT
     * @type {Integer (Int32)}
     */
    static QOS_EFILTERCOUNT => 11021

    /**
     * Native name: WSA_QOS_EOBJLENGTH
     * @type {Integer (Int32)}
     */
    static QOS_EOBJLENGTH => 11022

    /**
     * Native name: WSA_QOS_EFLOWCOUNT
     * @type {Integer (Int32)}
     */
    static QOS_EFLOWCOUNT => 11023

    /**
     * Native name: WSA_QOS_EUNKOWNPSOBJ
     * @type {Integer (Int32)}
     */
    static QOS_EUNKOWNPSOBJ => 11024

    /**
     * Native name: WSA_QOS_EPOLICYOBJ
     * @type {Integer (Int32)}
     */
    static QOS_EPOLICYOBJ => 11025

    /**
     * Native name: WSA_QOS_EFLOWDESC
     * @type {Integer (Int32)}
     */
    static QOS_EFLOWDESC => 11026

    /**
     * Native name: WSA_QOS_EPSFLOWSPEC
     * @type {Integer (Int32)}
     */
    static QOS_EPSFLOWSPEC => 11027

    /**
     * Native name: WSA_QOS_EPSFILTERSPEC
     * @type {Integer (Int32)}
     */
    static QOS_EPSFILTERSPEC => 11028

    /**
     * Native name: WSA_QOS_ESDMODEOBJ
     * @type {Integer (Int32)}
     */
    static QOS_ESDMODEOBJ => 11029

    /**
     * Native name: WSA_QOS_ESHAPERATEOBJ
     * @type {Integer (Int32)}
     */
    static QOS_ESHAPERATEOBJ => 11030

    /**
     * Native name: WSA_QOS_RESERVED_PETYPE
     * @type {Integer (Int32)}
     */
    static QOS_RESERVED_PETYPE => 11031

    /**
     * Native name: WSA_SECURE_HOST_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static SECURE_HOST_NOT_FOUND => 11032

    /**
     * Native name: WSA_IPSEC_NAME_POLICY_ERROR
     * @type {Integer (Int32)}
     */
    static IPSEC_NAME_POLICY_ERROR => 11033
}
