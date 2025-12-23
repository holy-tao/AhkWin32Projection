#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that identify various data, texture, and buffer types that can be assigned to a shader variable.
 * @remarks
 * A call to the
 *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getdesc">ID3D11ShaderReflectionType::GetDesc</a> method returns a
 *          <b>D3D_SHADER_VARIABLE_TYPE</b> value in the <b>Type</b> member of a
 *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_type_desc">D3D11_SHADER_TYPE_DESC</a> structure.
 *         
 * 
 * The types in a structured buffer describe the structure of the elements in the buffer.
 *           The layout of these types generally match their C++ struct counterparts.
 *           The following examples show structured buffers:
 *         
 * 
 * 
 * ```
 * struct mystruct {float4 val; uint ind;}; RWStructuredBuffer<mystruct> rwbuf;
 *                                          RWStructuredBuffer<float3> rwbuf2;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SHADER_VARIABLE_TYPE extends Win32Enum{

    /**
     * The variable is a void pointer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_VOID => 0

    /**
     * The variable is a boolean.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_BOOL => 1

    /**
     * The variable is an integer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_INT => 2

    /**
     * The variable is a floating-point number.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_FLOAT => 3

    /**
     * The variable is a string.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_STRING => 4

    /**
     * The variable is a texture.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TEXTURE => 5

    /**
     * The variable is a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TEXTURE1D => 6

    /**
     * The variable is a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TEXTURE2D => 7

    /**
     * The variable is a 3D texture.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TEXTURE3D => 8

    /**
     * The variable is a texture cube.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TEXTURECUBE => 9

    /**
     * The variable is a sampler.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_SAMPLER => 10

    /**
     * The variable is a 1D sampler.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_SAMPLER1D => 11

    /**
     * The variable is a 2D sampler.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_SAMPLER2D => 12

    /**
     * The variable is a 3D sampler.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_SAMPLER3D => 13

    /**
     * The variable is a cube sampler.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_SAMPLERCUBE => 14

    /**
     * The variable is a pixel shader.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_PIXELSHADER => 15

    /**
     * The variable is a vertex shader.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_VERTEXSHADER => 16

    /**
     * The variable is a pixel fragment.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_PIXELFRAGMENT => 17

    /**
     * The variable is a vertex fragment.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_VERTEXFRAGMENT => 18

    /**
     * The variable is an unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_UINT => 19

    /**
     * The variable is an 8-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_UINT8 => 20

    /**
     * The variable is a geometry shader.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_GEOMETRYSHADER => 21

    /**
     * The variable is a rasterizer-state object.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_RASTERIZER => 22

    /**
     * The variable is a depth-stencil-state object.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_DEPTHSTENCIL => 23

    /**
     * The variable is a blend-state object.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_BLEND => 24

    /**
     * The variable is a buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_BUFFER => 25

    /**
     * The variable is a constant buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_CBUFFER => 26

    /**
     * The variable is a texture buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TBUFFER => 27

    /**
     * The variable is a 1D-texture array.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TEXTURE1DARRAY => 28

    /**
     * The variable is a 2D-texture array.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TEXTURE2DARRAY => 29

    /**
     * The variable is a render-target view.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_RENDERTARGETVIEW => 30

    /**
     * The variable is a depth-stencil view.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_DEPTHSTENCILVIEW => 31

    /**
     * The variable is a 2D-multisampled texture.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TEXTURE2DMS => 32

    /**
     * The variable is a 2D-multisampled-texture array.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TEXTURE2DMSARRAY => 33

    /**
     * The variable is a texture-cube array.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_TEXTURECUBEARRAY => 34

    /**
     * The variable holds a compiled hull-shader binary.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_HULLSHADER => 35

    /**
     * The variable holds a compiled domain-shader binary.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_DOMAINSHADER => 36

    /**
     * The variable is an interface.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_INTERFACE_POINTER => 37

    /**
     * The variable holds a compiled compute-shader binary.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_COMPUTESHADER => 38

    /**
     * The variable is a double precision (64-bit) floating-point number.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_DOUBLE => 39

    /**
     * The variable is a 1D read-and-write texture.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_RWTEXTURE1D => 40

    /**
     * The variable is an array of 1D read-and-write textures.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_RWTEXTURE1DARRAY => 41

    /**
     * The variable is a 2D read-and-write texture.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_RWTEXTURE2D => 42

    /**
     * The variable is an array of 2D read-and-write textures.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_RWTEXTURE2DARRAY => 43

    /**
     * The variable is a 3D read-and-write texture.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_RWTEXTURE3D => 44

    /**
     * The variable is a read-and-write buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_RWBUFFER => 45

    /**
     * The variable is a byte-address buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_BYTEADDRESS_BUFFER => 46

    /**
     * The variable is a read-and-write byte-address buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_RWBYTEADDRESS_BUFFER => 47

    /**
     * The variable is a structured buffer. 
     * 
     * For more information about structured buffer, see the <b>Remarks</b> section.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_STRUCTURED_BUFFER => 48

    /**
     * The variable is a read-and-write structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_RWSTRUCTURED_BUFFER => 49

    /**
     * The variable is an append structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_APPEND_STRUCTURED_BUFFER => 50

    /**
     * The variable is a consume structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_CONSUME_STRUCTURED_BUFFER => 51

    /**
     * The variable is an 8-byte FLOAT.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_MIN8FLOAT => 52

    /**
     * The variable is a 10-byte FLOAT.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_MIN10FLOAT => 53

    /**
     * The variable is a 16-byte FLOAT.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_MIN16FLOAT => 54

    /**
     * The variable is a 12-byte INT.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_MIN12INT => 55

    /**
     * The variable is a 16-byte INT.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_MIN16INT => 56

    /**
     * The variable is a 16-byte INT.
     * @type {Integer (Int32)}
     */
    static D3D_SVT_MIN16UINT => 57

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SVT_INT16 => 58

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SVT_UINT16 => 59

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SVT_FLOAT16 => 60

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SVT_INT64 => 61

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SVT_UINT64 => 62

    /**
     * The variable is a void pointer.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_VOID => 0

    /**
     * The variable is a boolean.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_BOOL => 1

    /**
     * The variable is an integer.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_INT => 2

    /**
     * The variable is a floating-point number.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_FLOAT => 3

    /**
     * The variable is a string.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_STRING => 4

    /**
     * The variable is a texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TEXTURE => 5

    /**
     * The variable is a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TEXTURE1D => 6

    /**
     * The variable is a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TEXTURE2D => 7

    /**
     * The variable is a 3D texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TEXTURE3D => 8

    /**
     * The variable is a texture cube.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TEXTURECUBE => 9

    /**
     * The variable is a sampler.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_SAMPLER => 10

    /**
     * The variable is a 1D sampler.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_SAMPLER1D => 11

    /**
     * The variable is a 2D sampler.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_SAMPLER2D => 12

    /**
     * The variable is a 3D sampler.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_SAMPLER3D => 13

    /**
     * The variable is a cube sampler.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_SAMPLERCUBE => 14

    /**
     * The variable is a pixel shader.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_PIXELSHADER => 15

    /**
     * The variable is a vertex shader.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_VERTEXSHADER => 16

    /**
     * The variable is a pixel fragment.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_PIXELFRAGMENT => 17

    /**
     * The variable is a vertex fragment.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_VERTEXFRAGMENT => 18

    /**
     * The variable is an unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_UINT => 19

    /**
     * The variable is an 8-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_UINT8 => 20

    /**
     * The variable is a geometry shader.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_GEOMETRYSHADER => 21

    /**
     * The variable is a rasterizer-state object.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_RASTERIZER => 22

    /**
     * The variable is a depth-stencil-state object.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_DEPTHSTENCIL => 23

    /**
     * The variable is a blend-state object.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_BLEND => 24

    /**
     * The variable is a buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_BUFFER => 25

    /**
     * The variable is a constant buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_CBUFFER => 26

    /**
     * The variable is a texture buffer.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TBUFFER => 27

    /**
     * The variable is a 1D-texture array.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TEXTURE1DARRAY => 28

    /**
     * The variable is a 2D-texture array.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TEXTURE2DARRAY => 29

    /**
     * The variable is a render-target view.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_RENDERTARGETVIEW => 30

    /**
     * The variable is a depth-stencil view.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_DEPTHSTENCILVIEW => 31

    /**
     * The variable is a 2D-multisampled texture.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TEXTURE2DMS => 32

    /**
     * The variable is a 2D-multisampled-texture array.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TEXTURE2DMSARRAY => 33

    /**
     * The variable is a texture-cube array.
     * @type {Integer (Int32)}
     */
    static D3D10_SVT_TEXTURECUBEARRAY => 34

    /**
     * The variable holds a compiled hull-shader binary.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_HULLSHADER => 35

    /**
     * The variable holds a compiled domain-shader binary.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_DOMAINSHADER => 36

    /**
     * The variable is an interface.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_INTERFACE_POINTER => 37

    /**
     * The variable holds a compiled compute-shader binary.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_COMPUTESHADER => 38

    /**
     * The variable is a double precision (64-bit) floating-point number.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_DOUBLE => 39

    /**
     * The variable is a 1D read-and-write texture.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_RWTEXTURE1D => 40

    /**
     * The variable is an array of 1D read-and-write textures.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_RWTEXTURE1DARRAY => 41

    /**
     * The variable is a 2D read-and-write texture.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_RWTEXTURE2D => 42

    /**
     * The variable is an array of 2D read-and-write textures.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_RWTEXTURE2DARRAY => 43

    /**
     * The variable is a 3D read-and-write texture.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_RWTEXTURE3D => 44

    /**
     * The variable is a read-and-write buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_RWBUFFER => 45

    /**
     * The variable is a byte-address buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_BYTEADDRESS_BUFFER => 46

    /**
     * The variable is a read and write byte-address buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_RWBYTEADDRESS_BUFFER => 47

    /**
     * The variable is a structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_STRUCTURED_BUFFER => 48

    /**
     * The variable is a read-and-write structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_RWSTRUCTURED_BUFFER => 49

    /**
     * The variable is an append structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_APPEND_STRUCTURED_BUFFER => 50

    /**
     * The variable is a consume structured buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_SVT_CONSUME_STRUCTURED_BUFFER => 51
}
