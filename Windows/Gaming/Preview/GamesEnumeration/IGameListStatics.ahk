#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GameListEntry.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class IGameListStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameListStatics
     * @type {Guid}
     */
    static IID => Guid("{2ddd0f6f-9c66-4b05-945c-d6ed78491b8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAllAsync", "FindAllAsyncPackageFamilyName", "add_GameAdded", "remove_GameAdded", "add_GameRemoved", "remove_GameRemoved", "add_GameUpdated", "remove_GameUpdated"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<GameListEntry>>} 
     */
    FindAllAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, GameListEntry), operation)
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperation<IVectorView<GameListEntry>>} 
     */
    FindAllAsyncPackageFamilyName(packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(7, this, "ptr", packageFamilyName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, GameListEntry), operation)
    }

    /**
     * 
     * @param {GameListChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GameAdded(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GameAdded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {GameListRemovedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GameRemoved(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GameRemoved(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {GameListChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GameUpdated(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GameUpdated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
