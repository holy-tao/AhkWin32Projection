#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IHotspotAuthenticationEventDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHotspotAuthenticationEventDetails
     * @type {Guid}
     */
    static IID => Guid("{e756c791-1001-4de5-83c7-de61d88831d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventToken"]

    /**
     * @type {HSTRING} 
     */
    EventToken {
        get => this.get_EventToken()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EventToken() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
