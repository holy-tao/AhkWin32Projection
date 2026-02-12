#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObjectCollection.ahk
#Include .\InkToolbarToolButton.ahk
#Include ..\..\Input\Inking\InkDrawingAttributes.ahk
#Include .\InkCanvas.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include .\InkToolbarToggleButton.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbar extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbar
     * @type {Guid}
     */
    static IID => Guid("{3ddd0cca-51f0-486f-a03e-4ee13dc12bcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InitialControls", "put_InitialControls", "get_Children", "get_ActiveTool", "put_ActiveTool", "get_InkDrawingAttributes", "get_IsRulerButtonChecked", "put_IsRulerButtonChecked", "get_TargetInkCanvas", "put_TargetInkCanvas", "add_ActiveToolChanged", "remove_ActiveToolChanged", "add_InkDrawingAttributesChanged", "remove_InkDrawingAttributesChanged", "add_EraseAllClicked", "remove_EraseAllClicked", "add_IsRulerButtonCheckedChanged", "remove_IsRulerButtonCheckedChanged", "GetToolButton", "GetToggleButton"]

    /**
     * @type {Integer} 
     */
    InitialControls {
        get => this.get_InitialControls()
        set => this.put_InitialControls(value)
    }

    /**
     * @type {DependencyObjectCollection} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * @type {InkToolbarToolButton} 
     */
    ActiveTool {
        get => this.get_ActiveTool()
        set => this.put_ActiveTool(value)
    }

    /**
     * @type {InkDrawingAttributes} 
     */
    InkDrawingAttributes {
        get => this.get_InkDrawingAttributes()
    }

    /**
     * @type {Boolean} 
     */
    IsRulerButtonChecked {
        get => this.get_IsRulerButtonChecked()
        set => this.put_IsRulerButtonChecked(value)
    }

    /**
     * @type {InkCanvas} 
     */
    TargetInkCanvas {
        get => this.get_TargetInkCanvas()
        set => this.put_TargetInkCanvas(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitialControls() {
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
    put_InitialControls(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObjectCollection} 
     */
    get_Children() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObjectCollection(value)
    }

    /**
     * 
     * @returns {InkToolbarToolButton} 
     */
    get_ActiveTool() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkToolbarToolButton(value)
    }

    /**
     * 
     * @param {InkToolbarToolButton} value 
     * @returns {HRESULT} 
     */
    put_ActiveTool(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InkDrawingAttributes} 
     */
    get_InkDrawingAttributes() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkDrawingAttributes(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRulerButtonChecked() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_IsRulerButtonChecked(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InkCanvas} 
     */
    get_TargetInkCanvas() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkCanvas(value)
    }

    /**
     * 
     * @param {InkCanvas} value 
     * @returns {HRESULT} 
     */
    put_TargetInkCanvas(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActiveToolChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
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
    remove_ActiveToolChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InkDrawingAttributesChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", token, "int")
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
    remove_InkDrawingAttributesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EraseAllClicked(handler) {
        token := EventRegistrationToken()
        result := ComCall(20, this, "ptr", handler, "ptr", token, "int")
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
    remove_EraseAllClicked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsRulerButtonCheckedChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(22, this, "ptr", handler, "ptr", token, "int")
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
    remove_IsRulerButtonCheckedChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} tool 
     * @returns {InkToolbarToolButton} 
     */
    GetToolButton(tool) {
        result := ComCall(24, this, "int", tool, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkToolbarToolButton(result_)
    }

    /**
     * 
     * @param {Integer} tool 
     * @returns {InkToolbarToggleButton} 
     */
    GetToggleButton(tool) {
        result := ComCall(25, this, "int", tool, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkToolbarToggleButton(result_)
    }
}
