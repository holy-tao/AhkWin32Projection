#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FontFamily.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IFontFamilyStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFontFamilyStatics2
     * @type {Guid}
     */
    static IID => Guid("{52ad7af9-37e6-4297-a238-97fb6a408d9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XamlAutoFontFamily"]

    /**
     * @type {FontFamily} 
     */
    XamlAutoFontFamily {
        get => this.get_XamlAutoFontFamily()
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_XamlAutoFontFamily() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FontFamily(value)
    }
}
