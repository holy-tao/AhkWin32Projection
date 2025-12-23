#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorValidatorModuleType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeMin => 1

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypePE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeObj => 2

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeEnc => 3

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeIncr => 4

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeMax => 4
}
