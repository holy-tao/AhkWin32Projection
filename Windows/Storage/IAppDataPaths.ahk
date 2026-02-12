#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IAppDataPaths extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppDataPaths
     * @type {Guid}
     */
    static IID => Guid("{7301d60a-79a2-48c9-9ec0-3fda092f79e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Cookies", "get_Desktop", "get_Documents", "get_Favorites", "get_History", "get_InternetCache", "get_LocalAppData", "get_ProgramData", "get_RoamingAppData"]

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
    ProgramData {
        get => this.get_ProgramData()
    }

    /**
     * @type {HSTRING} 
     */
    RoamingAppData {
        get => this.get_RoamingAppData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Cookies() {
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
    get_Desktop() {
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
    get_Documents() {
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
    get_Favorites() {
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
    get_History() {
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
    get_InternetCache() {
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
    get_LocalAppData() {
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
    get_ProgramData() {
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
    get_RoamingAppData() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
