#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSHADER_PARAM_SRCMOD_TYPE {
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
    static D3DSPSM_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_NEG => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_BIAS => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_BIASNEG => 50331648

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_SIGN => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_SIGNNEG => 83886080

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_COMP => 100663296

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_X2 => 117440512

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_X2NEG => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_DZ => 150994944

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_DW => 167772160

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_ABS => 184549376

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_ABSNEG => 201326592

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPSM_NOT => 218103808
}
