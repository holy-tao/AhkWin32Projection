#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct PASTE_SPECIAL_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_SHOWHELP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_SELECTPASTE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_SELECTPASTELINK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_CHECKDISPLAYASICON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_DISABLEDISPLAYASICON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_HIDECHANGEICON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_STAYONCLIPBOARDCHANGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PSF_NOREFRESHDATAOBJECT => 128
}
