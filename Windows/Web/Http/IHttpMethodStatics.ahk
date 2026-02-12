#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HttpMethod.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpMethodStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpMethodStatics
     * @type {Guid}
     */
    static IID => Guid("{64d171f0-d99a-4153-8dc6-d68cc4cce317}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Delete", "get_Get", "get_Head", "get_Options", "get_Patch", "get_Post", "get_Put"]

    /**
     * @type {HttpMethod} 
     */
    Delete {
        get => this.get_Delete()
    }

    /**
     * @type {HttpMethod} 
     */
    Get {
        get => this.get_Get()
    }

    /**
     * @type {HttpMethod} 
     */
    Head {
        get => this.get_Head()
    }

    /**
     * @type {HttpMethod} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * @type {HttpMethod} 
     */
    Patch {
        get => this.get_Patch()
    }

    /**
     * @type {HttpMethod} 
     */
    Post {
        get => this.get_Post()
    }

    /**
     * @type {HttpMethod} 
     */
    Put {
        get => this.get_Put()
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    get_Delete() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMethod(value)
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    get_Get() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMethod(value)
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    get_Head() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMethod(value)
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    get_Options() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMethod(value)
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    get_Patch() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMethod(value)
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    get_Post() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMethod(value)
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    get_Put() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMethod(value)
    }
}
