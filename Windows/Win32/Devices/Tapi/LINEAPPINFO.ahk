#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEAPPINFO structure contains information about the application that is currently running. The LINEDEVSTATUS structure can contain an array of LINEAPPINFO structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineappinfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAPPINFO {
    #StructPack 4

    /**
     * Size of the computer name string including the <b>null</b> terminator, in bytes.
     */
    dwMachineNameSize : UInt32

    /**
     * Offset from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a> structure to a string specifying the name of the computer on which the application is executing. The size of the field is specified by <b>dwMachineNameSize</b>.
     */
    dwMachineNameOffset : UInt32

    /**
     * Size of the user name string including the <b>null</b> terminator, in bytes.
     */
    dwUserNameSize : UInt32

    /**
     * Offset from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a> structure to a string specifying the user name under whose account the application is running. The size of the field is specified by <b>dwUserNameSize</b>.
     */
    dwUserNameOffset : UInt32

    /**
     * Size of the module file name string, in bytes.
     */
    dwModuleFilenameSize : UInt32

    /**
     * Offset from the beginning of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a> to a string specifying the module file name of the application. This string can be used in a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linehandoff">lineHandoff</a> to perform a directed handoff to the application. The size of the field is specified by <b>dwModuleFilenameSize</b>.
     */
    dwModuleFilenameOffset : UInt32

    /**
     * Size of the display name string, in bytes.
     */
    dwFriendlyNameSize : UInt32

    /**
     * Offset from the beginning of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a> to the string provided by the application to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitialize">lineInitialize</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>, which should be used in any display to the user. The size of the field is specified by <b>dwFriendlyNameSize</b>.
     */
    dwFriendlyNameOffset : UInt32

    /**
     * Media types for which the application has requested ownership of new calls; zero if when it opened the line <b>dwPrivileges</b> did not include LINECALLPRIVILEGE_OWNER.
     */
    dwMediaModes : UInt32

    /**
     * If the line handle was opened using LINEOPENOPTION_SINGLEADDRESS, contains the address identifier specified; set to 0xFFFFFFFF if the single address option was not used. 
     * 
     * 
     * 
     * 
     * An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     */
    dwAddressID : UInt32

}
