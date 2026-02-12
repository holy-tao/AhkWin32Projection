#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IFontFamily extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFontFamily
     * @type {Guid}
     */
    static IID => Guid("{92467e64-d66a-4cf4-9322-3d23b3c0c361}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source"]

    /**
     * @type {HSTRING} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Source() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
