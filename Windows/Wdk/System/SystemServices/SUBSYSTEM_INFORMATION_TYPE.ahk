#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SUBSYSTEM_INFORMATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static SubsystemInformationTypeWin32 => 0

    /**
     * @type {Integer (Int32)}
     */
    static SubsystemInformationTypeWSL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MaxSubsystemInformationType => 2
}
