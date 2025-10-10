#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that identify resource types that can be bound to a shader and that are reflected as part of the resource description for the shader.
 * @remarks
 * 
  * <b>D3D_SHADER_INPUT_TYPE</b>-typed values are specified in the <b>Type</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_shader_input_bind_desc">D3D11_SHADER_INPUT_BIND_DESC</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ne-d3dcommon-d3d_shader_input_type
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SHADER_INPUT_TYPE{

    /**
     * The shader resource is a constant buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_CBUFFER => 0

    /**
     * The shader resource is a texture buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_TBUFFER => 1

    /**
     * The shader resource is a texture.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_TEXTURE => 2

    /**
     * The shader resource is a sampler.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_SAMPLER => 3

    /**
     * The shader resource is a read-and-write buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_UAV_RWTYPED => 4

    /**
     * The shader resource is a structured buffer.
 * 
 * For more information about structured buffer, see the <b>Remarks</b> section.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_STRUCTURED => 5

    /**
     * The shader resource is a read-and-write structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_UAV_RWSTRUCTURED => 6

    /**
     * The shader resource is a byte-address buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_BYTEADDRESS => 7

    /**
     * The shader resource is a read-and-write byte-address buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_UAV_RWBYTEADDRESS => 8

    /**
     * The shader resource is an append-structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_UAV_APPEND_STRUCTURED => 9

    /**
     * The shader resource is a consume-structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_UAV_CONSUME_STRUCTURED => 10

    /**
     * The shader resource is a read-and-write structured buffer that uses the built-in counter to append or consume.
     * @type {Integer (Int32)}
     */
    static D3D_SIT_UAV_RWSTRUCTURED_WITH_COUNTER => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SIT_RTACCELERATIONSTRUCTURE => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SIT_UAV_FEEDBACKTEXTURE => 13

    /**
     * The shader resource is a constant buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_SIT_CBUFFER => 0

    /**
     * The shader resource is a texture buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_SIT_TBUFFER => 1

    /**
     * The shader resource is a texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SIT_TEXTURE => 2

    /**
     * The shader resource is a sampler.
     * @type {Integer (Int32)}
     */
    static D3D10_SIT_SAMPLER => 3

    /**
     * The shader resource is a read-and-write buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SIT_UAV_RWTYPED => 4

    /**
     * The shader resource is a structured buffer.
 * 
 * For more information about structured buffer, see the <b>Remarks</b> section.
     * @type {Integer (Int32)}
     */
    static D3D11_SIT_STRUCTURED => 5

    /**
     * The shader resource is a read-and-write structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SIT_UAV_RWSTRUCTURED => 6

    /**
     * The shader resource is a byte-address buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SIT_BYTEADDRESS => 7

    /**
     * The shader resource is a read-and-write byte-address buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SIT_UAV_RWBYTEADDRESS => 8

    /**
     * The shader resource is an append-structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SIT_UAV_APPEND_STRUCTURED => 9

    /**
     * The shader resource is a consume-structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SIT_UAV_CONSUME_STRUCTURED => 10

    /**
     * The shader resource is a read-and-write structured buffer that uses the built-in counter to append or consume.
     * @type {Integer (Int32)}
     */
    static D3D11_SIT_UAV_RWSTRUCTURED_WITH_COUNTER => 11
}
