#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which PDL conversion processing operations are performed by the host.
 * @remarks
 * This enumeration is used by an overload of the [ConvertPdlAsync](/uwp/api/windows.graphics.printing.workflow.printworkflowpdlconverter.convertpdlasync)) method.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.pdlconversionhostbasedprocessingoperations
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PdlConversionHostBasedProcessingOperations extends Win32BitflagEnum{

    /**
     * No operations are performed by the host..
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Page rotation is performed by the host.
     * @type {Integer (UInt32)}
     */
    static PageRotation => 1

    /**
     * Page rotation is performed by the host.
     * @type {Integer (UInt32)}
     */
    static PageOrdering => 2

    /**
     * Document copies are performed by the host.
     * @type {Integer (UInt32)}
     */
    static Copies => 4

    /**
     * Blank page insertion is performed by the host.
     * @type {Integer (UInt32)}
     */
    static BlankPageInsertion => 8

    /**
     * All operations are performed by the host.
     * @type {Integer (UInt32)}
     */
    static All => 4294967295
}
