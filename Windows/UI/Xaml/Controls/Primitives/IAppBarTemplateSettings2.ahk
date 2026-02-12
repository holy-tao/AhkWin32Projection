#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IAppBarTemplateSettings2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarTemplateSettings2
     * @type {Guid}
     */
    static IID => Guid("{cbe66259-0399-5bcc-b925-4d5f5c9a4568}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NegativeCompactVerticalDelta", "get_NegativeMinimalVerticalDelta", "get_NegativeHiddenVerticalDelta"]

    /**
     * @type {Float} 
     */
    NegativeCompactVerticalDelta {
        get => this.get_NegativeCompactVerticalDelta()
    }

    /**
     * @type {Float} 
     */
    NegativeMinimalVerticalDelta {
        get => this.get_NegativeMinimalVerticalDelta()
    }

    /**
     * @type {Float} 
     */
    NegativeHiddenVerticalDelta {
        get => this.get_NegativeHiddenVerticalDelta()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NegativeCompactVerticalDelta() {
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
    get_NegativeMinimalVerticalDelta() {
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
    get_NegativeHiddenVerticalDelta() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
