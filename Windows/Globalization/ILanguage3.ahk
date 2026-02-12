#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ILanguage3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguage3
     * @type {Guid}
     */
    static IID => Guid("{c6af3d10-641a-5ba4-bb43-5e12aed75954}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AbbreviatedName"]

    /**
     * @type {HSTRING} 
     */
    AbbreviatedName {
        get => this.get_AbbreviatedName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AbbreviatedName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
