#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\CornerRadius.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControl7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControl7
     * @type {Guid}
     */
    static IID => Guid("{3550dbe1-e561-5934-a3ef-7db8bf6e3b45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackgroundSizing", "put_BackgroundSizing", "get_CornerRadius", "put_CornerRadius"]

    /**
     * @type {Integer} 
     */
    BackgroundSizing {
        get => this.get_BackgroundSizing()
        set => this.put_BackgroundSizing(value)
    }

    /**
     * @type {CornerRadius} 
     */
    CornerRadius {
        get => this.get_CornerRadius()
        set => this.put_CornerRadius(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSizing() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BackgroundSizing(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CornerRadius() {
        value := CornerRadius()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CornerRadius(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
