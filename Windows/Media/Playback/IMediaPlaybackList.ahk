#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\IObservableVector.ahk
#Include .\MediaPlaybackItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackList
     * @type {Guid}
     */
    static IID => Guid("{7f77ee9c-dc42-4e26-a98d-7850df8ec925}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ItemFailed", "remove_ItemFailed", "add_CurrentItemChanged", "remove_CurrentItemChanged", "add_ItemOpened", "remove_ItemOpened", "get_Items", "get_AutoRepeatEnabled", "put_AutoRepeatEnabled", "get_ShuffleEnabled", "put_ShuffleEnabled", "get_CurrentItem", "get_CurrentItemIndex", "MoveNext", "MovePrevious", "MoveTo"]

    /**
     * @type {IObservableVector<MediaPlaybackItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * @type {Boolean} 
     */
    AutoRepeatEnabled {
        get => this.get_AutoRepeatEnabled()
        set => this.put_AutoRepeatEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    ShuffleEnabled {
        get => this.get_ShuffleEnabled()
        set => this.put_ShuffleEnabled(value)
    }

    /**
     * @type {MediaPlaybackItem} 
     */
    CurrentItem {
        get => this.get_CurrentItem()
    }

    /**
     * @type {Integer} 
     */
    CurrentItemIndex {
        get => this.get_CurrentItemIndex()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackList, MediaPlaybackItemFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemFailed(handler) {
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
    remove_ItemFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackList, CurrentMediaPlaybackItemChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentItemChanged(handler) {
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
    remove_CurrentItemChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackList, MediaPlaybackItemOpenedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemOpened(handler) {
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
    remove_ItemOpened(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IObservableVector<MediaPlaybackItem>} 
     */
    get_Items() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(MediaPlaybackItem, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoRepeatEnabled() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoRepeatEnabled(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShuffleEnabled() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShuffleEnabled(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_CurrentItem() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentItemIndex() {
        result := ComCall(18, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    MoveNext() {
        result := ComCall(19, this, "ptr*", &item := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(item)
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    MovePrevious() {
        result := ComCall(20, this, "ptr*", &item := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(item)
    }

    /**
     * Contains the x - and y -coordinates of the first vertex of a shape, or represents the x - and y -coordinates of the first vertex after a break in a path.
     * @remarks
     * The **MoveTo** row contains the  *x*  - and  *y*  -coordinates of the first vertex for the shape if the **MoveTo** row is the first row in the section. Usually this is the first vertex placed when the shape was drawn, and it does not necessarily correspond to the begin point of a 1-D shape. 
     *   
     * A geometry section must begin with either a **RelMoveTo** or a **MoveTo** row, but you can also use the **MoveTo** and **RelMoveTo** rows to represent a gap in the stroking of a shape's path. However, when the path is used to define the boundary of a filled region, this gap is interpreted as a straight line segment. To insert such a gap, insert a row between two rows and change the row type to **MoveTo**. If the **MoveTo** row is between two rows, it contains the  *x*  - and  *y*  -coordinates of the first vertex of the line after the break in the shape's path.
     * @param {Integer} itemIndex 
     * @returns {MediaPlaybackItem} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/moveto-row-geometry-section
     */
    MoveTo(itemIndex) {
        result := ComCall(21, this, "uint", itemIndex, "ptr*", &item := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(item)
    }
}
