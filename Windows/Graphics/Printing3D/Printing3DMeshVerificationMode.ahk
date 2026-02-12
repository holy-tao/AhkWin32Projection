#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the mode in which the mesh is verified.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmeshverificationmode
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DMeshVerificationMode extends Win32Enum{

    /**
     * Return results upon finding the first failure.
     * @type {Integer (Int32)}
     */
    static FindFirstError => 0

    /**
     * Wait to return results until the verification is complete.
     * @type {Integer (Int32)}
     */
    static FindAllErrors => 1
}
