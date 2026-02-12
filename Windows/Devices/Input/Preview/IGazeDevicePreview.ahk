#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\HumanInterfaceDevice\HidNumericControlDescription.ahk
#Include ..\..\HumanInterfaceDevice\HidBooleanControlDescription.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class IGazeDevicePreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGazeDevicePreview
     * @type {Guid}
     */
    static IID => Guid("{e79e7ee9-b389-11e7-b201-c8d3ffb75721}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_CanTrackEyes", "get_CanTrackHead", "get_ConfigurationState", "RequestCalibrationAsync", "GetNumericControlDescriptions", "GetBooleanControlDescriptions"]

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Boolean} 
     */
    CanTrackEyes {
        get => this.get_CanTrackEyes()
    }

    /**
     * @type {Boolean} 
     */
    CanTrackHead {
        get => this.get_CanTrackHead()
    }

    /**
     * @type {Integer} 
     */
    ConfigurationState {
        get => this.get_ConfigurationState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanTrackEyes() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanTrackHead() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConfigurationState() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestCalibrationAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @returns {IVectorView<HidNumericControlDescription>} 
     */
    GetNumericControlDescriptions(usagePage, usageId) {
        result := ComCall(11, this, "ushort", usagePage, "ushort", usageId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HidNumericControlDescription, result_)
    }

    /**
     * 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @returns {IVectorView<HidBooleanControlDescription>} 
     */
    GetBooleanControlDescriptions(usagePage, usageId) {
        result := ComCall(12, this, "ushort", usagePage, "ushort", usageId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HidBooleanControlDescription, result_)
    }
}
