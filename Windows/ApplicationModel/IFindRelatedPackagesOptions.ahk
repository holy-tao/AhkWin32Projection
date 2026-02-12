#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IFindRelatedPackagesOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFindRelatedPackagesOptions
     * @type {Guid}
     */
    static IID => Guid("{41dd7eea-b335-521f-b96c-5ea07f5b7329}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Relationship", "put_Relationship", "get_IncludeFrameworks", "put_IncludeFrameworks", "get_IncludeHostRuntimes", "put_IncludeHostRuntimes", "get_IncludeOptionals", "put_IncludeOptionals", "get_IncludeResources", "put_IncludeResources"]

    /**
     * @type {Integer} 
     */
    Relationship {
        get => this.get_Relationship()
        set => this.put_Relationship(value)
    }

    /**
     * @type {Boolean} 
     */
    IncludeFrameworks {
        get => this.get_IncludeFrameworks()
        set => this.put_IncludeFrameworks(value)
    }

    /**
     * @type {Boolean} 
     */
    IncludeHostRuntimes {
        get => this.get_IncludeHostRuntimes()
        set => this.put_IncludeHostRuntimes(value)
    }

    /**
     * @type {Boolean} 
     */
    IncludeOptionals {
        get => this.get_IncludeOptionals()
        set => this.put_IncludeOptionals(value)
    }

    /**
     * @type {Boolean} 
     */
    IncludeResources {
        get => this.get_IncludeResources()
        set => this.put_IncludeResources(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Relationship() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Relationship(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeFrameworks() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IncludeFrameworks(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeHostRuntimes() {
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
    put_IncludeHostRuntimes(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeOptionals() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_IncludeOptionals(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeResources() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_IncludeResources(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
