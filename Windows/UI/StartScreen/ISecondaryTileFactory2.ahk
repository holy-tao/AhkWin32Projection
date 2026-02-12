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
class ISecondaryTileFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryTileFactory2
     * @type {Guid}
     */
    static IID => Guid("{274b8a3b-522d-448e-9eb2-d0672ab345c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMinimalTile"]

    /**
     * 
     * @param {HSTRING} tileId 
     * @param {HSTRING} displayName 
     * @param {HSTRING} arguments 
     * @param {Uri} square150x150Logo 
     * @param {Integer} desiredSize 
     * @returns {SecondaryTile} 
     */
    CreateMinimalTile(tileId, displayName, arguments, square150x150Logo, desiredSize) {
        if(tileId is String) {
            pin := HSTRING.Create(tileId)
            tileId := pin.Value
        }
        tileId := tileId is Win32Handle ? NumGet(tileId, "ptr") : tileId
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

        result := ComCall(6, this, "ptr", tileId, "ptr", displayName, "ptr", arguments, "ptr", square150x150Logo, "int", desiredSize, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SecondaryTile(value)
    }
}
