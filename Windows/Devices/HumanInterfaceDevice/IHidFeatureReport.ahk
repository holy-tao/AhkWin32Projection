#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include .\HidBooleanControl.ahk
#Include .\HidNumericControl.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class IHidFeatureReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHidFeatureReport
     * @type {Guid}
     */
    static IID => Guid("{841d9b79-5ae5-46e3-82ef-1fec5c8942f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Data", "put_Data", "GetBooleanControl", "GetBooleanControlByDescription", "GetNumericControl", "GetNumericControlByDescription"]

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(6, this, "ushort*", &value := 0, "int")
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
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @returns {HidBooleanControl} 
     */
    GetBooleanControl(usagePage, usageId) {
        result := ComCall(9, this, "ushort", usagePage, "ushort", usageId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidBooleanControl(value)
    }

    /**
     * 
     * @param {HidBooleanControlDescription} controlDescription 
     * @returns {HidBooleanControl} 
     */
    GetBooleanControlByDescription(controlDescription) {
        result := ComCall(10, this, "ptr", controlDescription, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidBooleanControl(value)
    }

    /**
     * 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @returns {HidNumericControl} 
     */
    GetNumericControl(usagePage, usageId) {
        result := ComCall(11, this, "ushort", usagePage, "ushort", usageId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidNumericControl(value)
    }

    /**
     * 
     * @param {HidNumericControlDescription} controlDescription 
     * @returns {HidNumericControl} 
     */
    GetNumericControlByDescription(controlDescription) {
        result := ComCall(12, this, "ptr", controlDescription, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidNumericControl(value)
    }
}
