#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the SHARINGCONNECTIONTYPE type enumerate the possible types of shared connections.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/ne-netcon-sharingconnectiontype
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class SHARINGCONNECTIONTYPE extends Win32Enum{

    /**
     * The connection is public.
     * @type {Integer (Int32)}
     */
    static ICSSHARINGTYPE_PUBLIC => 0

    /**
     * The connection is private.
     * @type {Integer (Int32)}
     */
    static ICSSHARINGTYPE_PRIVATE => 1
}
