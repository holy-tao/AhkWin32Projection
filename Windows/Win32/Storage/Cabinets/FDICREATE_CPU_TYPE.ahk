#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct FDICREATE_CPU_TYPE {
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
    static cpuUNKNOWN => -1

    /**
     * @type {Integer (Int32)}
     */
    static cpu80286 => 0

    /**
     * @type {Integer (Int32)}
     */
    static cpu80386 => 1
}
