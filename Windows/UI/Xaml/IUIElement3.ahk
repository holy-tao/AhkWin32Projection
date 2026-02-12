#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include Media\Media3D\Transform3D.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElement3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElement3
     * @type {Guid}
     */
    static IID => Guid("{bc2b28f1-26f2-4aab-b256-3b5350881e37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Transform3D", "put_Transform3D", "get_CanDrag", "put_CanDrag", "add_DragStarting", "remove_DragStarting", "add_DropCompleted", "remove_DropCompleted", "StartDragAsync"]

    /**
     * @type {Transform3D} 
     */
    Transform3D {
        get => this.get_Transform3D()
        set => this.put_Transform3D(value)
    }

    /**
     * @type {Boolean} 
     */
    CanDrag {
        get => this.get_CanDrag()
        set => this.put_CanDrag(value)
    }

    /**
     * 
     * @returns {Transform3D} 
     */
    get_Transform3D() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Transform3D(value)
    }

    /**
     * 
     * @param {Transform3D} value 
     * @returns {HRESULT} 
     */
    put_Transform3D(value) {
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
    get_CanDrag() {
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
    put_CanDrag(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, DragStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, DropCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DropCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DropCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerPoint} pointerPoint_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    StartDragAsync(pointerPoint_) {
        result := ComCall(14, this, "ptr", pointerPoint_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }
}
