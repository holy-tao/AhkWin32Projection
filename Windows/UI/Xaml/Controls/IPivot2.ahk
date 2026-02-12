#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DataTemplate.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPivot2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPivot2
     * @type {Guid}
     */
    static IID => Guid("{8b8a8660-1a55-411c-a82d-18991c3f0d6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LeftHeader", "put_LeftHeader", "get_LeftHeaderTemplate", "put_LeftHeaderTemplate", "get_RightHeader", "put_RightHeader", "get_RightHeaderTemplate", "put_RightHeaderTemplate"]

    /**
     * @type {IInspectable} 
     */
    LeftHeader {
        get => this.get_LeftHeader()
        set => this.put_LeftHeader(value)
    }

    /**
     * @type {DataTemplate} 
     */
    LeftHeaderTemplate {
        get => this.get_LeftHeaderTemplate()
        set => this.put_LeftHeaderTemplate(value)
    }

    /**
     * @type {IInspectable} 
     */
    RightHeader {
        get => this.get_RightHeader()
        set => this.put_RightHeader(value)
    }

    /**
     * @type {DataTemplate} 
     */
    RightHeaderTemplate {
        get => this.get_RightHeaderTemplate()
        set => this.put_RightHeaderTemplate(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_LeftHeader() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_LeftHeader(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_LeftHeaderTemplate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_LeftHeaderTemplate(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_RightHeader() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_RightHeader(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_RightHeaderTemplate() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_RightHeaderTemplate(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
