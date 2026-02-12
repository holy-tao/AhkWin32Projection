#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the source from which page configuration settings are to be taken.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pageconfigurationsource
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class PageConfigurationSource extends Win32Enum{

    /**
     * Specifies that page configuration must be taken from the job level Print Ticket/Print Task options.
     * @type {Integer (Int32)}
     */
    static PrintJobConfiguration => 0

    /**
     * Specifies that page configuration must be inferred from info in the page description language (PDL) page header.
     * @type {Integer (Int32)}
     */
    static PdlContent => 1
}
