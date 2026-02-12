#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class IProximityMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProximityMessage
     * @type {Guid}
     */
    static IID => Guid("{efab0782-f6e1-4675-a045-d8e320c24808}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MessageType", "get_SubscriptionId", "get_Data", "get_DataAsString"]

    /**
     * @type {HSTRING} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * @type {Integer} 
     */
    SubscriptionId {
        get => this.get_SubscriptionId()
    }

    /**
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * @type {HSTRING} 
     */
    DataAsString {
        get => this.get_DataAsString()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MessageType() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubscriptionId() {
        result := ComCall(7, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DataAsString() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
