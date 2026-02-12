#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IFrameworkElementOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkElementOverrides
     * @type {Guid}
     */
    static IID => Guid("{da007e54-b3c2-4b9a-aa8e-d3f071262b97}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MeasureOverride", "ArrangeOverride", "OnApplyTemplate"]

    /**
     * 
     * @param {SIZE} availableSize 
     * @returns {SIZE} 
     */
    MeasureOverride(availableSize) {
        result_ := SIZE()
        result := ComCall(6, this, "ptr", availableSize, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {SIZE} finalSize 
     * @returns {SIZE} 
     */
    ArrangeOverride(finalSize) {
        result_ := SIZE()
        result := ComCall(7, this, "ptr", finalSize, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnApplyTemplate() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
