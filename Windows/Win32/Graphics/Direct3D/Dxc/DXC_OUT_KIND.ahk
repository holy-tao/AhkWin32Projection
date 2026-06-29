#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct DXC_OUT_KIND {
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
    static DXC_OUT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_OBJECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_ERRORS => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_PDB => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_SHADER_HASH => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_DISASSEMBLY => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_HLSL => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_TEXT => 7

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_REFLECTION => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_ROOT_SIGNATURE => 9

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_EXTRA_OUTPUTS => 10

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_REMARKS => 11

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_TIME_REPORT => 12

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_TIME_TRACE => 13

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_LAST => 13

    /**
     * @type {Integer (Int32)}
     */
    static DXC_OUT_NUM_ENUMS => 14
}
