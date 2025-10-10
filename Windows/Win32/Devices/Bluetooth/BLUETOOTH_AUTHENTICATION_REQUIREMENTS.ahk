#Requires AutoHotkey v2.0.0 64-bit

/**
 * BLUETOOTH_AUTHENTICATION_REQUIREMENTS enumeration specifies the 'Man in the Middle' protection required for authentication.
 * @remarks
 * 
  * The header file associated with this API is available at Microsoft Connect via the Windows Vista Feature Pack for Wireless Developers Supplement download. Access to this resource requires registration with the Microsoft Connect website. The header is also included in the comprehensive developer resource packages available via the Windows Driver Kit (WDK), Windows Logo Kit (WLK) and Windows Driver Framework (WDF) Connections at Microsoft Connect.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/ne-bluetoothapis-bluetooth_authentication_requirements
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_AUTHENTICATION_REQUIREMENTS{

    /**
     * Protection against a "Man in the Middle" attack is not required for authentication.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_MITM_ProtectionNotRequired => 0

    /**
     * Protection against a "Man in the Middle" attack is required for authentication.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_MITM_ProtectionRequired => 1

    /**
     * Protection against a "Man in the Middle" attack is not required for bonding.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_MITM_ProtectionNotRequiredBonding => 2

    /**
     * Protection against a "Man in the Middle" attack is required for bonding.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_MITM_ProtectionRequiredBonding => 3

    /**
     * Protection against a "Man in the Middle" attack is not required for General Bonding.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_MITM_ProtectionNotRequiredGeneralBonding => 4

    /**
     * Protection against a "Man in the Middle" attack is required for General Bonding.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_MITM_ProtectionRequiredGeneralBonding => 5

    /**
     * Protection against "Man in the Middle" attack is not defined.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_MITM_ProtectionNotDefined => 255
}
