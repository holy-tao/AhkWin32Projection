#Requires AutoHotkey v2.0.0 64-bit

/**
 * Provides predefined status codes to represent the progress of the TPM virtual smart card manager.
 * @remarks
 * These status codes are sent from the TPM virtual smart card manager COM server to the caller through the status callback interface, <a href="https://docs.microsoft.com/windows/desktop/api/tpmvscmgr/nn-tpmvscmgr-itpmvirtualsmartcardmanagerstatuscallback">ITpmVirtualSmartCardManagerStatusCallback</a>. Status callback interface implementations must interpret the status codes based on their predefined meanings and, if applicable, load localized message strings and update the user interface.
 * @see https://learn.microsoft.com/windows/win32/api/tpmvscmgr/ne-tpmvscmgr-tpmvscmgr_status
 * @namespace Windows.Win32.Security.Tpm
 * @version v4.0.30319
 */
class TPMVSCMGR_STATUS{

    /**
     * Initializing the virtual smart card 	manager.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_VTPMSMARTCARD_INITIALIZING => 0

    /**
     * Creating the virtual smart card manager.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_VTPMSMARTCARD_CREATING => 1

    /**
     * Destroying the virtual smart card manager.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_VTPMSMARTCARD_DESTROYING => 2

    /**
     * Initializing  the virtual smart card simulator.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_VGIDSSIMULATOR_INITIALIZING => 3

    /**
     * Creating the virtual smart card simulator.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_VGIDSSIMULATOR_CREATING => 4

    /**
     * Destroying the virtual smart card simulator.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_VGIDSSIMULATOR_DESTROYING => 5

    /**
     * Initializing the virtual smart card reader.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_VREADER_INITIALIZING => 6

    /**
     * Creating the virtual smart card reader.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_VREADER_CREATING => 7

    /**
     * Destroying the virtual smart card reader.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_VREADER_DESTROYING => 8

    /**
     * Waiting for the TPM smart card device.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_GENERATE_WAITING => 9

    /**
     * Authenticating to the TPM smart card.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_GENERATE_AUTHENTICATING => 10

    /**
     * Generating the file system on the TPM smart card.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_GENERATE_RUNNING => 11

    /**
     * Creation of the TPM smart card  is complete.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_CARD_CREATED => 12

    /**
     * Destruction of the TPM smart card is complete.
     * @type {Integer (Int32)}
     */
    static TPMVSCMGR_STATUS_CARD_DESTROYED => 13
}
