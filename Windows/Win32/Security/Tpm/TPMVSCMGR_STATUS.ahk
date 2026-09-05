#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides predefined status codes to represent the progress of the TPM virtual smart card manager.
 * @remarks
 * These status codes are sent from the TPM virtual smart card manager COM server to the caller through the status callback interface, <a href="https://docs.microsoft.com/windows/desktop/api/tpmvscmgr/nn-tpmvscmgr-itpmvirtualsmartcardmanagerstatuscallback">ITpmVirtualSmartCardManagerStatusCallback</a>. Status callback interface implementations must interpret the status codes based on their predefined meanings and, if applicable, load localized message strings and update the user interface.
 * @see https://learn.microsoft.com/windows/win32/api/tpmvscmgr/ne-tpmvscmgr-tpmvscmgr_status
 * @namespace Windows.Win32.Security.Tpm
 */
class TPMVSCMGR_STATUS extends Win32Enum {

    /**
     * Initializing the virtual smart card 	manager.
     * Native name: TPMVSCMGR_STATUS_VTPMSMARTCARD_INITIALIZING
     * @type {Integer (Int32)}
     */
    static VTPMSMARTCARD_INITIALIZING => 0

    /**
     * Creating the virtual smart card manager.
     * Native name: TPMVSCMGR_STATUS_VTPMSMARTCARD_CREATING
     * @type {Integer (Int32)}
     */
    static VTPMSMARTCARD_CREATING => 1

    /**
     * Destroying the virtual smart card manager.
     * Native name: TPMVSCMGR_STATUS_VTPMSMARTCARD_DESTROYING
     * @type {Integer (Int32)}
     */
    static VTPMSMARTCARD_DESTROYING => 2

    /**
     * Initializing  the virtual smart card simulator.
     * Native name: TPMVSCMGR_STATUS_VGIDSSIMULATOR_INITIALIZING
     * @type {Integer (Int32)}
     */
    static VGIDSSIMULATOR_INITIALIZING => 3

    /**
     * Creating the virtual smart card simulator.
     * Native name: TPMVSCMGR_STATUS_VGIDSSIMULATOR_CREATING
     * @type {Integer (Int32)}
     */
    static VGIDSSIMULATOR_CREATING => 4

    /**
     * Destroying the virtual smart card simulator.
     * Native name: TPMVSCMGR_STATUS_VGIDSSIMULATOR_DESTROYING
     * @type {Integer (Int32)}
     */
    static VGIDSSIMULATOR_DESTROYING => 5

    /**
     * Initializing the virtual smart card reader.
     * Native name: TPMVSCMGR_STATUS_VREADER_INITIALIZING
     * @type {Integer (Int32)}
     */
    static VREADER_INITIALIZING => 6

    /**
     * Creating the virtual smart card reader.
     * Native name: TPMVSCMGR_STATUS_VREADER_CREATING
     * @type {Integer (Int32)}
     */
    static VREADER_CREATING => 7

    /**
     * Destroying the virtual smart card reader.
     * Native name: TPMVSCMGR_STATUS_VREADER_DESTROYING
     * @type {Integer (Int32)}
     */
    static VREADER_DESTROYING => 8

    /**
     * Waiting for the TPM smart card device.
     * Native name: TPMVSCMGR_STATUS_GENERATE_WAITING
     * @type {Integer (Int32)}
     */
    static GENERATE_WAITING => 9

    /**
     * Authenticating to the TPM smart card.
     * Native name: TPMVSCMGR_STATUS_GENERATE_AUTHENTICATING
     * @type {Integer (Int32)}
     */
    static GENERATE_AUTHENTICATING => 10

    /**
     * Generating the file system on the TPM smart card.
     * Native name: TPMVSCMGR_STATUS_GENERATE_RUNNING
     * @type {Integer (Int32)}
     */
    static GENERATE_RUNNING => 11

    /**
     * Creation of the TPM smart card  is complete.
     * Native name: TPMVSCMGR_STATUS_CARD_CREATED
     * @type {Integer (Int32)}
     */
    static CARD_CREATED => 12

    /**
     * Destruction of the TPM smart card is complete.
     * Native name: TPMVSCMGR_STATUS_CARD_DESTROYED
     * @type {Integer (Int32)}
     */
    static CARD_DESTROYED => 13
}
