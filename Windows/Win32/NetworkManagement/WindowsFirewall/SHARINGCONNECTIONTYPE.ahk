#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the SHARINGCONNECTIONTYPE type enumerate the possible types of shared connections.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/ne-netcon-sharingconnectiontype
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct SHARINGCONNECTIONTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
