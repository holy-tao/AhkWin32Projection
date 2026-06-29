#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines DVD navigation command types.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_navcmdtype
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_NavCmdType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Pre-command.
     * @type {Integer (Int32)}
     */
    static DVD_NavCmdType_Pre => 1

    /**
     * Post-command.
     * @type {Integer (Int32)}
     */
    static DVD_NavCmdType_Post => 2

    /**
     * Cell command.
     * @type {Integer (Int32)}
     */
    static DVD_NavCmdType_Cell => 3

    /**
     * Button command.
     * @type {Integer (Int32)}
     */
    static DVD_NavCmdType_Button => 4
}
