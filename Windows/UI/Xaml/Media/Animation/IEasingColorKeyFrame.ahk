#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\EasingFunctionBase.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IEasingColorKeyFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEasingColorKeyFrame
     * @type {Guid}
     */
    static IID => Guid("{c733d630-f4b9-4934-9bdd-27ac5ed1cfd8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EasingFunction", "put_EasingFunction"]

    /**
     * @type {EasingFunctionBase} 
     */
    EasingFunction {
        get => this.get_EasingFunction()
        set => this.put_EasingFunction(value)
    }

    /**
     * 
     * @returns {EasingFunctionBase} 
     */
    get_EasingFunction() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EasingFunctionBase(value)
    }

    /**
     * 
     * @param {EasingFunctionBase} value 
     * @returns {HRESULT} 
     */
    put_EasingFunction(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
