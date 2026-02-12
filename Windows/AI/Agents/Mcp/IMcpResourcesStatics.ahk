#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class IMcpResourcesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMcpResourcesStatics
     * @type {Guid}
     */
    static IID => Guid("{9b9f451c-73f8-59c0-bbea-5ceb60b5f26c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FileSystemRead", "get_FileSystemWrite", "get_FileSystemDelete", "get_FileSystemCreate", "get_HttpGet", "get_HttpPost", "get_HttpPut", "get_HttpDelete"]

    /**
     * @type {HSTRING} 
     */
    FileSystemRead {
        get => this.get_FileSystemRead()
    }

    /**
     * @type {HSTRING} 
     */
    FileSystemWrite {
        get => this.get_FileSystemWrite()
    }

    /**
     * @type {HSTRING} 
     */
    FileSystemDelete {
        get => this.get_FileSystemDelete()
    }

    /**
     * @type {HSTRING} 
     */
    FileSystemCreate {
        get => this.get_FileSystemCreate()
    }

    /**
     * @type {HSTRING} 
     */
    HttpGet {
        get => this.get_HttpGet()
    }

    /**
     * @type {HSTRING} 
     */
    HttpPost {
        get => this.get_HttpPost()
    }

    /**
     * @type {HSTRING} 
     */
    HttpPut {
        get => this.get_HttpPut()
    }

    /**
     * @type {HSTRING} 
     */
    HttpDelete {
        get => this.get_HttpDelete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileSystemRead() {
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
    get_FileSystemWrite() {
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
    get_FileSystemDelete() {
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
    get_FileSystemCreate() {
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
    get_HttpGet() {
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
    get_HttpPost() {
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
    get_HttpPut() {
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
    get_HttpDelete() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
