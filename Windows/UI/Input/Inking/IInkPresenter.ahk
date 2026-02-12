#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkUnprocessedInput.ahk
#Include .\InkStrokeInput.ahk
#Include .\InkInputProcessingConfiguration.ahk
#Include .\InkStrokeContainer.ahk
#Include .\InkDrawingAttributes.ahk
#Include .\InkSynchronizer.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the implementation for a type that generates [InkPresenterRuler](inkpresenterruler.md) objects used in the construction of an [InkPresenter](inkpresenter.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpresenterrulerfactory
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkPresenter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPresenter
     * @type {Guid}
     */
    static IID => Guid("{a69b70e2-887b-458f-b173-4fe4438930a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsInputEnabled", "put_IsInputEnabled", "get_InputDeviceTypes", "put_InputDeviceTypes", "get_UnprocessedInput", "get_StrokeInput", "get_InputProcessingConfiguration", "get_StrokeContainer", "put_StrokeContainer", "CopyDefaultDrawingAttributes", "UpdateDefaultDrawingAttributes", "ActivateCustomDrying", "SetPredefinedConfiguration", "add_StrokesCollected", "remove_StrokesCollected", "add_StrokesErased", "remove_StrokesErased"]

    /**
     * @type {Boolean} 
     */
    IsInputEnabled {
        get => this.get_IsInputEnabled()
        set => this.put_IsInputEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    InputDeviceTypes {
        get => this.get_InputDeviceTypes()
        set => this.put_InputDeviceTypes(value)
    }

    /**
     * @type {InkUnprocessedInput} 
     */
    UnprocessedInput {
        get => this.get_UnprocessedInput()
    }

    /**
     * @type {InkStrokeInput} 
     */
    StrokeInput {
        get => this.get_StrokeInput()
    }

    /**
     * @type {InkInputProcessingConfiguration} 
     */
    InputProcessingConfiguration {
        get => this.get_InputProcessingConfiguration()
    }

    /**
     * @type {InkStrokeContainer} 
     */
    StrokeContainer {
        get => this.get_StrokeContainer()
        set => this.put_StrokeContainer(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInputEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsInputEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputDeviceTypes() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
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
    put_InputDeviceTypes(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InkUnprocessedInput} 
     */
    get_UnprocessedInput() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkUnprocessedInput(value)
    }

    /**
     * 
     * @returns {InkStrokeInput} 
     */
    get_StrokeInput() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkStrokeInput(value)
    }

    /**
     * 
     * @returns {InkInputProcessingConfiguration} 
     */
    get_InputProcessingConfiguration() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkInputProcessingConfiguration(value)
    }

    /**
     * 
     * @returns {InkStrokeContainer} 
     */
    get_StrokeContainer() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkStrokeContainer(value)
    }

    /**
     * 
     * @param {InkStrokeContainer} value 
     * @returns {HRESULT} 
     */
    put_StrokeContainer(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InkDrawingAttributes} 
     */
    CopyDefaultDrawingAttributes() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkDrawingAttributes(value)
    }

    /**
     * 
     * @param {InkDrawingAttributes} value 
     * @returns {HRESULT} 
     */
    UpdateDefaultDrawingAttributes(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InkSynchronizer} 
     */
    ActivateCustomDrying() {
        result := ComCall(17, this, "ptr*", &inkSynchronizer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkSynchronizer(inkSynchronizer_)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPredefinedConfiguration(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InkPresenter, InkStrokesCollectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokesCollected(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StrokesCollected(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(20, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InkPresenter, InkStrokesErasedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokesErased(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(21, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StrokesErased(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(22, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
