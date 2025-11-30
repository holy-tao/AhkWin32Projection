#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_TDRDBGCTRLTYPE extends Win32Enum{

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
