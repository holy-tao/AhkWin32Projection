#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides predefined error codes to represent the contexts of errors from the TPM virtual smart card manager.
 * @remarks
 * These error codes are sent from the TPM virtual smart card manager COM server to the caller through the status callback interface, <a href="https://docs.microsoft.com/windows/desktop/api/tpmvscmgr/nn-tpmvscmgr-itpmvirtualsmartcardmanagerstatuscallback">ITpmVirtualSmartCardManagerStatusCallback</a>. Status callback interface implementations must interpret the error codes based on their predefined meanings and, if applicable, load localized message strings and update the user interface.
 * @see https://learn.microsoft.com/windows/win32/api/tpmvscmgr/ne-tpmvscmgr-tpmvscmgr_error
 * @namespace Windows.Win32.Security.Tpm
 */
class TPMVSCMGR_ERROR extends Win32Enum {

    /**
     * Failed to impersonate the caller.
     * Native name: TPMVSCMGR_ERROR_IMPERSONATION
     * @type {Integer (Int32)}
     */
    static IMPERSONATION => 0

    /**
     * Ensure that your PIN/PUK meets the length or complexity requirements of your organization.
     * Native name: TPMVSCMGR_ERROR_PIN_COMPLEXITY
     * @type {Integer (Int32)}
     */
    static PIN_COMPLEXITY => 1

    /**
     * The limit of the number of smart card readers has been reached.
     * Native name: TPMVSCMGR_ERROR_READER_COUNT_LIMIT
     * @type {Integer (Int32)}
     */
    static READER_COUNT_LIMIT => 2

    /**
     * TPM virtual smart card management cannot be used within a Terminal Services session.
     * Native name: TPMVSCMGR_ERROR_TERMINAL_SERVICES_SESSION
     * @type {Integer (Int32)}
     */
    static TERMINAL_SERVICES_SESSION => 3

    /**
     * Failed to initialize the virtual smart card manager.
     * Native name: TPMVSCMGR_ERROR_VTPMSMARTCARD_INITIALIZE
     * @type {Integer (Int32)}
     */
    static VTPMSMARTCARD_INITIALIZE => 4

    /**
     * Failed to create the virtual smart card manager.
     * Native name: TPMVSCMGR_ERROR_VTPMSMARTCARD_CREATE
     * @type {Integer (Int32)}
     */
    static VTPMSMARTCARD_CREATE => 5

    /**
     * Failed to destroy the virtual smart card manager.
     * Native name: TPMVSCMGR_ERROR_VTPMSMARTCARD_DESTROY
     * @type {Integer (Int32)}
     */
    static VTPMSMARTCARD_DESTROY => 6

    /**
     * Failed to initialize the virtual smart card simulator.
     * Native name: TPMVSCMGR_ERROR_VGIDSSIMULATOR_INITIALIZE
     * @type {Integer (Int32)}
     */
    static VGIDSSIMULATOR_INITIALIZE => 7

    /**
     * Failed to create the virtual smart card simulator.
     * Native name: TPMVSCMGR_ERROR_VGIDSSIMULATOR_CREATE
     * @type {Integer (Int32)}
     */
    static VGIDSSIMULATOR_CREATE => 8

    /**
     * Failed to destroy the virtual smart card simulator.
     * Native name: TPMVSCMGR_ERROR_VGIDSSIMULATOR_DESTROY
     * @type {Integer (Int32)}
     */
    static VGIDSSIMULATOR_DESTROY => 9

    /**
     * Failed to configure the virtual smart card simulator.
     * Native name: TPMVSCMGR_ERROR_VGIDSSIMULATOR_WRITE_PROPERTY
     * @type {Integer (Int32)}
     */
    static VGIDSSIMULATOR_WRITE_PROPERTY => 10

    /**
     * Failed to find the specified virtual smart card simulator.
     * Native name: TPMVSCMGR_ERROR_VGIDSSIMULATOR_READ_PROPERTY
     * @type {Integer (Int32)}
     */
    static VGIDSSIMULATOR_READ_PROPERTY => 11

    /**
     * Failed to initialize the virtual smart card reader.
     * Native name: TPMVSCMGR_ERROR_VREADER_INITIALIZE
     * @type {Integer (Int32)}
     */
    static VREADER_INITIALIZE => 12

    /**
     * Failed to create the virtual smart card reader.
     * Native name: TPMVSCMGR_ERROR_VREADER_CREATE
     * @type {Integer (Int32)}
     */
    static VREADER_CREATE => 13

    /**
     * Failed to destroy the virtual smart card reader.
     * Native name: TPMVSCMGR_ERROR_VREADER_DESTROY
     * @type {Integer (Int32)}
     */
    static VREADER_DESTROY => 14

    /**
     * Failed to connect to the TPM smart card.
     * Native name: TPMVSCMGR_ERROR_GENERATE_LOCATE_READER
     * @type {Integer (Int32)}
     */
    static GENERATE_LOCATE_READER => 15

    /**
     * Failed to generate the file system on the TPM smart card.
     * Native name: TPMVSCMGR_ERROR_GENERATE_FILESYSTEM
     * @type {Integer (Int32)}
     */
    static GENERATE_FILESYSTEM => 16

    /**
     * Unable to create the TPM smart card.
     * Native name: TPMVSCMGR_ERROR_CARD_CREATE
     * @type {Integer (Int32)}
     */
    static CARD_CREATE => 17

    /**
     * Unable to destroy the TPM smart card.
     * Native name: TPMVSCMGR_ERROR_CARD_DESTROY
     * @type {Integer (Int32)}
     */
    static CARD_DESTROY => 18
}
