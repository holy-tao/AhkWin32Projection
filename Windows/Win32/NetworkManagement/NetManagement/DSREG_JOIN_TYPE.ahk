#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the possible ways that a device can be joined to Microsoft Azure Active Directory.
 * @see https://docs.microsoft.com/windows/win32/api//lmjoin/ne-lmjoin-dsreg_join_type
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class DSREG_JOIN_TYPE{

    /**
     * The type of join is not known.
     * @type {Integer (Int32)}
     */
    static DSREG_UNKNOWN_JOIN => 0

    /**
     * The device is joined to Azure Active Directory (Azure AD).
     * @type {Integer (Int32)}
     */
    static DSREG_DEVICE_JOIN => 1

    /**
     * An Azure AD work account is added on the device.
     * @type {Integer (Int32)}
     */
    static DSREG_WORKPLACE_JOIN => 2
}
