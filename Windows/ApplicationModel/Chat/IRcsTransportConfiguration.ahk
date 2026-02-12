#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IRcsTransportConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRcsTransportConfiguration
     * @type {Guid}
     */
    static IID => Guid("{1fccb102-2472-4bb9-9988-c1211c83e8a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxAttachmentCount", "get_MaxMessageSizeInKilobytes", "get_MaxGroupMessageSizeInKilobytes", "get_MaxRecipientCount", "get_MaxFileSizeInKilobytes", "get_WarningFileSizeInKilobytes"]

    /**
     * @type {Integer} 
     */
    MaxAttachmentCount {
        get => this.get_MaxAttachmentCount()
    }

    /**
     * @type {Integer} 
     */
    MaxMessageSizeInKilobytes {
        get => this.get_MaxMessageSizeInKilobytes()
    }

    /**
     * @type {Integer} 
     */
    MaxGroupMessageSizeInKilobytes {
        get => this.get_MaxGroupMessageSizeInKilobytes()
    }

    /**
     * @type {Integer} 
     */
    MaxRecipientCount {
        get => this.get_MaxRecipientCount()
    }

    /**
     * @type {Integer} 
     */
    MaxFileSizeInKilobytes {
        get => this.get_MaxFileSizeInKilobytes()
    }

    /**
     * @type {Integer} 
     */
    WarningFileSizeInKilobytes {
        get => this.get_WarningFileSizeInKilobytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxAttachmentCount() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxMessageSizeInKilobytes() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxGroupMessageSizeInKilobytes() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxRecipientCount() {
        result := ComCall(9, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxFileSizeInKilobytes() {
        result := ComCall(10, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WarningFileSizeInKilobytes() {
        result := ComCall(11, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
