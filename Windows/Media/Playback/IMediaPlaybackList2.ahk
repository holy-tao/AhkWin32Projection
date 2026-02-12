#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\MediaPlaybackItem.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackList2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackList2
     * @type {Guid}
     */
    static IID => Guid("{0e09b478-600a-4274-a14b-0b6723d0f48b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxPrefetchTime", "put_MaxPrefetchTime", "get_StartingItem", "put_StartingItem", "get_ShuffledItems", "SetShuffledItems"]

    /**
     * @type {IReference<TimeSpan>} 
     */
    MaxPrefetchTime {
        get => this.get_MaxPrefetchTime()
        set => this.put_MaxPrefetchTime(value)
    }

    /**
     * @type {MediaPlaybackItem} 
     */
    StartingItem {
        get => this.get_StartingItem()
        set => this.put_StartingItem(value)
    }

    /**
     * @type {IVectorView<MediaPlaybackItem>} 
     */
    ShuffledItems {
        get => this.get_ShuffledItems()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_MaxPrefetchTime() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_MaxPrefetchTime(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_StartingItem() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(value)
    }

    /**
     * 
     * @param {MediaPlaybackItem} value 
     * @returns {HRESULT} 
     */
    put_StartingItem(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<MediaPlaybackItem>} 
     */
    get_ShuffledItems() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MediaPlaybackItem, value)
    }

    /**
     * 
     * @param {IIterable<MediaPlaybackItem>} value 
     * @returns {HRESULT} 
     */
    SetShuffledItems(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
