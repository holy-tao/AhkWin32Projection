#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\PropertyPath.ahk
#Include .\RelativeSource.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IValueConverter.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class IBinding extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBinding
     * @type {Guid}
     */
    static IID => Guid("{3f7a0c6b-d00f-4730-8c1d-48e16c46f9ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "put_Path", "get_Mode", "put_Mode", "get_Source", "put_Source", "get_RelativeSource", "put_RelativeSource", "get_ElementName", "put_ElementName", "get_Converter", "put_Converter", "get_ConverterParameter", "put_ConverterParameter", "get_ConverterLanguage", "put_ConverterLanguage"]

    /**
     * @type {PropertyPath} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * @type {IInspectable} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {RelativeSource} 
     */
    RelativeSource {
        get => this.get_RelativeSource()
        set => this.put_RelativeSource(value)
    }

    /**
     * @type {HSTRING} 
     */
    ElementName {
        get => this.get_ElementName()
        set => this.put_ElementName(value)
    }

    /**
     * @type {IValueConverter} 
     */
    Converter {
        get => this.get_Converter()
        set => this.put_Converter(value)
    }

    /**
     * @type {IInspectable} 
     */
    ConverterParameter {
        get => this.get_ConverterParameter()
        set => this.put_ConverterParameter(value)
    }

    /**
     * @type {HSTRING} 
     */
    ConverterLanguage {
        get => this.get_ConverterLanguage()
        set => this.put_ConverterLanguage(value)
    }

    /**
     * 
     * @returns {PropertyPath} 
     */
    get_Path() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyPath(value)
    }

    /**
     * 
     * @param {PropertyPath} value 
     * @returns {HRESULT} 
     */
    put_Path(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_Mode(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Source() {
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
    put_Source(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RelativeSource} 
     */
    get_RelativeSource() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RelativeSource(value)
    }

    /**
     * 
     * @param {RelativeSource} value 
     * @returns {HRESULT} 
     */
    put_RelativeSource(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ElementName() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ElementName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IValueConverter} 
     */
    get_Converter() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IValueConverter(value)
    }

    /**
     * 
     * @param {IValueConverter} value 
     * @returns {HRESULT} 
     */
    put_Converter(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ConverterParameter() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
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
    put_ConverterParameter(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConverterLanguage() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ConverterLanguage(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
