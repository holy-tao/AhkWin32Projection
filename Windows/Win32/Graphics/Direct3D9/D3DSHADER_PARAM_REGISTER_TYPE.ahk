#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSHADER_PARAM_REGISTER_TYPE {
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
    static D3DSPR_TEMP => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_INPUT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_CONST => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_ADDR => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_TEXTURE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_RASTOUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_ATTROUT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_TEXCRDOUT => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_OUTPUT => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_CONSTINT => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_COLOROUT => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_DEPTHOUT => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_SAMPLER => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_CONST2 => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_CONST3 => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_CONST4 => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_CONSTBOOL => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_LOOP => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_TEMPFLOAT16 => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_MISCTYPE => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_LABEL => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPR_PREDICATE => 19
}
