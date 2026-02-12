#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageValidationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageValidationResult
     * @type {Guid}
     */
    static IID => Guid("{25e93a03-28ec-5889-569b-7e486b126f18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxPartCount", "get_PartCount", "get_RemainingCharacterCountInPart", "get_Status"]

    /**
     * @type {IReference<Integer>} 
     */
    MaxPartCount {
        get => this.get_MaxPartCount()
    }

    /**
     * @type {IReference<Integer>} 
     */
    PartCount {
        get => this.get_PartCount()
    }

    /**
     * @type {IReference<Integer>} 
     */
    RemainingCharacterCountInPart {
        get => this.get_RemainingCharacterCountInPart()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxPartCount() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PartCount() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RemainingCharacterCountInPart() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
