#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_TDRDBGCTRLTYPE {
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
    static D3DKMT_TDRDBGCTRLTYPE_FORCETDR => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_TDRDBGCTRLTYPE_DISABLEBREAK => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_TDRDBGCTRLTYPE_ENABLEBREAK => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_TDRDBGCTRLTYPE_UNCONDITIONAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_TDRDBGCTRLTYPE_VSYNCTDR => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_TDRDBGCTRLTYPE_GPUTDR => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_TDRDBGCTRLTYPE_FORCEDODTDR => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_TDRDBGCTRLTYPE_FORCEDODVSYNCTDR => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_TDRDBGCTRLTYPE_ENGINETDR => 8
}
