#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The Starter Group Policy object is a system Starter Group Policy object or a custom Starter Group Policy object.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/ne-gpmgmt-gpmstartergpotype
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPMStarterGPOType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A system Starter Group Policy object
     * @type {Integer (Int32)}
     */
    static typeSystem => 0

    /**
     * A  custom Starter Group Policy object
     * @type {Integer (Int32)}
     */
    static typeCustom => 1
}
