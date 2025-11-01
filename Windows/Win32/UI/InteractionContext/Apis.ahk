#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class InteractionContext {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Creates and initializes an Interaction Context object.
     * @param {Pointer<HINTERACTIONCONTEXT>} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-createinteractioncontext
     * @since windows8.0
     */
    static CreateInteractionContext(interactionContext) {
        result := DllCall("NInput.dll\CreateInteractionContext", "ptr", interactionContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Destroys the specified Interaction Context object.
     * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-destroyinteractioncontext
     * @since windows8.0
     */
    static DestroyInteractionContext(interactionContext) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\DestroyInteractionContext", "ptr", interactionContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a callback to receive interaction events from an Interaction Context object.
     * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @param {Pointer<INTERACTION_CONTEXT_OUTPUT_CALLBACK>} outputCallback The callback function.
     * @param {Pointer<Void>} clientData A pointer to an object that contains information about the client. The value typically points to the object for which the member function is called (<b>this</b>).
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-registeroutputcallbackinteractioncontext
     * @since windows8.0
     */
    static RegisterOutputCallbackInteractionContext(interactionContext, outputCallback, clientData) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

        result := DllCall("NInput.dll\RegisterOutputCallbackInteractionContext", "ptr", interactionContext, "ptr", outputCallback, clientDataMarshal, clientData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HINTERACTIONCONTEXT} interactionContext 
     * @param {Pointer<INTERACTION_CONTEXT_OUTPUT_CALLBACK2>} outputCallback 
     * @param {Pointer<Void>} clientData 
     * @returns {HRESULT} 
     */
    static RegisterOutputCallbackInteractionContext2(interactionContext, outputCallback, clientData) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

        result := DllCall("NInput.dll\RegisterOutputCallbackInteractionContext2", "ptr", interactionContext, "ptr", outputCallback, clientDataMarshal, clientData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Configures the Interaction Context object to process the specified manipulations.
     * @param {HINTERACTIONCONTEXT} interactionContext The handle of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @param {Integer} configurationCount The number of interactions being configured.
     * @param {Pointer<INTERACTION_CONTEXT_CONFIGURATION>} configuration The interactions to enable for this <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-setinteractionconfigurationinteractioncontext
     * @since windows8.0
     */
    static SetInteractionConfigurationInteractionContext(interactionContext, configurationCount, configuration) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\SetInteractionConfigurationInteractionContext", "ptr", interactionContext, "uint", configurationCount, "ptr", configuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets interaction configuration state for the Interaction Context object.
     * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @param {Integer} configurationCount Number of interaction configurations.
     * @param {Pointer<INTERACTION_CONTEXT_CONFIGURATION>} configuration The interactions enabled for this <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-getinteractionconfigurationinteractioncontext
     * @since windows8.0
     */
    static GetInteractionConfigurationInteractionContext(interactionContext, configurationCount, configuration) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\GetInteractionConfigurationInteractionContext", "ptr", interactionContext, "uint", configurationCount, "ptr", configuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets Interaction Context object properties.
     * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * @param {Integer} contextProperty One of the constants identified by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_context_property">INTERACTION_CONTEXT_PROPERTY</a>.
     * @param {Integer} value The value of the constant identified by <i>contextProperty</i>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-setpropertyinteractioncontext
     * @since windows8.0
     */
    static SetPropertyInteractionContext(interactionContext, contextProperty, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\SetPropertyInteractionContext", "ptr", interactionContext, "int", contextProperty, "uint", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets Interaction Context object properties.
     * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * @param {Integer} contextProperty One of the constants identified by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_context_property">INTERACTION_CONTEXT_PROPERTY</a>.
     * @param {Pointer<Integer>} value The value of the property.
     * 
     * Valid values for <i>contextProperty</i> are:
     * 
     * <table>
     * <tr>
     * <th>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_context_property">INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS</a>
     * </th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS_HIMETRIC"></a><a id="interaction_context_property_measurement_units_himetric"></a><dl>
     * <dt><b>INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS_HIMETRIC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Measurement units are HIMETRIC  units (0.01 mm).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS_SCREEN"></a><a id="interaction_context_property_measurement_units_screen"></a><dl>
     * <dt><b>INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS_SCREEN</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Measurement units are screen pixels. This is the default value.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_context_property">INTERACTION_CONTEXT_PROPERTY_UI_FEEDBACK</a>
     * </th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERACTION_CONTEXT_PROPERTY_UI_FEEDBACK_OFF"></a><a id="interaction_context_property_ui_feedback_off"></a><dl>
     * <dt><b>INTERACTION_CONTEXT_PROPERTY_UI_FEEDBACK_OFF</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Visual feedback for user interactions is disabled (the caller is responsible for displaying visual feedback). For more info, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_feedback/input-feedback-configuration-portal">Input Feedback Configuration</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERACTION_CONTEXT_PROPERTY_UI_FEEDBACK_ON"></a><a id="interaction_context_property_ui_feedback_on"></a><dl>
     * <dt><b>INTERACTION_CONTEXT_PROPERTY_UI_FEEDBACK_ON</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Visual feedback for user interactions is enabled. This is the default value. For more info, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_feedback/input-feedback-configuration-portal">Input Feedback Configuration</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS_OFF"></a><a id="interaction_context_property_filter_pointers_off"></a><dl>
     * <dt><b>INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS_OFF</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer filtering is disabled (all pointer input data is processed).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS_ON"></a><a id="interaction_context_property_filter_pointers_on"></a><dl>
     * <dt><b>INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS_ON</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer filtering is enabled (only pointers specified through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-addpointerinteractioncontext">AddPointerInteractionContext</a> are processed). This is the default value. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-getpropertyinteractioncontext
     * @since windows8.0
     */
    static GetPropertyInteractionContext(interactionContext, contextProperty, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := DllCall("NInput.dll\GetPropertyInteractionContext", "ptr", interactionContext, "int", contextProperty, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Configures the inertia behavior of a manipulation (translation, rotation, scaling) after the contact is lifted.
     * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
     * @param {Integer} inertiaParameter One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-inertia_parameter">INERTIA_PARAMETER</a>.
     * @param {Float} value One of the following:
     * 
     * <ul>
     * <li>The rate of deceleration, in radians/ms².</li>
     * <li>For translation, the relative change in screen location, in HIMETRIC units.</li>
     * <li>For rotation, the relative change in angle of rotation, in radianx</li>
     * <li>For scaling, the relative change in size, in HIMETRIC units.</li>
     * </ul>
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-setinertiaparameterinteractioncontext
     * @since windows8.0
     */
    static SetInertiaParameterInteractionContext(interactionContext, inertiaParameter, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\SetInertiaParameterInteractionContext", "ptr", interactionContext, "int", inertiaParameter, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the inertia behavior of a manipulation (translation, rotation, scaling).
     * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
     * @param {Integer} inertiaParameter One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-inertia_parameter">INERTIA_PARAMETER</a>.
     * @param {Pointer<Float>} value The value of <i>inertiaParameter</i>. This value is one of the following:
     * 
     * <ul>
     * <li>The rate of deceleration, in radians/ms².</li>
     * <li>For translation, the relative change in screen location, in HIMETRIC units.</li>
     * <li>For rotation, the relative change in angle of rotation, in radians</li>
     * <li>For scaling, the relative change in size, in HIMETRIC units.</li>
     * </ul>
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-getinertiaparameterinteractioncontext
     * @since windows8.0
     */
    static GetInertiaParameterInteractionContext(interactionContext, inertiaParameter, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        valueMarshal := value is VarRef ? "float*" : "ptr"

        result := DllCall("NInput.dll\GetInertiaParameterInteractionContext", "ptr", interactionContext, "int", inertiaParameter, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Configures the cross-slide interaction.
     * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
     * @param {Integer} parameterCount Number of parameters to set.
     * @param {Pointer<CROSS_SLIDE_PARAMETER>} crossSlideParameters The cross-slide threshold and its distance threshold.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-setcrossslideparametersinteractioncontext
     * @since windows8.0
     */
    static SetCrossSlideParametersInteractionContext(interactionContext, parameterCount, crossSlideParameters) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\SetCrossSlideParametersInteractionContext", "ptr", interactionContext, "uint", parameterCount, "ptr", crossSlideParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the cross-slide interaction behavior.
     * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
     * @param {Integer} threshold One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-cross_slide_threshold">CROSS_SLIDE_THRESHOLD</a>.
     * @param {Pointer<Float>} distance The distance threshold of <i>threshold</i>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-getcrossslideparameterinteractioncontext
     * @since windows8.0
     */
    static GetCrossSlideParameterInteractionContext(interactionContext, threshold, distance) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        distanceMarshal := distance is VarRef ? "float*" : "ptr"

        result := DllCall("NInput.dll\GetCrossSlideParameterInteractionContext", "ptr", interactionContext, "int", threshold, distanceMarshal, distance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HINTERACTIONCONTEXT} interactionContext 
     * @param {Integer} parameter 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    static SetTapParameterInteractionContext(interactionContext, parameter, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\SetTapParameterInteractionContext", "ptr", interactionContext, "int", parameter, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HINTERACTIONCONTEXT} interactionContext 
     * @param {Integer} parameter 
     * @param {Pointer<Float>} value 
     * @returns {HRESULT} 
     */
    static GetTapParameterInteractionContext(interactionContext, parameter, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        valueMarshal := value is VarRef ? "float*" : "ptr"

        result := DllCall("NInput.dll\GetTapParameterInteractionContext", "ptr", interactionContext, "int", parameter, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HINTERACTIONCONTEXT} interactionContext 
     * @param {Integer} parameter 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    static SetHoldParameterInteractionContext(interactionContext, parameter, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\SetHoldParameterInteractionContext", "ptr", interactionContext, "int", parameter, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HINTERACTIONCONTEXT} interactionContext 
     * @param {Integer} parameter 
     * @param {Pointer<Float>} value 
     * @returns {HRESULT} 
     */
    static GetHoldParameterInteractionContext(interactionContext, parameter, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        valueMarshal := value is VarRef ? "float*" : "ptr"

        result := DllCall("NInput.dll\GetHoldParameterInteractionContext", "ptr", interactionContext, "int", parameter, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HINTERACTIONCONTEXT} interactionContext 
     * @param {Integer} parameter 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    static SetTranslationParameterInteractionContext(interactionContext, parameter, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\SetTranslationParameterInteractionContext", "ptr", interactionContext, "int", parameter, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HINTERACTIONCONTEXT} interactionContext 
     * @param {Integer} parameter 
     * @param {Pointer<Float>} value 
     * @returns {HRESULT} 
     */
    static GetTranslationParameterInteractionContext(interactionContext, parameter, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        valueMarshal := value is VarRef ? "float*" : "ptr"

        result := DllCall("NInput.dll\GetTranslationParameterInteractionContext", "ptr", interactionContext, "int", parameter, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the parameter values for mouse wheel input.
     * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @param {Integer} parameter One of the constants identified by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-mouse_wheel_parameter">MOUSE_WHEEL_PARAMETER</a>.
     * @param {Float} value The value for <i>parameter</i>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-setmousewheelparameterinteractioncontext
     * @since windows8.0
     */
    static SetMouseWheelParameterInteractionContext(interactionContext, parameter, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\SetMouseWheelParameterInteractionContext", "ptr", interactionContext, "int", parameter, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the mouse wheel state for the Interaction Context object.
     * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @param {Integer} parameter One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-mouse_wheel_parameter">MOUSE_WHEEL_PARAMETER</a>.
     * @param {Pointer<Float>} value The value of <i>parameter</i>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-getmousewheelparameterinteractioncontext
     * @since windows8.0
     */
    static GetMouseWheelParameterInteractionContext(interactionContext, parameter, value) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        valueMarshal := value is VarRef ? "float*" : "ptr"

        result := DllCall("NInput.dll\GetMouseWheelParameterInteractionContext", "ptr", interactionContext, "int", parameter, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Resets the interaction state, interaction configuration settings, and all parameters to their initial state. Current interactions are cancelled without notifications. Interaction Context must be reconfigured before next use.
     * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-resetinteractioncontext
     * @since windows8.0
     */
    static ResetInteractionContext(interactionContext) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\ResetInteractionContext", "ptr", interactionContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @param {Pointer<POINTER_INFO>} pointerInfo Basic pointer information common to all pointer types.
     * @param {Pointer<Integer>} state One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_state">INTERACTION_STATE</a>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-getstateinteractioncontext
     * @since windows8.0
     */
    static GetStateInteractionContext(interactionContext, pointerInfo, state) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        stateMarshal := state is VarRef ? "int*" : "ptr"

        result := DllCall("NInput.dll\GetStateInteractionContext", "ptr", interactionContext, "ptr", pointerInfo, stateMarshal, state, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Include the specified pointer in the set of pointers processed by the Interaction Context object.
     * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * @param {Integer} pointerId ID of the pointer.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-addpointerinteractioncontext
     * @since windows8.0
     */
    static AddPointerInteractionContext(interactionContext, pointerId) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\AddPointerInteractionContext", "ptr", interactionContext, "uint", pointerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Remove the specified pointer from the set of pointers processed by the Interaction Context object.
     * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * @param {Integer} pointerId ID of the pointer.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-removepointerinteractioncontext
     * @since windows8.0
     */
    static RemovePointerInteractionContext(interactionContext, pointerId) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\RemovePointerInteractionContext", "ptr", interactionContext, "uint", pointerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Processes a set of pointer input frames.
     * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @param {Integer} entriesCount Number of frames to process.
     * @param {Integer} pointerCount Number of pointers in each frame.
     * @param {Pointer<POINTER_INFO>} pointerInfo Pointer to the array of frames (of size <i>entriesCount</i>).
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-processpointerframesinteractioncontext
     * @since windows8.0
     */
    static ProcessPointerFramesInteractionContext(interactionContext, entriesCount, pointerCount, pointerInfo) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\ProcessPointerFramesInteractionContext", "ptr", interactionContext, "uint", entriesCount, "uint", pointerCount, "ptr", pointerInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds the history for a single input pointer to the buffer of the Interaction Context object.
     * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
     * @param {Integer} entriesCount The number of entries in the pointer history.
     * @param {Pointer<POINTER_INFO>} pointerInfo Basic pointer information common to all pointer types.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-bufferpointerpacketsinteractioncontext
     * @since windows8.0
     */
    static BufferPointerPacketsInteractionContext(interactionContext, entriesCount, pointerInfo) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\BufferPointerPacketsInteractionContext", "ptr", interactionContext, "uint", entriesCount, "ptr", pointerInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Process buffered packets at the end of a pointer input frame.
     * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-processbufferedpacketsinteractioncontext
     * @since windows8.0
     */
    static ProcessBufferedPacketsInteractionContext(interactionContext) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\ProcessBufferedPacketsInteractionContext", "ptr", interactionContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sends timer input to the Interaction Context object for inertia processing.
     * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-processinertiainteractioncontext
     * @since windows8.0
     */
    static ProcessInertiaInteractionContext(interactionContext) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\ProcessInertiaInteractionContext", "ptr", interactionContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the interaction state to INTERACTION_STATE_IDLE and leaves all interaction configuration settings and parameters intact.
     * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-stopinteractioncontext
     * @since windows8.0
     */
    static StopInteractionContext(interactionContext) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\StopInteractionContext", "ptr", interactionContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the center point, and the pivot radius from the center point, for a rotation manipulation using a single input pointer.
     * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
     * @param {Float} x The x-coordinate for the screen location of the center point.
     * @param {Float} y The y-coordinate for the screen location of the center point.
     * @param {Float} radius The offset between the center point and the single input pointer, in HIMETRIC units.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/nf-interactioncontext-setpivotinteractioncontext
     * @since windows8.0
     */
    static SetPivotInteractionContext(interactionContext, x, y, radius) {
        interactionContext := interactionContext is Win32Handle ? NumGet(interactionContext, "ptr") : interactionContext

        result := DllCall("NInput.dll\SetPivotInteractionContext", "ptr", interactionContext, "float", x, "float", y, "float", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
