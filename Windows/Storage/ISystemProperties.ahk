#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\SystemAudioProperties.ahk
#Include .\SystemGPSProperties.ahk
#Include .\SystemMediaProperties.ahk
#Include .\SystemMusicProperties.ahk
#Include .\SystemPhotoProperties.ahk
#Include .\SystemVideoProperties.ahk
#Include .\SystemImageProperties.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ISystemProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemProperties
     * @type {Guid}
     */
    static IID => Guid("{917a71c1-85f3-4dd1-b001-a50bfd21c8d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Author", "get_Comment", "get_ItemNameDisplay", "get_Keywords", "get_Rating", "get_Title", "get_Audio", "get_GPS", "get_Media", "get_Music", "get_Photo", "get_Video", "get_Image"]

    /**
     * @type {HSTRING} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
    }

    /**
     * @type {HSTRING} 
     */
    ItemNameDisplay {
        get => this.get_ItemNameDisplay()
    }

    /**
     * @type {HSTRING} 
     */
    Keywords {
        get => this.get_Keywords()
    }

    /**
     * @type {HSTRING} 
     */
    Rating {
        get => this.get_Rating()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {SystemAudioProperties} 
     */
    Audio {
        get => this.get_Audio()
    }

    /**
     * @type {SystemGPSProperties} 
     */
    GPS {
        get => this.get_GPS()
    }

    /**
     * @type {SystemMediaProperties} 
     */
    Media {
        get => this.get_Media()
    }

    /**
     * @type {SystemMusicProperties} 
     */
    Music {
        get => this.get_Music()
    }

    /**
     * @type {SystemPhotoProperties} 
     */
    Photo {
        get => this.get_Photo()
    }

    /**
     * @type {SystemVideoProperties} 
     */
    Video {
        get => this.get_Video()
    }

    /**
     * @type {SystemImageProperties} 
     */
    Image {
        get => this.get_Image()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Author() {
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
    get_Comment() {
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
    get_ItemNameDisplay() {
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
    get_Keywords() {
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
    get_Rating() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SystemAudioProperties} 
     */
    get_Audio() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemAudioProperties(value)
    }

    /**
     * 
     * @returns {SystemGPSProperties} 
     */
    get_GPS() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemGPSProperties(value)
    }

    /**
     * 
     * @returns {SystemMediaProperties} 
     */
    get_Media() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemMediaProperties(value)
    }

    /**
     * 
     * @returns {SystemMusicProperties} 
     */
    get_Music() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemMusicProperties(value)
    }

    /**
     * 
     * @returns {SystemPhotoProperties} 
     */
    get_Photo() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemPhotoProperties(value)
    }

    /**
     * 
     * @returns {SystemVideoProperties} 
     */
    get_Video() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemVideoProperties(value)
    }

    /**
     * 
     * @returns {SystemImageProperties} 
     */
    get_Image() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemImageProperties(value)
    }
}
