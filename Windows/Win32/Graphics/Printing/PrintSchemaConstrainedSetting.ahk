#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PrintSchemaConstrainedSetting {
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
    static PrintSchemaConstrainedSetting_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaConstrainedSetting_PrintTicket => 1

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaConstrainedSetting_Admin => 2

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaConstrainedSetting_Device => 3
}
