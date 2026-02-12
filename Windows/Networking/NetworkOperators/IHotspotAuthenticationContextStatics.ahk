#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IHotspotAuthenticationContextStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHotspotAuthenticationContextStatics
     * @type {Guid}
     */
    static IID => Guid("{e756c791-1002-4de5-83c7-de61d88831d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetAuthenticationContext"]

    /**
     * 
     * @param {HSTRING} evenToken 
     * @param {Pointer<HotspotAuthenticationContext>} context_ 
     * @returns {Boolean} 
     */
    TryGetAuthenticationContext(evenToken, context_) {
        if(evenToken is String) {
            pin := HSTRING.Create(evenToken)
            evenToken := pin.Value
        }
        evenToken := evenToken is Win32Handle ? NumGet(evenToken, "ptr") : evenToken

        result := ComCall(6, this, "ptr", evenToken, "ptr", context_, "int*", &isValid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isValid
    }
}
