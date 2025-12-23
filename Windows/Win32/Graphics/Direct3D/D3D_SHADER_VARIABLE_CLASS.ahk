#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that identify the class of a shader variable.
 * @remarks
 * The class of a shader variable is not a programming class; the class identifies the variable class such as scalar, vector, object, and so on. <b>D3D_SHADER_VARIABLE_CLASS</b>-typed values are specified in the <b>Class</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_type_desc">D3D11_SHADER_TYPE_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SHADER_VARIABLE_CLASS extends Win32Enum{

    /**
     * The shader variable is a scalar.
     * @type {Integer (Int32)}
     */
    static D3D_SVC_SCALAR => 0

    /**
     * The shader variable is a vector.
     * @type {Integer (Int32)}
     */
    static D3D_SVC_VECTOR => 1

    /**
     * The shader variable is a row-major matrix.
     * @type {Integer (Int32)}
     */
    static D3D_SVC_MATRIX_ROWS => 2

    /**
     * The shader variable is a column-major matrix.
     * @type {Integer (Int32)}
     */
    static D3D_SVC_MATRIX_COLUMNS => 3

    /**
     * The shader variable is an object.
     * @type {Integer (Int32)}
     */
    static D3D_SVC_OBJECT => 4

    /**
     * The shader variable is a structure.
     * @type {Integer (Int32)}
     */
    static D3D_SVC_STRUCT => 5

    /**
     * The shader variable is a class.
     * @type {Integer (Int32)}
     */
    static D3D_SVC_INTERFACE_CLASS => 6

    /**
     * The shader variable is an interface.
     * @type {Integer (Int32)}
     */
    static D3D_SVC_INTERFACE_POINTER => 7

    /**
     * The shader variable is a scalar.
     * @type {Integer (Int32)}
     */
    static D3D10_SVC_SCALAR => 0

    /**
     * The shader variable is a vector.
     * @type {Integer (Int32)}
     */
    static D3D10_SVC_VECTOR => 1

    /**
     * The shader variable is a row-major matrix.
     * @type {Integer (Int32)}
     */
    static D3D10_SVC_MATRIX_ROWS => 2

    /**
     * The shader variable is a column-major matrix.
     * @type {Integer (Int32)}
     */
    static D3D10_SVC_MATRIX_COLUMNS => 3

    /**
     * The shader variable is an object.
     * @type {Integer (Int32)}
     */
    static D3D10_SVC_OBJECT => 4

    /**
     * The shader variable is a structure.
     * @type {Integer (Int32)}
     */
    static D3D10_SVC_STRUCT => 5

    /**
     * The shader variable is a class.
     * @type {Integer (Int32)}
     */
    static D3D11_SVC_INTERFACE_CLASS => 6

    /**
     * The shader variable is an interface.
     * @type {Integer (Int32)}
     */
    static D3D11_SVC_INTERFACE_POINTER => 7
}
