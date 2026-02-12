#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDependencyObject2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDependencyObject2
     * @type {Guid}
     */
    static IID => Guid("{29fed85d-3d22-43a1-add0-17027c08b212}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterPropertyChangedCallback", "UnregisterPropertyChangedCallback"]

    /**
     * 
     * @param {DependencyProperty} dp 
     * @param {DependencyPropertyChangedCallback} callback 
     * @returns {Integer} 
     */
    RegisterPropertyChangedCallback(dp, callback) {
        result := ComCall(6, this, "ptr", dp, "ptr", callback, "int64*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyProperty} dp 
     * @param {Integer} token 
     * @returns {HRESULT} 
     */
    UnregisterPropertyChangedCallback(dp, token) {
        result := ComCall(7, this, "ptr", dp, "int64", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
