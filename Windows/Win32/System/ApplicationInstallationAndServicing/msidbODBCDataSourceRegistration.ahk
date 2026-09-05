#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbODBCDataSourceRegistration extends Win32Enum {

    /**
     * Native name: msidbODBCDataSourceRegistrationPerMachine
     * @type {Integer (Int32)}
     */
    static PerMachine => 0

    /**
     * Native name: msidbODBCDataSourceRegistrationPerUser
     * @type {Integer (Int32)}
     */
    static PerUser => 1
}
