#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ISystemDataPaths extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemDataPaths
     * @type {Guid}
     */
    static IID => Guid("{e32abf70-d8fa-45ec-a942-d2e26fb60ba5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Fonts", "get_ProgramData", "get_Public", "get_PublicDesktop", "get_PublicDocuments", "get_PublicDownloads", "get_PublicMusic", "get_PublicPictures", "get_PublicVideos", "get_System", "get_SystemHost", "get_SystemX86", "get_SystemX64", "get_SystemArm", "get_UserProfiles", "get_Windows"]

    /**
     * @type {HSTRING} 
     */
    Fonts {
        get => this.get_Fonts()
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
    Public {
        get => this.get_Public()
    }

    /**
     * @type {HSTRING} 
     */
    PublicDesktop {
        get => this.get_PublicDesktop()
    }

    /**
     * @type {HSTRING} 
     */
    PublicDocuments {
        get => this.get_PublicDocuments()
    }

    /**
     * @type {HSTRING} 
     */
    PublicDownloads {
        get => this.get_PublicDownloads()
    }

    /**
     * @type {HSTRING} 
     */
    PublicMusic {
        get => this.get_PublicMusic()
    }

    /**
     * @type {HSTRING} 
     */
    PublicPictures {
        get => this.get_PublicPictures()
    }

    /**
     * @type {HSTRING} 
     */
    PublicVideos {
        get => this.get_PublicVideos()
    }

    /**
     * @type {HSTRING} 
     */
    System {
        get => this.get_System()
    }

    /**
     * @type {HSTRING} 
     */
    SystemHost {
        get => this.get_SystemHost()
    }

    /**
     * @type {HSTRING} 
     */
    SystemX86 {
        get => this.get_SystemX86()
    }

    /**
     * @type {HSTRING} 
     */
    SystemX64 {
        get => this.get_SystemX64()
    }

    /**
     * @type {HSTRING} 
     */
    SystemArm {
        get => this.get_SystemArm()
    }

    /**
     * @type {HSTRING} 
     */
    UserProfiles {
        get => this.get_UserProfiles()
    }

    /**
     * @type {HSTRING} 
     */
    Windows {
        get => this.get_Windows()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Fonts() {
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
    get_ProgramData() {
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
    get_Public() {
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
    get_PublicDesktop() {
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
    get_PublicDocuments() {
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
    get_PublicDownloads() {
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
    get_PublicMusic() {
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
    get_PublicPictures() {
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
    get_PublicVideos() {
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
    get_System() {
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
    get_SystemHost() {
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
    get_SystemX86() {
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
    get_SystemX64() {
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
    get_SystemArm() {
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
    get_UserProfiles() {
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
    get_Windows() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
