#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPlaybackList.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaBreak extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaBreak
     * @type {Guid}
     */
    static IID => Guid("{714be270-0def-4ebc-a489-6b34930e1558}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlaybackList", "get_PresentationPosition", "get_InsertionMethod", "get_CustomProperties", "get_CanStart", "put_CanStart"]

    /**
     * @type {MediaPlaybackList} 
     */
    PlaybackList {
        get => this.get_PlaybackList()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    PresentationPosition {
        get => this.get_PresentationPosition()
    }

    /**
     * @type {Integer} 
     */
    InsertionMethod {
        get => this.get_InsertionMethod()
    }

    /**
     * @type {ValueSet} 
     */
    CustomProperties {
        get => this.get_CustomProperties()
    }

    /**
     * @type {Boolean} 
     */
    CanStart {
        get => this.get_CanStart()
        set => this.put_CanStart(value)
    }

    /**
     * 
     * @returns {MediaPlaybackList} 
     */
    get_PlaybackList() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackList(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PresentationPosition() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InsertionMethod() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_CustomProperties() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanStart() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_CanStart(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
