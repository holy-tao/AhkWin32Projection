#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NotifyCollectionChangedEventArgs.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class INotifyCollectionChangedEventArgsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotifyCollectionChangedEventArgsFactory
     * @type {Guid}
     */
    static IID => Guid("{b30c3e3a-df8d-44a5-9a38-7ac0d08ce63d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithAllParameters"]

    /**
     * 
     * @param {Integer} action 
     * @param {IBindableVector} newItems 
     * @param {IBindableVector} oldItems 
     * @param {Integer} newIndex 
     * @param {Integer} oldIndex 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {NotifyCollectionChangedEventArgs} 
     */
    CreateInstanceWithAllParameters(action, newItems, oldItems, newIndex, oldIndex, baseInterface, innerInterface) {
        result := ComCall(6, this, "int", action, "ptr", newItems, "ptr", oldItems, "int", newIndex, "int", oldIndex, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NotifyCollectionChangedEventArgs(value)
    }
}
