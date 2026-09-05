#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class CorValidatorModuleType extends Win32Enum {

    /**
     * Native name: ValidatorModuleTypeInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Native name: ValidatorModuleTypeMin
     * @type {Integer (Int32)}
     */
    static Min => 1

    /**
     * Native name: ValidatorModuleTypePE
     * @type {Integer (Int32)}
     */
    static TypePE => 1

    /**
     * Native name: ValidatorModuleTypeObj
     * @type {Integer (Int32)}
     */
    static Obj => 2

    /**
     * Native name: ValidatorModuleTypeEnc
     * @type {Integer (Int32)}
     */
    static Enc => 3

    /**
     * Native name: ValidatorModuleTypeIncr
     * @type {Integer (Int32)}
     */
    static Incr => 4

    /**
     * Native name: ValidatorModuleTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
