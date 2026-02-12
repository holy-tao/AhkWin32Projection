#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HidBooleanControlDescription.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class IHidBooleanControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHidBooleanControl
     * @type {Guid}
     */
    static IID => Guid("{524df48a-3695-408c-bba2-e2eb5abfbc20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_UsagePage", "get_UsageId", "get_IsActive", "put_IsActive", "get_ControlDescription"]

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    UsagePage {
        get => this.get_UsagePage()
    }

    /**
     * @type {Integer} 
     */
    UsageId {
        get => this.get_UsageId()
    }

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
        set => this.put_IsActive(value)
    }

    /**
     * @type {HidBooleanControlDescription} 
     */
    ControlDescription {
        get => this.get_ControlDescription()
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
     * @returns {Integer} 
     */
    get_UsagePage() {
        result := ComCall(7, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageId() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsActive(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HidBooleanControlDescription} 
     */
    get_ControlDescription() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidBooleanControlDescription(value)
    }
}
