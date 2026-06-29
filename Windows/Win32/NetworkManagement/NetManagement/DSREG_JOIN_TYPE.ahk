#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the possible ways that a device can be joined to Microsoft Azure Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/ne-lmjoin-dsreg_join_type
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct DSREG_JOIN_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * The device is registered to Azure Active Directory (Azure AD), meaning an Azure AD work account is added on the device.
     * @type {Integer (Int32)}
     */
    static DSREG_WORKPLACE_JOIN => 2
}
