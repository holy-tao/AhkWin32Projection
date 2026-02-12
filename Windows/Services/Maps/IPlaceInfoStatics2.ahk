#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PlaceInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IPlaceInfoStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaceInfoStatics2
     * @type {Guid}
     */
    static IID => Guid("{730f0249-4047-44a3-8f81-2550a5216370}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromAddress", "CreateFromAddressWithName"]

    /**
     * 
     * @param {HSTRING} displayAddress 
     * @returns {PlaceInfo} 
     */
    CreateFromAddress(displayAddress) {
        if(displayAddress is String) {
            pin := HSTRING.Create(displayAddress)
            displayAddress := pin.Value
        }
        displayAddress := displayAddress is Win32Handle ? NumGet(displayAddress, "ptr") : displayAddress

        result := ComCall(6, this, "ptr", displayAddress, "ptr*", &resultValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaceInfo(resultValue)
    }

    /**
     * 
     * @param {HSTRING} displayAddress 
     * @param {HSTRING} displayName 
     * @returns {PlaceInfo} 
     */
    CreateFromAddressWithName(displayAddress, displayName) {
        if(displayAddress is String) {
            pin := HSTRING.Create(displayAddress)
            displayAddress := pin.Value
        }
        displayAddress := displayAddress is Win32Handle ? NumGet(displayAddress, "ptr") : displayAddress
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(7, this, "ptr", displayAddress, "ptr", displayName, "ptr*", &resultValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaceInfo(resultValue)
    }
}
