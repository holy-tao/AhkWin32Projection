#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Shader register types.
 * @remarks
 * The <b>D3D10_SHADER_DEBUG_REGTYPE</b> enumeration is used to specify register types 
 *   in <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_outputreg_info">D3D10_SHADER_DEBUG_INPUT_INFO</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_outputreg_info">D3D10_SHADER_DEBUG_OUTPUTREG_INFO</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_regtype
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
class D3D10_SHADER_DEBUG_REGTYPE extends Win32Enum {

    /**
     * Input register.
     * Native name: D3D10_SHADER_DEBUG_REG_INPUT
     * @type {Integer (Int32)}
     */
    static REG_INPUT => 0

    /**
     * Output register.
     * Native name: D3D10_SHADER_DEBUG_REG_OUTPUT
     * @type {Integer (Int32)}
     */
    static REG_OUTPUT => 1

    /**
     * Constant buffer register.
     * Native name: D3D10_SHADER_DEBUG_REG_CBUFFER
     * @type {Integer (Int32)}
     */
    static REG_CBUFFER => 2

    /**
     * Texture buffer register.
     * Native name: D3D10_SHADER_DEBUG_REG_TBUFFER
     * @type {Integer (Int32)}
     */
    static REG_TBUFFER => 3

    /**
     * Temporary register.
     * Native name: D3D10_SHADER_DEBUG_REG_TEMP
     * @type {Integer (Int32)}
     */
    static REG_TEMP => 4

    /**
     * Array of temporary registers.
     * Native name: D3D10_SHADER_DEBUG_REG_TEMPARRAY
     * @type {Integer (Int32)}
     */
    static REG_TEMPARRAY => 5

    /**
     * Texture register.
     * Native name: D3D10_SHADER_DEBUG_REG_TEXTURE
     * @type {Integer (Int32)}
     */
    static REG_TEXTURE => 6

    /**
     * Sampler register.
     * Native name: D3D10_SHADER_DEBUG_REG_SAMPLER
     * @type {Integer (Int32)}
     */
    static REG_SAMPLER => 7

    /**
     * Immediate constant buffer register.
     * Native name: D3D10_SHADER_DEBUG_REG_IMMEDIATECBUFFER
     * @type {Integer (Int32)}
     */
    static REG_IMMEDIATECBUFFER => 8

    /**
     * Literal register.
     * Native name: D3D10_SHADER_DEBUG_REG_LITERAL
     * @type {Integer (Int32)}
     */
    static REG_LITERAL => 9

    /**
     * Unused register.
     * Native name: D3D10_SHADER_DEBUG_REG_UNUSED
     * @type {Integer (Int32)}
     */
    static REG_UNUSED => 10

    /**
     * Interface register.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_DEBUG_REG_INTERFACE_POINTERS => 11

    /**
     * Unordered Access View (UAV) register.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_DEBUG_REG_UAV => 12
}
