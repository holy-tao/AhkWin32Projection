#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRMSECURITYPROVIDERTYPE enumeration specifies the type of secure DRM environment used.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmsecurityprovidertype
 * @namespace Windows.Win32.Data.RightsManagement
 */
export default struct DRMSECURITYPROVIDERTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Software-level security, using a lockbox.
     * @type {Integer (Int32)}
     */
    static DRMSECURITYPROVIDERTYPE_SOFTWARESECREP => 0
}
