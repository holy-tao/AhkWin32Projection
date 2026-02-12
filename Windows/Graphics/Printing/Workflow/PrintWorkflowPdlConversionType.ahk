#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the different types of page description language (PDL) converters that can be used with the [GetPdlConverter](printworkflowpdlmodificationrequestedeventargs_getpdlconverter_762504533.md) method.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlconversiontype
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowPdlConversionType extends Win32Enum{

    /**
     * XPS to PDF converter.
     * @type {Integer (Int32)}
     */
    static XpsToPdf => 0

    /**
     * XPS to PWGR converter.
     * @type {Integer (Int32)}
     */
    static XpsToPwgr => 1

    /**
     * XPS to PCLM converter.
     * @type {Integer (Int32)}
     */
    static XpsToPclm => 2

    /**
     * XPS to TIFF converter.
     * @type {Integer (Int32)}
     */
    static XpsToTiff => 3
}
