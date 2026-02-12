#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpLanguageRangeWithQualityHeaderValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpLanguageRangeWithQualityHeaderValue
     * @type {Guid}
     */
    static IID => Guid("{7256e102-0080-4db4-a083-7de7b2e5ba4c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LanguageRange", "get_Quality"]

    /**
     * @type {HSTRING} 
     */
    LanguageRange {
        get => this.get_LanguageRange()
    }

    /**
     * @type {IReference<Float>} 
     */
    Quality {
        get => this.get_Quality()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LanguageRange() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Quality() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }
}
