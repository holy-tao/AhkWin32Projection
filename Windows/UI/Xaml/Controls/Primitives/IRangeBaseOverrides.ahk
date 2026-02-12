#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IRangeBaseOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRangeBaseOverrides
     * @type {Guid}
     */
    static IID => Guid("{4291af39-7f0b-4bc2-99c4-06e7062682d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnMinimumChanged", "OnMaximumChanged", "OnValueChanged"]

    /**
     * 
     * @param {Float} oldMinimum 
     * @param {Float} newMinimum 
     * @returns {HRESULT} 
     */
    OnMinimumChanged(oldMinimum, newMinimum) {
        result := ComCall(6, this, "double", oldMinimum, "double", newMinimum, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} oldMaximum 
     * @param {Float} newMaximum 
     * @returns {HRESULT} 
     */
    OnMaximumChanged(oldMaximum, newMaximum) {
        result := ComCall(7, this, "double", oldMaximum, "double", newMaximum, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} oldValue 
     * @param {Float} newValue 
     * @returns {HRESULT} 
     */
    OnValueChanged(oldValue, newValue) {
        result := ComCall(8, this, "double", oldValue, "double", newValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
