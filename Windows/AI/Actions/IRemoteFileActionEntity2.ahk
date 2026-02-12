#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContactActionEntity.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IRemoteFileActionEntity2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteFileActionEntity2
     * @type {Guid}
     */
    static IID => Guid("{9cc8cc54-77d8-5537-83c4-6f18c1bc9f67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Filename", "put_Filename", "get_Creator", "put_Creator", "get_LastUpdatedTime", "put_LastUpdatedTime", "SetContributors", "GetContributors"]

    /**
     * @type {HSTRING} 
     */
    Filename {
        get => this.get_Filename()
        set => this.put_Filename(value)
    }

    /**
     * @type {ContactActionEntity} 
     */
    Creator {
        get => this.get_Creator()
        set => this.put_Creator(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    LastUpdatedTime {
        get => this.get_LastUpdatedTime()
        set => this.put_LastUpdatedTime(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Filename() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Filename(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ContactActionEntity} 
     */
    get_Creator() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactActionEntity(value)
    }

    /**
     * 
     * @param {ContactActionEntity} value 
     * @returns {HRESULT} 
     */
    put_Creator(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_LastUpdatedTime() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_LastUpdatedTime(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} contributors_length 
     * @param {Pointer<ContactActionEntity>} contributors 
     * @returns {HRESULT} 
     */
    SetContributors(contributors_length, contributors) {
        result := ComCall(12, this, "uint", contributors_length, "ptr*", contributors, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetContributors(result_) {
        result := ComCall(13, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
