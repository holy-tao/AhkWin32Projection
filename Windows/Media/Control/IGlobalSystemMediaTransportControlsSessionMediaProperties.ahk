#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class IGlobalSystemMediaTransportControlsSessionMediaProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGlobalSystemMediaTransportControlsSessionMediaProperties
     * @type {Guid}
     */
    static IID => Guid("{68856cf6-adb4-54b2-ac16-05837907acb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Title", "get_Subtitle", "get_AlbumArtist", "get_Artist", "get_AlbumTitle", "get_TrackNumber", "get_Genres", "get_AlbumTrackCount", "get_PlaybackType", "get_Thumbnail"]

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {HSTRING} 
     */
    Subtitle {
        get => this.get_Subtitle()
    }

    /**
     * @type {HSTRING} 
     */
    AlbumArtist {
        get => this.get_AlbumArtist()
    }

    /**
     * @type {HSTRING} 
     */
    Artist {
        get => this.get_Artist()
    }

    /**
     * @type {HSTRING} 
     */
    AlbumTitle {
        get => this.get_AlbumTitle()
    }

    /**
     * @type {Integer} 
     */
    TrackNumber {
        get => this.get_TrackNumber()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Genres {
        get => this.get_Genres()
    }

    /**
     * @type {Integer} 
     */
    AlbumTrackCount {
        get => this.get_AlbumTrackCount()
    }

    /**
     * @type {IReference<Integer>} 
     */
    PlaybackType {
        get => this.get_PlaybackType()
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtitle() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlbumArtist() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Artist() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlbumTitle() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrackNumber() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Genres() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlbumTrackCount() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PlaybackType() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }
}
