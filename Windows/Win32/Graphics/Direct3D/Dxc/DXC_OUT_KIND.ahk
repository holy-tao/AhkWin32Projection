#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
class DXC_OUT_KIND extends Win32Enum {

    /**
     * Native name: DXC_OUT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: DXC_OUT_OBJECT
     * @type {Integer (Int32)}
     */
    static OBJECT => 1

    /**
     * Native name: DXC_OUT_ERRORS
     * @type {Integer (Int32)}
     */
    static ERRORS => 2

    /**
     * Native name: DXC_OUT_PDB
     * @type {Integer (Int32)}
     */
    static PDB => 3

    /**
     * Native name: DXC_OUT_SHADER_HASH
     * @type {Integer (Int32)}
     */
    static SHADER_HASH => 4

    /**
     * Native name: DXC_OUT_DISASSEMBLY
     * @type {Integer (Int32)}
     */
    static DISASSEMBLY => 5

    /**
     * Native name: DXC_OUT_HLSL
     * @type {Integer (Int32)}
     */
    static HLSL => 6

    /**
     * Native name: DXC_OUT_TEXT
     * @type {Integer (Int32)}
     */
    static TEXT => 7

    /**
     * Native name: DXC_OUT_REFLECTION
     * @type {Integer (Int32)}
     */
    static REFLECTION => 8

    /**
     * Native name: DXC_OUT_ROOT_SIGNATURE
     * @type {Integer (Int32)}
     */
    static ROOT_SIGNATURE => 9

    /**
     * Native name: DXC_OUT_EXTRA_OUTPUTS
     * @type {Integer (Int32)}
     */
    static EXTRA_OUTPUTS => 10

    /**
     * Native name: DXC_OUT_REMARKS
     * @type {Integer (Int32)}
     */
    static REMARKS => 11

    /**
     * Native name: DXC_OUT_TIME_REPORT
     * @type {Integer (Int32)}
     */
    static TIME_REPORT => 12

    /**
     * Native name: DXC_OUT_TIME_TRACE
     * @type {Integer (Int32)}
     */
    static TIME_TRACE => 13

    /**
     * Native name: DXC_OUT_LAST
     * @type {Integer (Int32)}
     */
    static LAST => 13

    /**
     * Native name: DXC_OUT_NUM_ENUMS
     * @type {Integer (Int32)}
     */
    static NUM_ENUMS => 14
}
