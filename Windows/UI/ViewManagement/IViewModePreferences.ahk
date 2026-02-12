#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IViewModePreferences extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewModePreferences
     * @type {Guid}
     */
    static IID => Guid("{878fcd3a-0b99-42c9-84d0-d3f1d403554b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ViewSizePreference", "put_ViewSizePreference", "get_CustomSize", "put_CustomSize"]

    /**
     * @type {Integer} 
     */
    ViewSizePreference {
        get => this.get_ViewSizePreference()
        set => this.put_ViewSizePreference(value)
    }

    /**
     * @type {SIZE} 
     */
    CustomSize {
        get => this.get_CustomSize()
        set => this.put_CustomSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewSizePreference() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_ViewSizePreference(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_CustomSize() {
        value := SIZE()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_CustomSize(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
