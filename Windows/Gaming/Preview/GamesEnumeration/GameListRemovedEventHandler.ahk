#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Returns the identifier of [GameListEntry](gamelistentry.md) that was removed from the [GameList](gamelist.md)
 * @remarks
 * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistremovedeventhandler
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class GameListRemovedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for GameListRemovedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{10c5648f-6c8f-4712-9b38-474bc22e76d8}")

    /**
     * The class identifier for GameListRemovedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{10c5648f-6c8f-4712-9b38-474bc22e76d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HSTRING} identifier 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(identifier) {
        if(identifier is String) {
            pin := HSTRING.Create(identifier)
            identifier := pin.Value
        }
        identifier := identifier is Win32Handle ? NumGet(identifier, "ptr") : identifier

        result := ComCall(3, this, "ptr", identifier, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
