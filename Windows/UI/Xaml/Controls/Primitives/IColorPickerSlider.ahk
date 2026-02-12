#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IColorPickerSlider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorPickerSlider
     * @type {Guid}
     */
    static IID => Guid("{94394d83-e0df-4c5f-bbcd-8155f4020440}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColorChannel", "put_ColorChannel"]

    /**
     * @type {Integer} 
     */
    ColorChannel {
        get => this.get_ColorChannel()
        set => this.put_ColorChannel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorChannel() {
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
    put_ColorChannel(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
