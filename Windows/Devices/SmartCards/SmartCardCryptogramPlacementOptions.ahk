#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines cryptogram placement options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementoptions
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramPlacementOptions extends Win32BitflagEnum{

    /**
     * The placement option does not have a defined format.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The [CryptogramOffset](smartcardcryptogramplacementstep_cryptogramoffset.md), [TemplateOffset](smartcardcryptogramplacementstep_templateoffset.md), and [CryptogramLength](smartcardcryptogramplacementstep_cryptogramlength.md) values are in nibbles and not bytes.
     * @type {Integer (UInt32)}
     */
    static UnitsAreInNibbles => 1

    /**
     * The placement step's output should be chained into the specified step.
     * @type {Integer (UInt32)}
     */
    static ChainOutput => 2
}
