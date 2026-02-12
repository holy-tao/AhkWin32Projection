#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class IApplicationLanguagesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationLanguagesStatics
     * @type {Guid}
     */
    static IID => Guid("{75b40847-0a4c-4a92-9565-fd63c95f7aed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrimaryLanguageOverride", "put_PrimaryLanguageOverride", "get_Languages", "get_ManifestLanguages"]

    /**
     * @type {HSTRING} 
     */
    PrimaryLanguageOverride {
        get => this.get_PrimaryLanguageOverride()
        set => this.put_PrimaryLanguageOverride(value)
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    ManifestLanguages {
        get => this.get_ManifestLanguages()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrimaryLanguageOverride() {
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
    put_PrimaryLanguageOverride(value) {
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
     * @returns {IVectorView<HSTRING>} 
     */
    get_Languages() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_ManifestLanguages() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
