#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IFindAppointmentsOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFindAppointmentsOptions
     * @type {Guid}
     */
    static IID => Guid("{55f7dc55-9942-3086-82b5-2cb29f64d5f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CalendarIds", "get_FetchProperties", "get_IncludeHidden", "put_IncludeHidden", "get_MaxCount", "put_MaxCount"]

    /**
     * @type {IVector<HSTRING>} 
     */
    CalendarIds {
        get => this.get_CalendarIds()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    FetchProperties {
        get => this.get_FetchProperties()
    }

    /**
     * @type {Boolean} 
     */
    IncludeHidden {
        get => this.get_IncludeHidden()
        set => this.put_IncludeHidden(value)
    }

    /**
     * @type {Integer} 
     */
    MaxCount {
        get => this.get_MaxCount()
        set => this.put_MaxCount(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_CalendarIds() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_FetchProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeHidden() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IncludeHidden(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxCount() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxCount(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
