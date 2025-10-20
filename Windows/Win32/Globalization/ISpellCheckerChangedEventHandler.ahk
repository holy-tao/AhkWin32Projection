#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Allows the caller to create a handler for notifications that the state of the speller has changed.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nn-spellcheck-ispellcheckerchangedeventhandler
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ISpellCheckerChangedEventHandler extends IUnknown{
    /**
     * The interface identifier for ISpellCheckerChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{0b83a5b0-792f-4eab-9799-acf52c5ed08a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISpellChecker>} sender 
     * @returns {HRESULT} 
     */
    Invoke(sender) {
        result := ComCall(3, this, "ptr", sender, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
