#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\IUICommand.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class IPopupMenu extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPopupMenu
     * @type {Guid}
     */
    static IID => Guid("{4e9bc6dc-880d-47fc-a0a1-72b639e62559}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Commands", "ShowAsync", "ShowAsyncWithRect", "ShowAsyncWithRectAndPlacement"]

    /**
     * @type {IVector<IUICommand>} 
     */
    Commands {
        get => this.get_Commands()
    }

    /**
     * 
     * @returns {IVector<IUICommand>} 
     */
    get_Commands() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IUICommand, value)
    }

    /**
     * 
     * @param {POINT} invocationPoint 
     * @returns {IAsyncOperation<IUICommand>} 
     */
    ShowAsync(invocationPoint) {
        result := ComCall(7, this, "ptr", invocationPoint, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IUICommand, asyncOperation)
    }

    /**
     * 
     * @param {RECT} selection 
     * @returns {IAsyncOperation<IUICommand>} 
     */
    ShowAsyncWithRect(selection) {
        result := ComCall(8, this, "ptr", selection, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IUICommand, asyncOperation)
    }

    /**
     * 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<IUICommand>} 
     */
    ShowAsyncWithRectAndPlacement(selection, preferredPlacement) {
        result := ComCall(9, this, "ptr", selection, "int", preferredPlacement, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IUICommand, asyncOperation)
    }
}
