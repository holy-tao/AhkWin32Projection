#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ICommandBarTemplateSettings4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBarTemplateSettings4
     * @type {Guid}
     */
    static IID => Guid("{f2562dd3-aa58-59c5-853b-828a19d1214e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OverflowContentCompactYTranslation", "get_OverflowContentMinimalYTranslation", "get_OverflowContentHiddenYTranslation"]

    /**
     * @type {Float} 
     */
    OverflowContentCompactYTranslation {
        get => this.get_OverflowContentCompactYTranslation()
    }

    /**
     * @type {Float} 
     */
    OverflowContentMinimalYTranslation {
        get => this.get_OverflowContentMinimalYTranslation()
    }

    /**
     * @type {Float} 
     */
    OverflowContentHiddenYTranslation {
        get => this.get_OverflowContentHiddenYTranslation()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentCompactYTranslation() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentMinimalYTranslation() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentHiddenYTranslation() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
