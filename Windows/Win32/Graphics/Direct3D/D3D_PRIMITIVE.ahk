#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates how the pipeline interprets geometry or hull shader input primitives.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getgsinputprimitive">ID3D11ShaderReflection::GetGSInputPrimitive</a> method returns a
 *           <b>D3D11_PRIMITIVE</b>-typed value.
 *         
 * 
 * The <b>D3D11_PRIMITIVE</b> enumeration is type defined in the D3D11.h header file as a
 *           <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive">D3D_PRIMITIVE</a> enumeration, which is fully defined in the D3DCommon.h header file.
 *         
 * 
 * 
 * ```
 * typedef D3D_PRIMITIVE D3D11_PRIMITIVE;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive
 * @namespace Windows.Win32.Graphics.Direct3D
 */
class D3D_PRIMITIVE extends Win32Enum {

    /**
     * Native name: D3D_PRIMITIVE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: D3D_PRIMITIVE_POINT
     * @type {Integer (Int32)}
     */
    static POINT => 1

    /**
     * Native name: D3D_PRIMITIVE_LINE
     * @type {Integer (Int32)}
     */
    static LINE => 2

    /**
     * Native name: D3D_PRIMITIVE_TRIANGLE
     * @type {Integer (Int32)}
     */
    static TRIANGLE => 3

    /**
     * Native name: D3D_PRIMITIVE_LINE_ADJ
     * @type {Integer (Int32)}
     */
    static LINE_ADJ => 6

    /**
     * Native name: D3D_PRIMITIVE_TRIANGLE_ADJ
     * @type {Integer (Int32)}
     */
    static TRIANGLE_ADJ => 7

    /**
     * Native name: D3D_PRIMITIVE_1_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 1_CONTROL_POINT_PATCH => 8

    /**
     * Native name: D3D_PRIMITIVE_2_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 2_CONTROL_POINT_PATCH => 9

    /**
     * Native name: D3D_PRIMITIVE_3_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 3_CONTROL_POINT_PATCH => 10

    /**
     * Native name: D3D_PRIMITIVE_4_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 4_CONTROL_POINT_PATCH => 11

    /**
     * Native name: D3D_PRIMITIVE_5_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 5_CONTROL_POINT_PATCH => 12

    /**
     * Native name: D3D_PRIMITIVE_6_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 6_CONTROL_POINT_PATCH => 13

    /**
     * Native name: D3D_PRIMITIVE_7_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 7_CONTROL_POINT_PATCH => 14

    /**
     * Native name: D3D_PRIMITIVE_8_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 8_CONTROL_POINT_PATCH => 15

    /**
     * Native name: D3D_PRIMITIVE_9_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 9_CONTROL_POINT_PATCH => 16

    /**
     * Native name: D3D_PRIMITIVE_10_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 10_CONTROL_POINT_PATCH => 17

    /**
     * Native name: D3D_PRIMITIVE_11_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 11_CONTROL_POINT_PATCH => 18

    /**
     * Native name: D3D_PRIMITIVE_12_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 12_CONTROL_POINT_PATCH => 19

    /**
     * Native name: D3D_PRIMITIVE_13_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 13_CONTROL_POINT_PATCH => 20

    /**
     * Native name: D3D_PRIMITIVE_14_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 14_CONTROL_POINT_PATCH => 21

    /**
     * Native name: D3D_PRIMITIVE_15_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 15_CONTROL_POINT_PATCH => 22

    /**
     * Native name: D3D_PRIMITIVE_16_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 16_CONTROL_POINT_PATCH => 23

    /**
     * Native name: D3D_PRIMITIVE_17_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 17_CONTROL_POINT_PATCH => 24

    /**
     * Native name: D3D_PRIMITIVE_18_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 18_CONTROL_POINT_PATCH => 25

    /**
     * Native name: D3D_PRIMITIVE_19_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 19_CONTROL_POINT_PATCH => 26

    /**
     * Native name: D3D_PRIMITIVE_20_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 20_CONTROL_POINT_PATCH => 27

    /**
     * Native name: D3D_PRIMITIVE_21_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 21_CONTROL_POINT_PATCH => 28

    /**
     * Native name: D3D_PRIMITIVE_22_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 22_CONTROL_POINT_PATCH => 29

    /**
     * Native name: D3D_PRIMITIVE_23_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 23_CONTROL_POINT_PATCH => 30

    /**
     * Native name: D3D_PRIMITIVE_24_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 24_CONTROL_POINT_PATCH => 31

    /**
     * Native name: D3D_PRIMITIVE_25_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 25_CONTROL_POINT_PATCH => 32

    /**
     * Native name: D3D_PRIMITIVE_26_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 26_CONTROL_POINT_PATCH => 33

    /**
     * Native name: D3D_PRIMITIVE_27_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 27_CONTROL_POINT_PATCH => 34

    /**
     * Native name: D3D_PRIMITIVE_28_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 28_CONTROL_POINT_PATCH => 35

    /**
     * Native name: D3D_PRIMITIVE_29_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 29_CONTROL_POINT_PATCH => 36

    /**
     * Native name: D3D_PRIMITIVE_30_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 30_CONTROL_POINT_PATCH => 37

    /**
     * Native name: D3D_PRIMITIVE_31_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 31_CONTROL_POINT_PATCH => 38

    /**
     * Native name: D3D_PRIMITIVE_32_CONTROL_POINT_PATCH
     * @type {Integer (Int32)}
     */
    static 32_CONTROL_POINT_PATCH => 39

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_LINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TRIANGLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_LINE_ADJ => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TRIANGLE_ADJ => 7

    /**
     * The shader has not been initialized with an input primitive type.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_UNDEFINED => 0

    /**
     * Interpret the input primitive as a point.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_POINT => 1

    /**
     * Interpret the input primitive as a line.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_LINE => 2

    /**
     * Interpret the input primitive as a triangle.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TRIANGLE => 3

    /**
     * Interpret the input primitive as a line with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_LINE_ADJ => 6

    /**
     * Interpret the input primitive as a triangle with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TRIANGLE_ADJ => 7

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_1_CONTROL_POINT_PATCH => 8

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_2_CONTROL_POINT_PATCH => 9

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_3_CONTROL_POINT_PATCH => 10

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_4_CONTROL_POINT_PATCH => 11

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_5_CONTROL_POINT_PATCH => 12

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_6_CONTROL_POINT_PATCH => 13

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_7_CONTROL_POINT_PATCH => 14

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_8_CONTROL_POINT_PATCH => 15

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_9_CONTROL_POINT_PATCH => 16

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_10_CONTROL_POINT_PATCH => 17

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_11_CONTROL_POINT_PATCH => 18

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_12_CONTROL_POINT_PATCH => 19

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_13_CONTROL_POINT_PATCH => 20

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_14_CONTROL_POINT_PATCH => 21

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_15_CONTROL_POINT_PATCH => 22

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_16_CONTROL_POINT_PATCH => 23

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_17_CONTROL_POINT_PATCH => 24

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_18_CONTROL_POINT_PATCH => 25

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_19_CONTROL_POINT_PATCH => 26

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_20_CONTROL_POINT_PATCH => 27

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_21_CONTROL_POINT_PATCH => 28

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_22_CONTROL_POINT_PATCH => 29

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_23_CONTROL_POINT_PATCH => 30

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_24_CONTROL_POINT_PATCH => 31

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_25_CONTROL_POINT_PATCH => 32

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_26_CONTROL_POINT_PATCH => 33

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_27_CONTROL_POINT_PATCH => 34

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_28_CONTROL_POINT_PATCH => 35

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_29_CONTROL_POINT_PATCH => 36

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_30_CONTROL_POINT_PATCH => 37

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_31_CONTROL_POINT_PATCH => 38

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_32_CONTROL_POINT_PATCH => 39
}
