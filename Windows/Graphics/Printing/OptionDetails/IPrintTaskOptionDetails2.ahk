#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PrintCustomToggleOptionDetails.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class IPrintTaskOptionDetails2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskOptionDetails2
     * @type {Guid}
     */
    static IID => Guid("{53730a09-f968-4692-a177-c074597186db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateToggleOption"]

    /**
     * 
     * @param {HSTRING} optionId 
     * @param {HSTRING} displayName 
     * @returns {PrintCustomToggleOptionDetails} 
     */
    CreateToggleOption(optionId, displayName) {
        if(optionId is String) {
            pin := HSTRING.Create(optionId)
            optionId := pin.Value
        }
        optionId := optionId is Win32Handle ? NumGet(optionId, "ptr") : optionId
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(6, this, "ptr", optionId, "ptr", displayName, "ptr*", &toggleOption := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintCustomToggleOptionDetails(toggleOption)
    }
}
