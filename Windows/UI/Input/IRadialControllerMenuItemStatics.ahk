#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RadialControllerMenuItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IRadialControllerMenuItemStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerMenuItemStatics
     * @type {Guid}
     */
    static IID => Guid("{249e0887-d842-4524-9df8-e0d647edc887}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromIcon", "CreateFromKnownIcon"]

    /**
     * 
     * @param {HSTRING} displayText 
     * @param {RandomAccessStreamReference} icon 
     * @returns {RadialControllerMenuItem} 
     */
    CreateFromIcon(displayText, icon) {
        if(displayText is String) {
            pin := HSTRING.Create(displayText)
            displayText := pin.Value
        }
        displayText := displayText is Win32Handle ? NumGet(displayText, "ptr") : displayText

        result := ComCall(6, this, "ptr", displayText, "ptr", icon, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RadialControllerMenuItem(result_)
    }

    /**
     * 
     * @param {HSTRING} displayText 
     * @param {Integer} value 
     * @returns {RadialControllerMenuItem} 
     */
    CreateFromKnownIcon(displayText, value) {
        if(displayText is String) {
            pin := HSTRING.Create(displayText)
            displayText := pin.Value
        }
        displayText := displayText is Win32Handle ? NumGet(displayText, "ptr") : displayText

        result := ComCall(7, this, "ptr", displayText, "int", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RadialControllerMenuItem(result_)
    }
}
