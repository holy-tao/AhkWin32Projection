#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSA_ERROR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WSA_IO_PENDING => 997

    /**
     * @type {Integer (Int32)}
     */
    static WSA_IO_INCOMPLETE => 996

    /**
     * @type {Integer (Int32)}
     */
    static WSA_INVALID_HANDLE => 6

    /**
     * @type {Integer (Int32)}
     */
    static WSA_INVALID_PARAMETER => 87

    /**
     * @type {Integer (Int32)}
     */
    static WSA_NOT_ENOUGH_MEMORY => 8

    /**
     * @type {Integer (Int32)}
     */
    static WSA_OPERATION_ABORTED => 995

    /**
     * @type {Integer (Int32)}
     */
    static WSA_WAIT_EVENT_0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static WSA_WAIT_IO_COMPLETION => 192

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
     * @type {Integer (Int32)}
     */
    static WSA_E_NO_MORE => 10110

    /**
     * @type {Integer (Int32)}
     */
    static WSA_E_CANCELLED => 10111

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
     * @type {Integer (Int32)}
     */
    static WSA_QOS_RECEIVERS => 11005

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_SENDERS => 11006

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_NO_SENDERS => 11007

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_NO_RECEIVERS => 11008

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_REQUEST_CONFIRMED => 11009

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_ADMISSION_FAILURE => 11010

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_POLICY_FAILURE => 11011

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_BAD_STYLE => 11012

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_BAD_OBJECT => 11013

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_TRAFFIC_CTRL_ERROR => 11014

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_GENERIC_ERROR => 11015

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_ESERVICETYPE => 11016

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EFLOWSPEC => 11017

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EPROVSPECBUF => 11018

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EFILTERSTYLE => 11019

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EFILTERTYPE => 11020

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EFILTERCOUNT => 11021

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EOBJLENGTH => 11022

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EFLOWCOUNT => 11023

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EUNKOWNPSOBJ => 11024

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EPOLICYOBJ => 11025

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EFLOWDESC => 11026

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EPSFLOWSPEC => 11027

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_EPSFILTERSPEC => 11028

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_ESDMODEOBJ => 11029

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_ESHAPERATEOBJ => 11030

    /**
     * @type {Integer (Int32)}
     */
    static WSA_QOS_RESERVED_PETYPE => 11031

    /**
     * @type {Integer (Int32)}
     */
    static WSA_SECURE_HOST_NOT_FOUND => 11032

    /**
     * @type {Integer (Int32)}
     */
    static WSA_IPSEC_NAME_POLICY_ERROR => 11033
}
