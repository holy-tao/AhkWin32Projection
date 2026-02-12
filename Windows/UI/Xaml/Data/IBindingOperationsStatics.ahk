#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class IBindingOperationsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindingOperationsStatics
     * @type {Guid}
     */
    static IID => Guid("{e155ef73-95a0-4aab-8c7d-2a47da073c79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBinding"]

    /**
     * 
     * @param {DependencyObject} target 
     * @param {DependencyProperty} dp 
     * @param {BindingBase} binding_ 
     * @returns {HRESULT} 
     */
    SetBinding(target, dp, binding_) {
        result := ComCall(6, this, "ptr", target, "ptr", dp, "ptr", binding_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
