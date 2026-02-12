#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IToolTipTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToolTipTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{d4388247-0ec4-4506-affd-afac2225b48c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FromHorizontalOffset", "get_FromVerticalOffset"]

    /**
     * @type {Float} 
     */
    FromHorizontalOffset {
        get => this.get_FromHorizontalOffset()
    }

    /**
     * @type {Float} 
     */
    FromVerticalOffset {
        get => this.get_FromVerticalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromHorizontalOffset() {
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
    get_FromVerticalOffset() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
