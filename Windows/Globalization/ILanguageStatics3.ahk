#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ILanguageStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguageStatics3
     * @type {Guid}
     */
    static IID => Guid("{d15ecb5a-71de-5752-9542-fac5b4f27261}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMuiCompatibleLanguageListFromLanguageTags"]

    /**
     * 
     * @param {IIterable<HSTRING>} languageTags 
     * @returns {IVector<HSTRING>} 
     */
    GetMuiCompatibleLanguageListFromLanguageTags(languageTags) {
        result := ComCall(6, this, "ptr", languageTags, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }
}
