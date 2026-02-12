#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmartCard.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ICardRemovedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICardRemovedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{15331aaf-22d7-4945-afc9-03b46f42a6cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SmartCard"]

    /**
     * @type {SmartCard} 
     */
    SmartCard {
        get => this.get_SmartCard()
    }

    /**
     * 
     * @returns {SmartCard} 
     */
    get_SmartCard() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCard(value)
    }
}
