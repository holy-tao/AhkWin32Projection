#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IAdaptiveCard.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to methods that build Adaptive Cards for use on Windows.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.iadaptivecardbuilderstatics
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class IAdaptiveCardBuilderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveCardBuilderStatics
     * @type {Guid}
     */
    static IID => Guid("{766d8f08-d3fe-4347-a0bc-b9ea9a6dc28e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAdaptiveCardFromJson"]

    /**
     * Creates a new instance of [IAdaptiveCard](iadaptivecard.md) using the specified Adaptive Card JSON. For more information, see [Get Started with Adaptive Cards](https://adaptivecards.io/documentation/#create-GettingStarted).
     * @param {HSTRING} value A String representation of the JSON that describes the Adaptive Card to create.
     * @returns {IAdaptiveCard} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.iadaptivecardbuilderstatics.createadaptivecardfromjson
     */
    CreateAdaptiveCardFromJson(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAdaptiveCard(result_)
    }
}
