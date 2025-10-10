#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEAPPINFO structure contains information about the application that is currently running. The LINEDEVSTATUS structure can contain an array of LINEAPPINFO structures.
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-lineappinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAPPINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Size of the computer name string including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwMachineNameSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Offset from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a> structure to a string specifying the name of the computer on which the application is executing. The size of the field is specified by <b>dwMachineNameSize</b>.
     * @type {Integer}
     */
    dwMachineNameOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the user name string including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwUserNameSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Offset from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a> structure to a string specifying the user name under whose account the application is running. The size of the field is specified by <b>dwUserNameSize</b>.
     * @type {Integer}
     */
    dwUserNameOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the module file name string, in bytes.
     * @type {Integer}
     */
    dwModuleFilenameSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a> to a string specifying the module file name of the application. This string can be used in a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linehandoff">lineHandoff</a> to perform a directed handoff to the application. The size of the field is specified by <b>dwModuleFilenameSize</b>.
     * @type {Integer}
     */
    dwModuleFilenameOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Size of the display name string, in bytes.
     * @type {Integer}
     */
    dwFriendlyNameSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Offset from the beginning of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a> to the string provided by the application to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitialize">lineInitialize</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>, which should be used in any display to the user. The size of the field is specified by <b>dwFriendlyNameSize</b>.
     * @type {Integer}
     */
    dwFriendlyNameOffset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Media types for which the application has requested ownership of new calls; zero if when it opened the line <b>dwPrivileges</b> did not include LINECALLPRIVILEGE_OWNER.
     * @type {Integer}
     */
    dwMediaModes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * If the line handle was opened using LINEOPENOPTION_SINGLEADDRESS, contains the address identifier specified; set to 0xFFFFFFFF if the single address option was not used. 
     * 
     * 
     * 
     * 
     * An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @type {Integer}
     */
    dwAddressID {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
