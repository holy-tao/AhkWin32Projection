#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\TextBoxId.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class ITextBoxInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBoxInfo
     * @type {Guid}
     */
    static IID => Guid("{b122443d-e8f7-5f8b-813d-aaa0941d5fa0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_InputScope", "get_AppName", "get_Url", "get_Settings", "get_DisabledFeatures"]

    /**
     * @type {TextBoxId} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    InputScope {
        get => this.get_InputScope()
    }

    /**
     * @type {HSTRING} 
     */
    AppName {
        get => this.get_AppName()
    }

    /**
     * @type {HSTRING} 
     */
    Url {
        get => this.get_Url()
    }

    /**
     * @type {Integer} 
     */
    Settings {
        get => this.get_Settings()
    }

    /**
     * @type {Integer} 
     */
    DisabledFeatures {
        get => this.get_DisabledFeatures()
    }

    /**
     * 
     * @returns {TextBoxId} 
     */
    get_Id() {
        value := TextBoxId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputScope() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Url() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Settings() {
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
    get_DisabledFeatures() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
