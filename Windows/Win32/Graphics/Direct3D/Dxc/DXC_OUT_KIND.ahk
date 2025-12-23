#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class DXC_OUT_KIND extends Win32Enum{

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
