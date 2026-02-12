#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of errors encountered during a 3D print request.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtaskdetail
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Print3DTaskDetail extends Win32Enum{

    /**
     * No additional information is available.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The 3D model exceeds the print bed.
     * @type {Integer (Int32)}
     */
    static ModelExceedsPrintBed => 1

    /**
     * The upload of the 3D print package failed.
     * @type {Integer (Int32)}
     */
    static UploadFailed => 2

    /**
     * An invalid printing material has been selected.
     * @type {Integer (Int32)}
     */
    static InvalidMaterialSelection => 3

    /**
     * The 3D model is not valid.
     * @type {Integer (Int32)}
     */
    static InvalidModel => 4

    /**
     * The 3d model does not have manifold edges.
     * @type {Integer (Int32)}
     */
    static ModelNotManifold => 5

    /**
     * The print ticket is not valid.
     * @type {Integer (Int32)}
     */
    static InvalidPrintTicket => 6
}
