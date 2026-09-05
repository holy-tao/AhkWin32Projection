#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The INSTALLLEVEL property is the initial level at which features are selected &\#0034;ON&\#0034; for installation by default.
 * @remarks
 * The installation level specified by the **INSTALLLEVEL** property can be overridden by the following properties:
 * 
 * -   [**ADDLOCAL**](addlocal.md)
 * -   [**ADDSOURCE**](addsource.md)
 * -   [**ADDDEFAULT**](adddefault.md)
 * -   [**COMPADDLOCAL**](compaddlocal.md)
 * -   [**COMPADDSOURCE**](compaddsource.md)
 * -   [**FILEADDLOCAL**](fileaddlocal.md)
 * -   [**FILEADDSOURCE**](fileaddsource.md)
 * -   [**REMOVE**](remove.md)
 * -   [**REINSTALL**](reinstall.md)
 * -   [**ADVERTISE**](advertise.md)
 * 
 * For example, setting ADDLOCAL=ALL installs all features locally regardless of the value of the **INSTALLLEVEL** property. If the value of the Level column in the [Feature table](feature-table.md) is 0, that feature is not installed and not displayed in the UI.
 * 
 * An administrator can permanently disable a feature by applying a customization transform that sets a 0 in the Level column for that feature. The application of the customization transform prevents the installation and display of the feature even if the user selects a complete installation using the UI or by setting ADDLOCAL to ALL on the command line. See [A Customization Transform Example](a-customization-transform-example.md).
 * @see https://learn.microsoft.com/windows/win32/Msi/installlevel
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class INSTALLLEVEL extends Win32Enum {

    /**
     * Native name: INSTALLLEVEL_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: INSTALLLEVEL_MINIMUM
     * @type {Integer (Int32)}
     */
    static MINIMUM => 1

    /**
     * Native name: INSTALLLEVEL_MAXIMUM
     * @type {Integer (Int32)}
     */
    static MAXIMUM => 65535
}
