#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DIRECTORY_TYPE enum is used to indicate the type of directory server.
 * @see https://learn.microsoft.com/windows/win32/api/rend/ne-rend-directory_type
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct DIRECTORY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Directory type is NTDS.
     * @type {Integer (Int32)}
     */
    static DT_NTDS => 1

    /**
     * Directory type is ILS. The ILS directory type is valid only for Windows 2000 and not for Windows XP.
     * @type {Integer (Int32)}
     */
    static DT_ILS => 2
}
