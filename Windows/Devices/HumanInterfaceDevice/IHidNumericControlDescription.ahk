#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\HidCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class IHidNumericControlDescription extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHidNumericControlDescription
     * @type {Guid}
     */
    static IID => Guid("{638d5e86-1d97-4c75-927f-5ff58ba05e32}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_ReportId", "get_ReportType", "get_ReportSize", "get_ReportCount", "get_UsagePage", "get_UsageId", "get_LogicalMinimum", "get_LogicalMaximum", "get_PhysicalMinimum", "get_PhysicalMaximum", "get_UnitExponent", "get_Unit", "get_IsAbsolute", "get_HasNull", "get_ParentCollections"]

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    ReportId {
        get => this.get_ReportId()
    }

    /**
     * @type {Integer} 
     */
    ReportType {
        get => this.get_ReportType()
    }

    /**
     * @type {Integer} 
     */
    ReportSize {
        get => this.get_ReportSize()
    }

    /**
     * @type {Integer} 
     */
    ReportCount {
        get => this.get_ReportCount()
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
     * @type {Integer} 
     */
    LogicalMinimum {
        get => this.get_LogicalMinimum()
    }

    /**
     * @type {Integer} 
     */
    LogicalMaximum {
        get => this.get_LogicalMaximum()
    }

    /**
     * @type {Integer} 
     */
    PhysicalMinimum {
        get => this.get_PhysicalMinimum()
    }

    /**
     * @type {Integer} 
     */
    PhysicalMaximum {
        get => this.get_PhysicalMaximum()
    }

    /**
     * @type {Integer} 
     */
    UnitExponent {
        get => this.get_UnitExponent()
    }

    /**
     * @type {Integer} 
     */
    Unit {
        get => this.get_Unit()
    }

    /**
     * @type {Boolean} 
     */
    IsAbsolute {
        get => this.get_IsAbsolute()
    }

    /**
     * @type {Boolean} 
     */
    HasNull {
        get => this.get_HasNull()
    }

    /**
     * @type {IVectorView<HidCollection>} 
     */
    ParentCollections {
        get => this.get_ParentCollections()
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
    get_ReportId() {
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
    get_ReportType() {
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
    get_ReportSize() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportCount() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
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
        result := ComCall(11, this, "ushort*", &value := 0, "int")
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
        result := ComCall(12, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LogicalMinimum() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LogicalMaximum() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhysicalMinimum() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhysicalMaximum() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnitExponent() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unit() {
        result := ComCall(18, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAbsolute() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNull() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HidCollection>} 
     */
    get_ParentCollections() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HidCollection, value)
    }
}
