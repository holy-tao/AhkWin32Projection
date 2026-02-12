#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\HidBooleanControl.ahk
#Include .\HidNumericControl.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class IHidInputReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHidInputReport
     * @type {Guid}
     */
    static IID => Guid("{c35d0e50-f7e7-4e8d-b23e-cabbe56b90e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Data", "get_ActivatedBooleanControls", "get_TransitionedBooleanControls", "GetBooleanControl", "GetBooleanControlByDescription", "GetNumericControl", "GetNumericControlByDescription"]

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
    }

    /**
     * @type {IVectorView<HidBooleanControl>} 
     */
    ActivatedBooleanControls {
        get => this.get_ActivatedBooleanControls()
    }

    /**
     * @type {IVectorView<HidBooleanControl>} 
     */
    TransitionedBooleanControls {
        get => this.get_TransitionedBooleanControls()
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
     * @returns {IVectorView<HidBooleanControl>} 
     */
    get_ActivatedBooleanControls() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HidBooleanControl, value)
    }

    /**
     * 
     * @returns {IVectorView<HidBooleanControl>} 
     */
    get_TransitionedBooleanControls() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HidBooleanControl, value)
    }

    /**
     * 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @returns {HidBooleanControl} 
     */
    GetBooleanControl(usagePage, usageId) {
        result := ComCall(10, this, "ushort", usagePage, "ushort", usageId, "ptr*", &value := 0, "int")
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
        result := ComCall(11, this, "ptr", controlDescription, "ptr*", &value := 0, "int")
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
        result := ComCall(12, this, "ushort", usagePage, "ushort", usageId, "ptr*", &value := 0, "int")
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
        result := ComCall(13, this, "ptr", controlDescription, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidNumericControl(value)
    }
}
