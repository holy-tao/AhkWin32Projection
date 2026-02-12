#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{5f9bf11e-39ef-4f2b-b44f-0a9155b177bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TriggerType", "get_SourceAppletId", "get_TriggerData"]

    /**
     * @type {Integer} 
     */
    TriggerType {
        get => this.get_TriggerType()
    }

    /**
     * @type {IBuffer} 
     */
    SourceAppletId {
        get => this.get_SourceAppletId()
    }

    /**
     * @type {IBuffer} 
     */
    TriggerData {
        get => this.get_TriggerData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TriggerType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SourceAppletId() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_TriggerData() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
