#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the function of the object in the 3D model.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dobjecttype
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DObjectType extends Win32Enum{

    /**
     * Functions as a core component of the 3D model.
     * @type {Integer (Int32)}
     */
    static Model => 0

    /**
     * Functions as a support object.
     * @type {Integer (Int32)}
     */
    static Support => 1

    /**
     * Functions in some other capacity.
     * @type {Integer (Int32)}
     */
    static Others => 2
}
