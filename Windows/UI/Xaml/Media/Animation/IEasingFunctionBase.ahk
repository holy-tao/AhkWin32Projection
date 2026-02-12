#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IEasingFunctionBase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEasingFunctionBase
     * @type {Guid}
     */
    static IID => Guid("{c108383f-2c02-4151-8ecd-68ddaa3f0d9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EasingMode", "put_EasingMode", "Ease"]

    /**
     * @type {Integer} 
     */
    EasingMode {
        get => this.get_EasingMode()
        set => this.put_EasingMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EasingMode() {
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
    put_EasingMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} normalizedTime 
     * @returns {Float} 
     */
    Ease(normalizedTime) {
        result := ComCall(8, this, "double", normalizedTime, "double*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
