#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides predefined error codes to represent the contexts of errors from the TPM virtual smart card manager.
 * @remarks
 * These error codes are sent from the TPM virtual smart card manager COM server to the caller through the status callback interface, <a href="https://docs.microsoft.com/windows/desktop/api/tpmvscmgr/nn-tpmvscmgr-itpmvirtualsmartcardmanagerstatuscallback">ITpmVirtualSmartCardManagerStatusCallback</a>. Status callback interface implementations must interpret the error codes based on their predefined meanings and, if applicable, load localized message strings and update the user interface.
 * @see https://learn.microsoft.com/windows/win32/api/tpmvscmgr/ne-tpmvscmgr-tpmvscmgr_error
 * @namespace Windows.Win32.Security.Tpm
 * @version v4.0.30319
 */
class TPMVSCMGR_ERROR extends Win32Enum{

    /**
     * Failed to impersonate the caller.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_IMPERSONATION => 0

    /**
     * Ensure that your PIN/PUK meets the length or complexity requirements of your organization.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_PIN_COMPLEXITY => 1

    /**
     * The limit of the number of smart card readers has been reached.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_READER_COUNT_LIMIT => 2

    /**
     * TPM virtual smart card management cannot be used within a Terminal Services session.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_TERMINAL_SERVICES_SESSION => 3

    /**
     * Failed to initialize the virtual smart card manager.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VTPMSMARTCARD_INITIALIZE => 4

    /**
     * Failed to create the virtual smart card manager.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VTPMSMARTCARD_CREATE => 5

    /**
     * Failed to destroy the virtual smart card manager.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VTPMSMARTCARD_DESTROY => 6

    /**
     * Failed to initialize the virtual smart card simulator.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VGIDSSIMULATOR_INITIALIZE => 7

    /**
     * Failed to create the virtual smart card simulator.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VGIDSSIMULATOR_CREATE => 8

    /**
     * Failed to destroy the virtual smart card simulator.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VGIDSSIMULATOR_DESTROY => 9

    /**
     * Failed to configure the virtual smart card simulator.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VGIDSSIMULATOR_WRITE_PROPERTY => 10

    /**
     * Failed to find the specified virtual smart card simulator.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VGIDSSIMULATOR_READ_PROPERTY => 11

    /**
     * Failed to initialize the virtual smart card reader.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VREADER_INITIALIZE => 12

    /**
     * Failed to create the virtual smart card reader.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VREADER_CREATE => 13

    /**
     * Failed to destroy the virtual smart card reader.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_VREADER_DESTROY => 14

    /**
     * Failed to connect to the TPM smart card.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_GENERATE_LOCATE_READER => 15

    /**
     * Failed to generate the file system on the TPM smart card.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_GENERATE_FILESYSTEM => 16

    /**
     * Unable to create the TPM smart card.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_CARD_CREATE => 17

    /**
     * Unable to destroy the TPM smart card.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_ERROR_CARD_DESTROY => 18
}
