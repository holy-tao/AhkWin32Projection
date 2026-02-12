#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of errors that may be encountered by the [Print3DWorkflow](print3dworkflow.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflowdetail
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class Print3DWorkflowDetail extends Win32Enum{

    /**
     * No known error has been encountered.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The 3D model exceeds the print bed.
     * @type {Integer (Int32)}
     */
    static ModelExceedsPrintBed => 1

    /**
     * The upload failed.
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
     * The 3D model does not have manifold edges.
     * @type {Integer (Int32)}
     */
    static ModelNotManifold => 5

    /**
     * The print ticket is not valid.
     * @type {Integer (Int32)}
     */
    static InvalidPrintTicket => 6
}
