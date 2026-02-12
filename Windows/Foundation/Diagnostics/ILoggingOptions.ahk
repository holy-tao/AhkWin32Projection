#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingOptions
     * @type {Guid}
     */
    static IID => Guid("{90bc7850-0192-4f5d-ac26-006adaca12d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Keywords", "put_Keywords", "get_Tags", "put_Tags", "get_Task", "put_Task", "get_Opcode", "put_Opcode", "get_ActivityId", "put_ActivityId", "get_RelatedActivityId", "put_RelatedActivityId"]

    /**
     * @type {Integer} 
     */
    Keywords {
        get => this.get_Keywords()
        set => this.put_Keywords(value)
    }

    /**
     * @type {Integer} 
     */
    Tags {
        get => this.get_Tags()
        set => this.put_Tags(value)
    }

    /**
     * @type {Integer} 
     */
    Task {
        get => this.get_Task()
        set => this.put_Task(value)
    }

    /**
     * @type {Integer} 
     */
    Opcode {
        get => this.get_Opcode()
        set => this.put_Opcode(value)
    }

    /**
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
        set => this.put_ActivityId(value)
    }

    /**
     * @type {Guid} 
     */
    RelatedActivityId {
        get => this.get_RelatedActivityId()
        set => this.put_RelatedActivityId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Keywords() {
        result := ComCall(6, this, "int64*", &value := 0, "int")
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
    put_Keywords(value) {
        result := ComCall(7, this, "int64", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Tags() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_Tags(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Task() {
        result := ComCall(10, this, "short*", &value := 0, "int")
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
    put_Task(value) {
        result := ComCall(11, this, "short", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Opcode() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_Opcode(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ActivityId() {
        value := Guid()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_ActivityId(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_RelatedActivityId() {
        value := Guid()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_RelatedActivityId(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
