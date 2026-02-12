#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactLaunchActionVerbsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactLaunchActionVerbsStatics
     * @type {Guid}
     */
    static IID => Guid("{fb1232d6-ee73-46e7-8761-11cd0157728f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_Message", "get_Map", "get_Post", "get_VideoCall"]

    /**
     * @type {HSTRING} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * @type {HSTRING} 
     */
    Map {
        get => this.get_Map()
    }

    /**
     * @type {HSTRING} 
     */
    Post {
        get => this.get_Post()
    }

    /**
     * @type {HSTRING} 
     */
    VideoCall {
        get => this.get_VideoCall()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Call() {
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
    get_Message() {
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
    get_Map() {
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
    get_Post() {
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
    get_VideoCall() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
