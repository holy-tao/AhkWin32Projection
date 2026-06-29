#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DRAW_TEXT_FORMAT {
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
    static DT_BOTTOM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DT_CALCRECT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DT_CENTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DT_EDITCONTROL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DT_END_ELLIPSIS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DT_EXPANDTABS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DT_EXTERNALLEADING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DT_HIDEPREFIX => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DT_INTERNAL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DT_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DT_MODIFYSTRING => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DT_NOCLIP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DT_NOFULLWIDTHCHARBREAK => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DT_NOPREFIX => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DT_PATH_ELLIPSIS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DT_PREFIXONLY => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DT_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DT_RTLREADING => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DT_SINGLELINE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DT_TABSTOP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DT_TOP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DT_VCENTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DT_WORDBREAK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DT_WORD_ELLIPSIS => 262144
}
