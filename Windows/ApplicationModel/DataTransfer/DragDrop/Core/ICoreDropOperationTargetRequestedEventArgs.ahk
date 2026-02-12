#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class ICoreDropOperationTargetRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreDropOperationTargetRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2aca929a-5e28-4ea6-829e-29134e665d6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTarget"]

    /**
     * 
     * @param {ICoreDropOperationTarget} target 
     * @returns {HRESULT} 
     */
    SetTarget(target) {
        result := ComCall(6, this, "ptr", target, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
