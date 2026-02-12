#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionOverload.ahk
#Include .\IActionOverload2.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an overload of an app action.
 * @remarks
 * App actions can be defined with multiple overloads that take different sets of inputs. This class can be used to select and invoke a specific overload of an app action.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionoverload
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class ActionOverload extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionOverload

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionOverload.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the description template for the app action overload.
     * @remarks
     * Each overload of an app action has its own description. The descriptions are defined using a template syntax that allows for the substitution of input variables into the description. For more information on the description template syntax, see [Action definition JSON schema for App Actions on Windows](/windows/ai/app-actions/actions-json).
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionoverload.descriptiontemplate
     * @type {HSTRING} 
     */
    DescriptionTemplate {
        get => this.get_DescriptionTemplate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DescriptionTemplate() {
        if (!this.HasProp("__IActionOverload")) {
            if ((queryResult := this.QueryInterface(IActionOverload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionOverload := IActionOverload(outPtr)
        }

        return this.__IActionOverload.get_DescriptionTemplate()
    }

    /**
     * Gets an array of objects describing the input entities accepted by an app action.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [ActionEntityRegistrationInfo](actionentityregistrationinfo.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionoverload.getinputs
     */
    GetInputs(result_) {
        if (!this.HasProp("__IActionOverload")) {
            if ((queryResult := this.QueryInterface(IActionOverload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionOverload := IActionOverload(outPtr)
        }

        return this.__IActionOverload.GetInputs(result_)
    }

    /**
     * Asynchronously invokes the app action overload.
     * @param {ActionInvocationContext} context_ The action invocation context.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionoverload.invokeasync
     */
    InvokeAsync(context_) {
        if (!this.HasProp("__IActionOverload")) {
            if ((queryResult := this.QueryInterface(IActionOverload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionOverload := IActionOverload(outPtr)
        }

        return this.__IActionOverload.InvokeAsync(context_)
    }

    /**
     * Asynchronously invokes the feedback for the associated action overload.
     * @param {ActionInvocationContext} context_ The invocation context of the associated app action.
     * @param {ActionFeedback} feedback A [ActionFeedback](../windows.ai.actions/actionfeedback.md) object representing the user feedback for an app action.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionoverload.invokefeedbackasync
     */
    InvokeFeedbackAsync(context_, feedback) {
        if (!this.HasProp("__IActionOverload2")) {
            if ((queryResult := this.QueryInterface(IActionOverload2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionOverload2 := IActionOverload2(outPtr)
        }

        return this.__IActionOverload2.InvokeFeedbackAsync(context_, feedback)
    }

    /**
     * Gets a value indicating whether the app action overload supports the app action user feedback mechanism.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionoverload.getsupportsfeedback
     */
    GetSupportsFeedback() {
        if (!this.HasProp("__IActionOverload2")) {
            if ((queryResult := this.QueryInterface(IActionOverload2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionOverload2 := IActionOverload2(outPtr)
        }

        return this.__IActionOverload2.GetSupportsFeedback()
    }

    /**
     * Closes and releases any resources used by this **ActionOverload**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionoverload.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
