#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IconIdentifier enumeration is introduced in MMC 1.2.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-iconidentifier
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IconIdentifier {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No icon displayed in error message.
     * @type {Integer (Int32)}
     */
    static Icon_None => 0

    /**
     * Error icon displayed in error message.
     * @type {Integer (Int32)}
     */
    static Icon_Error => 32513

    /**
     * Question icon displayed in error message.
     * @type {Integer (Int32)}
     */
    static Icon_Question => 32514

    /**
     * Warning icon displayed in error message.
     * @type {Integer (Int32)}
     */
    static Icon_Warning => 32515

    /**
     * Information icon displayed in error message.
     * @type {Integer (Int32)}
     */
    static Icon_Information => 32516

    /**
     * Used internally by MMC.
     * @type {Integer (Int32)}
     */
    static Icon_First => 32513

    /**
     * Used internally by MMC.
     * @type {Integer (Int32)}
     */
    static Icon_Last => 32516
}
