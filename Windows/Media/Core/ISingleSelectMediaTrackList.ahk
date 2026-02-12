#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a media track list that allows a single item to be selected at a time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.isingleselectmediatracklist
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ISingleSelectMediaTrackList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISingleSelectMediaTrackList
     * @type {Guid}
     */
    static IID => Guid("{77206f1f-c34f-494f-8077-2bad9ff4ecf1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_SelectedIndexChanged", "remove_SelectedIndexChanged", "put_SelectedIndex", "get_SelectedIndex"]

    /**
     * Gets or set the currently selected media track in the list.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.isingleselectmediatracklist.selectedindex
     * @type {Integer} 
     */
    SelectedIndex {
        get => this.get_SelectedIndex()
        set => this.put_SelectedIndex(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ISingleSelectMediaTrackList, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectedIndexChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_SelectedIndexChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedIndex(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedIndex() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
