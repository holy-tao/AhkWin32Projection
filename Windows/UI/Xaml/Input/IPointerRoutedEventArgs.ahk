#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Pointer.ahk
#Include ..\..\Input\PointerPoint.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IPointerRoutedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerRoutedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{da628f0a-9752-49e2-bde2-49eccab9194d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Pointer", "get_KeyModifiers", "get_Handled", "put_Handled", "GetCurrentPoint", "GetIntermediatePoints"]

    /**
     * @type {Pointer} 
     */
    Pointer {
        get => this.get_Pointer()
    }

    /**
     * @type {Integer} 
     */
    KeyModifiers {
        get => this.get_KeyModifiers()
    }

    /**
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Pointer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Pointer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyModifiers() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {UIElement} relativeTo 
     * @returns {PointerPoint} 
     */
    GetCurrentPoint(relativeTo) {
        result := ComCall(10, this, "ptr", relativeTo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointerPoint(result_)
    }

    /**
     * 
     * @param {UIElement} relativeTo 
     * @returns {IVector<PointerPoint>} 
     */
    GetIntermediatePoints(relativeTo) {
        result := ComCall(11, this, "ptr", relativeTo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(PointerPoint, result_)
    }
}
