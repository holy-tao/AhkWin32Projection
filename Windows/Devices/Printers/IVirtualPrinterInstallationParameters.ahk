#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\VirtualPrinterSupportedFormat.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IVirtualPrinterInstallationParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualPrinterInstallationParameters
     * @type {Guid}
     */
    static IID => Guid("{bbc159b3-12f3-584c-8d26-b22c0dc83241}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrinterName", "put_PrinterName", "get_OutputFileExtensions", "get_SupportedInputFormats", "get_PrintDeviceCapabilitiesPackageRelativeFilePath", "put_PrintDeviceCapabilitiesPackageRelativeFilePath", "get_PrintDeviceResourcesPackageRelativeFilePath", "put_PrintDeviceResourcesPackageRelativeFilePath", "get_PreferredInputFormat", "put_PreferredInputFormat", "get_PrinterUri", "put_PrinterUri", "get_EntryPoint", "put_EntryPoint"]

    /**
     * @type {HSTRING} 
     */
    PrinterName {
        get => this.get_PrinterName()
        set => this.put_PrinterName(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    OutputFileExtensions {
        get => this.get_OutputFileExtensions()
    }

    /**
     * @type {IVector<VirtualPrinterSupportedFormat>} 
     */
    SupportedInputFormats {
        get => this.get_SupportedInputFormats()
    }

    /**
     * @type {HSTRING} 
     */
    PrintDeviceCapabilitiesPackageRelativeFilePath {
        get => this.get_PrintDeviceCapabilitiesPackageRelativeFilePath()
        set => this.put_PrintDeviceCapabilitiesPackageRelativeFilePath(value)
    }

    /**
     * @type {HSTRING} 
     */
    PrintDeviceResourcesPackageRelativeFilePath {
        get => this.get_PrintDeviceResourcesPackageRelativeFilePath()
        set => this.put_PrintDeviceResourcesPackageRelativeFilePath(value)
    }

    /**
     * @type {Integer} 
     */
    PreferredInputFormat {
        get => this.get_PreferredInputFormat()
        set => this.put_PreferredInputFormat(value)
    }

    /**
     * @type {Uri} 
     */
    PrinterUri {
        get => this.get_PrinterUri()
        set => this.put_PrinterUri(value)
    }

    /**
     * @type {HSTRING} 
     */
    EntryPoint {
        get => this.get_EntryPoint()
        set => this.put_EntryPoint(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrinterName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
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
    put_PrinterName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_OutputFileExtensions() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<VirtualPrinterSupportedFormat>} 
     */
    get_SupportedInputFormats() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VirtualPrinterSupportedFormat, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrintDeviceCapabilitiesPackageRelativeFilePath() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_PrintDeviceCapabilitiesPackageRelativeFilePath(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrintDeviceResourcesPackageRelativeFilePath() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_PrintDeviceResourcesPackageRelativeFilePath(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredInputFormat() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_PreferredInputFormat(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_PrinterUri() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_PrinterUri(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EntryPoint() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
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
    put_EntryPoint(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
