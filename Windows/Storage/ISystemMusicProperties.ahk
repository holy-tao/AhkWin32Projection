#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ISystemMusicProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemMusicProperties
     * @type {Guid}
     */
    static IID => Guid("{b47988d5-67af-4bc3-8d39-5b89022026a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlbumArtist", "get_AlbumTitle", "get_Artist", "get_Composer", "get_Conductor", "get_DisplayArtist", "get_Genre", "get_TrackNumber"]

    /**
     * @type {HSTRING} 
     */
    AlbumArtist {
        get => this.get_AlbumArtist()
    }

    /**
     * @type {HSTRING} 
     */
    AlbumTitle {
        get => this.get_AlbumTitle()
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
    Composer {
        get => this.get_Composer()
    }

    /**
     * @type {HSTRING} 
     */
    Conductor {
        get => this.get_Conductor()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayArtist {
        get => this.get_DisplayArtist()
    }

    /**
     * @type {HSTRING} 
     */
    Genre {
        get => this.get_Genre()
    }

    /**
     * @type {HSTRING} 
     */
    TrackNumber {
        get => this.get_TrackNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlbumArtist() {
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
    get_AlbumTitle() {
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
    get_Artist() {
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
    get_Composer() {
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
    get_Conductor() {
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
    get_DisplayArtist() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Genre() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TrackNumber() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
