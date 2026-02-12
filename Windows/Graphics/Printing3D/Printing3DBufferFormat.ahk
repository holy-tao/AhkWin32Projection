#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the format used by the buffer.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbufferformat
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DBufferFormat extends Win32Enum{

    /**
     * The format is not known.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * A four-component, 128-bit floating-point format that supports 32 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static R32G32B32A32Float => 2

    /**
     * A four-component, 128-bit unsigned-integer format that supports 32 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static R32G32B32A32UInt => 3

    /**
     * A three-component, 96-bit floating-point format that supports 32 bits per color channel.
     * @type {Integer (Int32)}
     */
    static R32G32B32Float => 6

    /**
     * A three-component, 96-bit unsigned-integer format that supports 32 bits per color channel.
     * @type {Integer (Int32)}
     */
    static R32G32B32UInt => 7

    /**
     * A buffer of type **double**.
     * @type {Integer (Int32)}
     */
    static Printing3DDouble => 500

    /**
     * A buffer of type **uint**.
     * @type {Integer (Int32)}
     */
    static Printing3DUInt => 501
}
