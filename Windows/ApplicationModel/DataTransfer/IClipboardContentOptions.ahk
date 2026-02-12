#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IClipboardContentOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClipboardContentOptions
     * @type {Guid}
     */
    static IID => Guid("{e888a98c-ad4b-5447-a056-ab3556276d2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsRoamable", "put_IsRoamable", "get_IsAllowedInHistory", "put_IsAllowedInHistory", "get_RoamingFormats", "get_HistoryFormats"]

    /**
     * @type {Boolean} 
     */
    IsRoamable {
        get => this.get_IsRoamable()
        set => this.put_IsRoamable(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAllowedInHistory {
        get => this.get_IsAllowedInHistory()
        set => this.put_IsAllowedInHistory(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    RoamingFormats {
        get => this.get_RoamingFormats()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    HistoryFormats {
        get => this.get_HistoryFormats()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRoamable() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsRoamable(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAllowedInHistory() {
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
    put_IsAllowedInHistory(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RoamingFormats() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_HistoryFormats() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
