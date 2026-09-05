#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_TDRDBGCTRLTYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_TDRDBGCTRLTYPE_FORCETDR
     * @type {Integer (Int32)}
     */
    static FORCETDR => 0

    /**
     * Native name: D3DKMT_TDRDBGCTRLTYPE_DISABLEBREAK
     * @type {Integer (Int32)}
     */
    static DISABLEBREAK => 1

    /**
     * Native name: D3DKMT_TDRDBGCTRLTYPE_ENABLEBREAK
     * @type {Integer (Int32)}
     */
    static ENABLEBREAK => 2

    /**
     * Native name: D3DKMT_TDRDBGCTRLTYPE_UNCONDITIONAL
     * @type {Integer (Int32)}
     */
    static UNCONDITIONAL => 3

    /**
     * Native name: D3DKMT_TDRDBGCTRLTYPE_VSYNCTDR
     * @type {Integer (Int32)}
     */
    static VSYNCTDR => 4

    /**
     * Native name: D3DKMT_TDRDBGCTRLTYPE_GPUTDR
     * @type {Integer (Int32)}
     */
    static GPUTDR => 5

    /**
     * Native name: D3DKMT_TDRDBGCTRLTYPE_FORCEDODTDR
     * @type {Integer (Int32)}
     */
    static FORCEDODTDR => 6

    /**
     * Native name: D3DKMT_TDRDBGCTRLTYPE_FORCEDODVSYNCTDR
     * @type {Integer (Int32)}
     */
    static FORCEDODVSYNCTDR => 7

    /**
     * Native name: D3DKMT_TDRDBGCTRLTYPE_ENGINETDR
     * @type {Integer (Int32)}
     */
    static ENGINETDR => 8
}
