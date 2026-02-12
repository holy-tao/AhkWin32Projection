#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class ICoreDragDropManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreDragDropManager
     * @type {Guid}
     */
    static IID => Guid("{7d56d344-8464-4faf-aa49-37ea6e2d7bd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_TargetRequested", "remove_TargetRequested", "get_AreConcurrentOperationsEnabled", "put_AreConcurrentOperationsEnabled"]

    /**
     * @type {Boolean} 
     */
    AreConcurrentOperationsEnabled {
        get => this.get_AreConcurrentOperationsEnabled()
        set => this.put_AreConcurrentOperationsEnabled(value)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreDragDropManager, CoreDropOperationTargetRequestedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_TargetRequested(value) {
        returnValue := EventRegistrationToken()
        result := ComCall(6, this, "ptr", value, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_TargetRequested(value) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreConcurrentOperationsEnabled() {
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
    put_AreConcurrentOperationsEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
