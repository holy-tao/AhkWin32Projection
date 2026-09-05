#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * BLUETOOTH_AUTHENTICATION_REQUIREMENTS enumeration specifies the 'Man in the Middle' protection required for authentication.
 * @remarks
 * The header file associated with this API is available at Microsoft Connect via the Windows Vista Feature Pack for Wireless Developers Supplement download. Access to this resource requires registration with the Microsoft Connect website. The header is also included in the comprehensive developer resource packages available via the Windows Driver Kit (WDK), Windows Logo Kit (WLK) and Windows Driver Framework (WDF) Connections at Microsoft Connect.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_authentication_requirements
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class BLUETOOTH_AUTHENTICATION_REQUIREMENTS extends Win32Enum {

    /**
     * Protection against a "Man in the Middle" attack is not required for authentication.
     * Native name: BLUETOOTH_MITM_ProtectionNotRequired
     * @type {Integer (Int32)}
     */
    static MITM_ProtectionNotRequired => 0

    /**
     * Protection against a "Man in the Middle" attack is required for authentication.
     * Native name: BLUETOOTH_MITM_ProtectionRequired
     * @type {Integer (Int32)}
     */
    static MITM_ProtectionRequired => 1

    /**
     * Protection against a "Man in the Middle" attack is not required for bonding.
     * Native name: BLUETOOTH_MITM_ProtectionNotRequiredBonding
     * @type {Integer (Int32)}
     */
    static MITM_ProtectionNotRequiredBonding => 2

    /**
     * Protection against a "Man in the Middle" attack is required for bonding.
     * Native name: BLUETOOTH_MITM_ProtectionRequiredBonding
     * @type {Integer (Int32)}
     */
    static MITM_ProtectionRequiredBonding => 3

    /**
     * Protection against a "Man in the Middle" attack is not required for General Bonding.
     * Native name: BLUETOOTH_MITM_ProtectionNotRequiredGeneralBonding
     * @type {Integer (Int32)}
     */
    static MITM_ProtectionNotRequiredGeneralBonding => 4

    /**
     * Protection against a "Man in the Middle" attack is required for General Bonding.
     * Native name: BLUETOOTH_MITM_ProtectionRequiredGeneralBonding
     * @type {Integer (Int32)}
     */
    static MITM_ProtectionRequiredGeneralBonding => 5

    /**
     * Protection against "Man in the Middle" attack is not defined.
     * Native name: BLUETOOTH_MITM_ProtectionNotDefined
     * @type {Integer (Int32)}
     */
    static MITM_ProtectionNotDefined => 255
}
