#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IUserDataPaths extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataPaths
     * @type {Guid}
     */
    static IID => Guid("{f9c53912-abc4-46ff-8a2b-dc9d7fa6e52f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CameraRoll", "get_Cookies", "get_Desktop", "get_Documents", "get_Downloads", "get_Favorites", "get_History", "get_InternetCache", "get_LocalAppData", "get_LocalAppDataLow", "get_Music", "get_Pictures", "get_Profile", "get_Recent", "get_RoamingAppData", "get_SavedPictures", "get_Screenshots", "get_Templates", "get_Videos"]

    /**
     * @type {HSTRING} 
     */
    CameraRoll {
        get => this.get_CameraRoll()
    }

    /**
     * @type {HSTRING} 
     */
    Cookies {
        get => this.get_Cookies()
    }

    /**
     * @type {HSTRING} 
     */
    Desktop {
        get => this.get_Desktop()
    }

    /**
     * @type {HSTRING} 
     */
    Documents {
        get => this.get_Documents()
    }

    /**
     * @type {HSTRING} 
     */
    Downloads {
        get => this.get_Downloads()
    }

    /**
     * @type {HSTRING} 
     */
    Favorites {
        get => this.get_Favorites()
    }

    /**
     * @type {HSTRING} 
     */
    History {
        get => this.get_History()
    }

    /**
     * @type {HSTRING} 
     */
    InternetCache {
        get => this.get_InternetCache()
    }

    /**
     * @type {HSTRING} 
     */
    LocalAppData {
        get => this.get_LocalAppData()
    }

    /**
     * @type {HSTRING} 
     */
    LocalAppDataLow {
        get => this.get_LocalAppDataLow()
    }

    /**
     * @type {HSTRING} 
     */
    Music {
        get => this.get_Music()
    }

    /**
     * @type {HSTRING} 
     */
    Pictures {
        get => this.get_Pictures()
    }

    /**
     * @type {HSTRING} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * @type {HSTRING} 
     */
    Recent {
        get => this.get_Recent()
    }

    /**
     * @type {HSTRING} 
     */
    RoamingAppData {
        get => this.get_RoamingAppData()
    }

    /**
     * @type {HSTRING} 
     */
    SavedPictures {
        get => this.get_SavedPictures()
    }

    /**
     * @type {HSTRING} 
     */
    Screenshots {
        get => this.get_Screenshots()
    }

    /**
     * @type {HSTRING} 
     */
    Templates {
        get => this.get_Templates()
    }

    /**
     * @type {HSTRING} 
     */
    Videos {
        get => this.get_Videos()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CameraRoll() {
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
    get_Cookies() {
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
    get_Desktop() {
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
    get_Documents() {
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
    get_Downloads() {
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
    get_Favorites() {
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
    get_History() {
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
    get_InternetCache() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalAppData() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalAppDataLow() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Music() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Pictures() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Profile() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Recent() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RoamingAppData() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SavedPictures() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Screenshots() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Templates() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Videos() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
