#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollViewerView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollViewerView
     * @type {Guid}
     */
    static IID => Guid("{64e9be01-4dc2-493e-abe8-cbd3c577490e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontalOffset", "get_VerticalOffset", "get_ZoomFactor"]

    /**
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
    }

    /**
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
    }

    /**
     * @type {Float} 
     */
    ZoomFactor {
        get => this.get_ZoomFactor()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
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
    get_VerticalOffset() {
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
    get_ZoomFactor() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
