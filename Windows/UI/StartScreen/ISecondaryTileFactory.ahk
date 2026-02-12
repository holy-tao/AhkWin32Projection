#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SecondaryTile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class ISecondaryTileFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryTileFactory
     * @type {Guid}
     */
    static IID => Guid("{57f52ca0-51bc-4abf-8ebf-627a0398b05a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTile", "CreateWideTile", "CreateWithId"]

    /**
     * 
     * @param {HSTRING} tileId 
     * @param {HSTRING} shortName 
     * @param {HSTRING} displayName 
     * @param {HSTRING} arguments 
     * @param {Integer} tileOptions_ 
     * @param {Uri} logoReference 
     * @returns {SecondaryTile} 
     */
    CreateTile(tileId, shortName, displayName, arguments, tileOptions_, logoReference) {
        if(tileId is String) {
            pin := HSTRING.Create(tileId)
            tileId := pin.Value
        }
        tileId := tileId is Win32Handle ? NumGet(tileId, "ptr") : tileId
        if(shortName is String) {
            pin := HSTRING.Create(shortName)
            shortName := pin.Value
        }
        shortName := shortName is Win32Handle ? NumGet(shortName, "ptr") : shortName
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName
        if(arguments is String) {
            pin := HSTRING.Create(arguments)
            arguments := pin.Value
        }
        arguments := arguments is Win32Handle ? NumGet(arguments, "ptr") : arguments

        result := ComCall(6, this, "ptr", tileId, "ptr", shortName, "ptr", displayName, "ptr", arguments, "uint", tileOptions_, "ptr", logoReference, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SecondaryTile(value)
    }

    /**
     * 
     * @param {HSTRING} tileId 
     * @param {HSTRING} shortName 
     * @param {HSTRING} displayName 
     * @param {HSTRING} arguments 
     * @param {Integer} tileOptions_ 
     * @param {Uri} logoReference 
     * @param {Uri} wideLogoReference 
     * @returns {SecondaryTile} 
     */
    CreateWideTile(tileId, shortName, displayName, arguments, tileOptions_, logoReference, wideLogoReference) {
        if(tileId is String) {
            pin := HSTRING.Create(tileId)
            tileId := pin.Value
        }
        tileId := tileId is Win32Handle ? NumGet(tileId, "ptr") : tileId
        if(shortName is String) {
            pin := HSTRING.Create(shortName)
            shortName := pin.Value
        }
        shortName := shortName is Win32Handle ? NumGet(shortName, "ptr") : shortName
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName
        if(arguments is String) {
            pin := HSTRING.Create(arguments)
            arguments := pin.Value
        }
        arguments := arguments is Win32Handle ? NumGet(arguments, "ptr") : arguments

        result := ComCall(7, this, "ptr", tileId, "ptr", shortName, "ptr", displayName, "ptr", arguments, "uint", tileOptions_, "ptr", logoReference, "ptr", wideLogoReference, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SecondaryTile(value)
    }

    /**
     * 
     * @param {HSTRING} tileId 
     * @returns {SecondaryTile} 
     */
    CreateWithId(tileId) {
        if(tileId is String) {
            pin := HSTRING.Create(tileId)
            tileId := pin.Value
        }
        tileId := tileId is Win32Handle ? NumGet(tileId, "ptr") : tileId

        result := ComCall(8, this, "ptr", tileId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SecondaryTile(value)
    }
}
