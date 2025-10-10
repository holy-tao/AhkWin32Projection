#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the SHARINGCONNECTIONTYPE type enumerate the possible types of shared connections.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/ne-netcon-sharingconnectiontype
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class SHARINGCONNECTIONTYPE{

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
