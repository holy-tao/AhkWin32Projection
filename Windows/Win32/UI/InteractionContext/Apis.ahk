#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\HINTERACTIONCONTEXT.ahk" { HINTERACTIONCONTEXT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INTERACTION_CONTEXT_PROPERTY.ahk" { INTERACTION_CONTEXT_PROPERTY }
#Import "..\Input\Pointer\POINTER_INFO.ahk" { POINTER_INFO }
#Import ".\CROSS_SLIDE_THRESHOLD.ahk" { CROSS_SLIDE_THRESHOLD }
#Import ".\TRANSLATION_PARAMETER.ahk" { TRANSLATION_PARAMETER }
#Import ".\TAP_PARAMETER.ahk" { TAP_PARAMETER }
#Import ".\INERTIA_PARAMETER.ahk" { INERTIA_PARAMETER }
#Import ".\MOUSE_WHEEL_PARAMETER.ahk" { MOUSE_WHEEL_PARAMETER }
#Import ".\HOLD_PARAMETER.ahk" { HOLD_PARAMETER }
#Import ".\CROSS_SLIDE_PARAMETER.ahk" { CROSS_SLIDE_PARAMETER }
#Import ".\INTERACTION_CONTEXT_CONFIGURATION.ahk" { INTERACTION_CONTEXT_CONFIGURATION }
#Import ".\INTERACTION_STATE.ahk" { INTERACTION_STATE }

/**
 * @namespace Windows.Win32.UI.InteractionContext
 */

;@region Functions
/**
 * Creates and initializes an Interaction Context object.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-destroyinteractioncontext">DestroyInteractionContext</a> must be called to destroy any interaction context created by <b>CreateInteractionContext</b>.
 * @returns {HINTERACTIONCONTEXT} Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-createinteractioncontext
 * @since windows8.0
 */
export CreateInteractionContext() {
    interactionContext := HINTERACTIONCONTEXT.Owned()
    result := DllCall("NInput.dll\CreateInteractionContext", HINTERACTIONCONTEXT.Ptr, interactionContext, "HRESULT")
    return interactionContext
}

/**
 * Destroys the specified Interaction Context object.
 * @remarks
 * <b>DestroyInteractionContext</b> must be called to destroy any interaction context created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-createinteractioncontext">CreateInteractionContext</a>.
 * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-destroyinteractioncontext
 * @since windows8.0
 */
export DestroyInteractionContext(interactionContext) {
    result := DllCall("NInput.dll\DestroyInteractionContext", HINTERACTIONCONTEXT, interactionContext, "HRESULT")
    return result
}

/**
 * Registers a callback to receive interaction events from an Interaction Context object.
 * @remarks
 * Each instance of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> is limited to one output callback. Registering a callback function overwrites any existing callback registration for the Interaction Context.
 * 
 * This function is typically called after the creation of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> or when the Interaction Context is reassigned to another UI element.
 * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
 * @param {Pointer<INTERACTION_CONTEXT_OUTPUT_CALLBACK>} outputCallback The callback function.
 * @param {Pointer<Void>} clientData A pointer to an object that contains information about the client. The value typically points to the object for which the member function is called (<b>this</b>).
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-registeroutputcallbackinteractioncontext
 * @since windows8.0
 */
export RegisterOutputCallbackInteractionContext(interactionContext, outputCallback, clientData) {
    clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

    result := DllCall("NInput.dll\RegisterOutputCallbackInteractionContext", HINTERACTIONCONTEXT, interactionContext, "ptr", outputCallback, clientDataMarshal, clientData, "HRESULT")
    return result
}

/**
 * 
 * @param {HINTERACTIONCONTEXT} interactionContext 
 * @param {Pointer<INTERACTION_CONTEXT_OUTPUT_CALLBACK2>} outputCallback 
 * @param {Pointer<Void>} clientData 
 * @returns {HRESULT} 
 */
export RegisterOutputCallbackInteractionContext2(interactionContext, outputCallback, clientData) {
    clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

    result := DllCall("NInput.dll\RegisterOutputCallbackInteractionContext2", HINTERACTIONCONTEXT, interactionContext, "ptr", outputCallback, clientDataMarshal, clientData, "HRESULT")
    return result
}

/**
 * Configures the Interaction Context object to process the specified manipulations.
 * @remarks
 * By default, no configuration flags are set (no interactions are enabled). Each interaction must be explicitly declared.
 * 
 * Configuration changes are applied only to new interactions.
 * @param {HINTERACTIONCONTEXT} interactionContext The handle of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
 * @param {Integer} configurationCount The number of interactions being configured.
 * @param {Pointer<INTERACTION_CONTEXT_CONFIGURATION>} configuration The interactions to enable for this <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-setinteractionconfigurationinteractioncontext
 * @since windows8.0
 */
export SetInteractionConfigurationInteractionContext(interactionContext, configurationCount, configuration) {
    result := DllCall("NInput.dll\SetInteractionConfigurationInteractionContext", HINTERACTIONCONTEXT, interactionContext, "uint", configurationCount, INTERACTION_CONTEXT_CONFIGURATION.Ptr, configuration, "HRESULT")
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
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-getinteractionconfigurationinteractioncontext
 * @since windows8.0
 */
export GetInteractionConfigurationInteractionContext(interactionContext, configurationCount, configuration) {
    result := DllCall("NInput.dll\GetInteractionConfigurationInteractionContext", HINTERACTIONCONTEXT, interactionContext, "uint", configurationCount, INTERACTION_CONTEXT_CONFIGURATION.Ptr, configuration, "HRESULT")
    return result
}

/**
 * Sets Interaction Context object properties.
 * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
 * @param {INTERACTION_CONTEXT_PROPERTY} _contextProperty One of the constants identified by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_context_property">INTERACTION_CONTEXT_PROPERTY</a>.
 * @param {Integer} value The value of the constant identified by <i>contextProperty</i>.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-setpropertyinteractioncontext
 * @since windows8.0
 */
export SetPropertyInteractionContext(interactionContext, _contextProperty, value) {
    result := DllCall("NInput.dll\SetPropertyInteractionContext", HINTERACTIONCONTEXT, interactionContext, INTERACTION_CONTEXT_PROPERTY, _contextProperty, "uint", value, "HRESULT")
    return result
}

/**
 * Gets Interaction Context object properties.
 * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
 * @param {INTERACTION_CONTEXT_PROPERTY} _contextProperty One of the constants identified by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_context_property">INTERACTION_CONTEXT_PROPERTY</a>.
 * @returns {Integer} The value of the property.
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
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-getpropertyinteractioncontext
 * @since windows8.0
 */
export GetPropertyInteractionContext(interactionContext, _contextProperty) {
    result := DllCall("NInput.dll\GetPropertyInteractionContext", HINTERACTIONCONTEXT, interactionContext, INTERACTION_CONTEXT_PROPERTY, _contextProperty, "uint*", &value := 0, "HRESULT")
    return value
}

/**
 * Configures the inertia behavior of a manipulation (translation, rotation, scaling) after the contact is lifted.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> uses the inertia system setting for all manipulations (translation, rotation, scaling). This function overrides the system setting.
 * 
 * To restore the system setting, set <i>value</i> to INERTIA_PARAMETER_INVALID_VALUE    FLT_MAX.
 * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
 * @param {INERTIA_PARAMETER} inertiaParameter One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-inertia_parameter">INERTIA_PARAMETER</a>.
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
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-setinertiaparameterinteractioncontext
 * @since windows8.0
 */
export SetInertiaParameterInteractionContext(interactionContext, inertiaParameter, value) {
    result := DllCall("NInput.dll\SetInertiaParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, INERTIA_PARAMETER, inertiaParameter, "float", value, "HRESULT")
    return result
}

/**
 * Gets the inertia behavior of a manipulation (translation, rotation, scaling).
 * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
 * @param {INERTIA_PARAMETER} inertiaParameter One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-inertia_parameter">INERTIA_PARAMETER</a>.
 * @returns {Float} The value of <i>inertiaParameter</i>. This value is one of the following:
 * 
 * <ul>
 * <li>The rate of deceleration, in radians/ms².</li>
 * <li>For translation, the relative change in screen location, in HIMETRIC units.</li>
 * <li>For rotation, the relative change in angle of rotation, in radians</li>
 * <li>For scaling, the relative change in size, in HIMETRIC units.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-getinertiaparameterinteractioncontext
 * @since windows8.0
 */
export GetInertiaParameterInteractionContext(interactionContext, inertiaParameter) {
    result := DllCall("NInput.dll\GetInertiaParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, INERTIA_PARAMETER, inertiaParameter, "float*", &value := 0, "HRESULT")
    return value
}

/**
 * Configures the cross-slide interaction.
 * @remarks
 * <b>SetCrossSlideParametersInteractionContext</b> fails if a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ns-interactioncontext-cross_slide_parameter">CROSS_SLIDE_PARAMETER</a> is enabled, but not specified  in the <i>crossSlideParameters</i> parameter.
 * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
 * @param {Integer} parameterCount Number of parameters to set.
 * @param {Pointer<CROSS_SLIDE_PARAMETER>} crossSlideParameters The cross-slide threshold and its distance threshold.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-setcrossslideparametersinteractioncontext
 * @since windows8.0
 */
export SetCrossSlideParametersInteractionContext(interactionContext, parameterCount, crossSlideParameters) {
    result := DllCall("NInput.dll\SetCrossSlideParametersInteractionContext", HINTERACTIONCONTEXT, interactionContext, "uint", parameterCount, CROSS_SLIDE_PARAMETER.Ptr, crossSlideParameters, "HRESULT")
    return result
}

/**
 * Gets the cross-slide interaction behavior.
 * @param {HINTERACTIONCONTEXT} interactionContext The handle of the interaction context.
 * @param {CROSS_SLIDE_THRESHOLD} threshold One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-cross_slide_threshold">CROSS_SLIDE_THRESHOLD</a>.
 * @returns {Float} The distance threshold of <i>threshold</i>.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-getcrossslideparameterinteractioncontext
 * @since windows8.0
 */
export GetCrossSlideParameterInteractionContext(interactionContext, threshold) {
    result := DllCall("NInput.dll\GetCrossSlideParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, CROSS_SLIDE_THRESHOLD, threshold, "float*", &distance := 0, "HRESULT")
    return distance
}

/**
 * 
 * @param {HINTERACTIONCONTEXT} interactionContext 
 * @param {TAP_PARAMETER} parameter 
 * @param {Float} value 
 * @returns {HRESULT} 
 */
export SetTapParameterInteractionContext(interactionContext, parameter, value) {
    result := DllCall("NInput.dll\SetTapParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, TAP_PARAMETER, parameter, "float", value, "HRESULT")
    return result
}

/**
 * 
 * @param {HINTERACTIONCONTEXT} interactionContext 
 * @param {TAP_PARAMETER} parameter 
 * @returns {Float} 
 */
export GetTapParameterInteractionContext(interactionContext, parameter) {
    result := DllCall("NInput.dll\GetTapParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, TAP_PARAMETER, parameter, "float*", &value := 0, "HRESULT")
    return value
}

/**
 * 
 * @param {HINTERACTIONCONTEXT} interactionContext 
 * @param {HOLD_PARAMETER} parameter 
 * @param {Float} value 
 * @returns {HRESULT} 
 */
export SetHoldParameterInteractionContext(interactionContext, parameter, value) {
    result := DllCall("NInput.dll\SetHoldParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, HOLD_PARAMETER, parameter, "float", value, "HRESULT")
    return result
}

/**
 * 
 * @param {HINTERACTIONCONTEXT} interactionContext 
 * @param {HOLD_PARAMETER} parameter 
 * @returns {Float} 
 */
export GetHoldParameterInteractionContext(interactionContext, parameter) {
    result := DllCall("NInput.dll\GetHoldParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, HOLD_PARAMETER, parameter, "float*", &value := 0, "HRESULT")
    return value
}

/**
 * 
 * @param {HINTERACTIONCONTEXT} interactionContext 
 * @param {TRANSLATION_PARAMETER} parameter 
 * @param {Float} value 
 * @returns {HRESULT} 
 */
export SetTranslationParameterInteractionContext(interactionContext, parameter, value) {
    result := DllCall("NInput.dll\SetTranslationParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, TRANSLATION_PARAMETER, parameter, "float", value, "HRESULT")
    return result
}

/**
 * 
 * @param {HINTERACTIONCONTEXT} interactionContext 
 * @param {TRANSLATION_PARAMETER} parameter 
 * @returns {Float} 
 */
export GetTranslationParameterInteractionContext(interactionContext, parameter) {
    result := DllCall("NInput.dll\GetTranslationParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, TRANSLATION_PARAMETER, parameter, "float*", &value := 0, "HRESULT")
    return value
}

/**
 * Sets the parameter values for mouse wheel input.
 * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
 * @param {MOUSE_WHEEL_PARAMETER} parameter One of the constants identified by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-mouse_wheel_parameter">MOUSE_WHEEL_PARAMETER</a>.
 * @param {Float} value The value for <i>parameter</i>.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-setmousewheelparameterinteractioncontext
 * @since windows8.0
 */
export SetMouseWheelParameterInteractionContext(interactionContext, parameter, value) {
    result := DllCall("NInput.dll\SetMouseWheelParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, MOUSE_WHEEL_PARAMETER, parameter, "float", value, "HRESULT")
    return result
}

/**
 * Gets the mouse wheel state for the Interaction Context object.
 * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
 * @param {MOUSE_WHEEL_PARAMETER} parameter One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-mouse_wheel_parameter">MOUSE_WHEEL_PARAMETER</a>.
 * @returns {Float} The value of <i>parameter</i>.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-getmousewheelparameterinteractioncontext
 * @since windows8.0
 */
export GetMouseWheelParameterInteractionContext(interactionContext, parameter) {
    result := DllCall("NInput.dll\GetMouseWheelParameterInteractionContext", HINTERACTIONCONTEXT, interactionContext, MOUSE_WHEEL_PARAMETER, parameter, "float*", &value := 0, "HRESULT")
    return value
}

/**
 * Resets the interaction state, interaction configuration settings, and all parameters to their initial state. Current interactions are cancelled without notifications. Interaction Context must be reconfigured before next use.
 * @remarks
 * Useful for managing a pool of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> objects.
 * 
 * Current interactions are cancelled without notifications.
 * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-resetinteractioncontext
 * @since windows8.0
 */
export ResetInteractionContext(interactionContext) {
    result := DllCall("NInput.dll\ResetInteractionContext", HINTERACTIONCONTEXT, interactionContext, "HRESULT")
    return result
}

/**
 * Gets current Interaction Context state and the time when the context will return to idle state.
 * @remarks
 * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
 * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
 * @param {Pointer<POINTER_INFO>} pointerInfo Basic pointer information common to all pointer types.
 * @returns {INTERACTION_STATE} One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_state">INTERACTION_STATE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-getstateinteractioncontext
 * @since windows8.0
 */
export GetStateInteractionContext(interactionContext, pointerInfo) {
    result := DllCall("NInput.dll\GetStateInteractionContext", HINTERACTIONCONTEXT, interactionContext, POINTER_INFO.Ptr, pointerInfo, "int*", &state := 0, "HRESULT")
    return state
}

/**
 * Include the specified pointer in the set of pointers processed by the Interaction Context object.
 * @remarks
 * Turn pointer filtering on by setting INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-setpropertyinteractioncontext">SetPropertyInteractionContext</a>.
 * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
 * @param {Integer} pointerId ID of the pointer.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-addpointerinteractioncontext
 * @since windows8.0
 */
export AddPointerInteractionContext(interactionContext, pointerId) {
    result := DllCall("NInput.dll\AddPointerInteractionContext", HINTERACTIONCONTEXT, interactionContext, "uint", pointerId, "HRESULT")
    return result
}

/**
 * Remove the specified pointer from the set of pointers processed by the Interaction Context object.
 * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
 * @param {Integer} pointerId ID of the pointer.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-removepointerinteractioncontext
 * @since windows8.0
 */
export RemovePointerInteractionContext(interactionContext, pointerId) {
    result := DllCall("NInput.dll\RemovePointerInteractionContext", HINTERACTIONCONTEXT, interactionContext, "uint", pointerId, "HRESULT")
    return result
}

/**
 * Processes a set of pointer input frames.
 * @remarks
 * Output notifications are sent as required.
 * 
 * Frames must be processed in reverse chronological order (most recent data first). 
 * 
 * Each frame must have the same set  of input pointers.
 * 
 * 
 * Each pointer must originate from a different contact.
 * 
 * 
 * If pointer filtering is set, a sub-frame that includes the specified pointers is extracted from each frame. Pointers are specified through  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-addpointerinteractioncontext">AddPointerInteractionContext</a> and pointer filtering turned on by setting INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-setpropertyinteractioncontext">SetPropertyInteractionContext</a>.
 * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
 * @param {Integer} entriesCount Number of frames to process.
 * @param {Integer} pointerCount Number of pointers in each frame.
 * @param {Pointer<POINTER_INFO>} pointerInfo Pointer to the array of frames (of size <i>entriesCount</i>).
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-processpointerframesinteractioncontext
 * @since windows8.0
 */
export ProcessPointerFramesInteractionContext(interactionContext, entriesCount, pointerCount, pointerInfo) {
    result := DllCall("NInput.dll\ProcessPointerFramesInteractionContext", HINTERACTIONCONTEXT, interactionContext, "uint", entriesCount, "uint", pointerCount, POINTER_INFO.Ptr, pointerInfo, "HRESULT")
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
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-bufferpointerpacketsinteractioncontext
 * @since windows8.0
 */
export BufferPointerPacketsInteractionContext(interactionContext, entriesCount, pointerInfo) {
    result := DllCall("NInput.dll\BufferPointerPacketsInteractionContext", HINTERACTIONCONTEXT, interactionContext, "uint", entriesCount, POINTER_INFO.Ptr, pointerInfo, "HRESULT")
    return result
}

/**
 * Process buffered packets at the end of a pointer input frame.
 * @remarks
 * <b>ProcessBufferedPacketsInteractionContext</b> is called at the end of the frame, when the buffer contains all the pointer histories from the frame.
 * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-processbufferedpacketsinteractioncontext
 * @since windows8.0
 */
export ProcessBufferedPacketsInteractionContext(interactionContext) {
    result := DllCall("NInput.dll\ProcessBufferedPacketsInteractionContext", HINTERACTIONCONTEXT, interactionContext, "HRESULT")
    return result
}

/**
 * Sends timer input to the Interaction Context object for inertia processing.
 * @remarks
 * The caller is responsible for creating timer when inertia starts, and for driving inertia input with the timer by calling this function from the timer callback. Recommended timer period is 15 ms.
 * 
 * 
 * 
 * This function has no effect outside inertia.
 * @param {HINTERACTIONCONTEXT} interactionContext Pointer to a handle for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a>.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-processinertiainteractioncontext
 * @since windows8.0
 */
export ProcessInertiaInteractionContext(interactionContext) {
    result := DllCall("NInput.dll\ProcessInertiaInteractionContext", HINTERACTIONCONTEXT, interactionContext, "HRESULT")
    return result
}

/**
 * Sets the interaction state to INTERACTION_STATE_IDLE and leaves all interaction configuration settings and parameters intact.
 * @param {HINTERACTIONCONTEXT} interactionContext Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
 * @returns {HRESULT} If this function succeeds, it returns S_OK.
 *  
 * Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-stopinteractioncontext
 * @since windows8.0
 */
export StopInteractionContext(interactionContext) {
    result := DllCall("NInput.dll\StopInteractionContext", HINTERACTIONCONTEXT, interactionContext, "HRESULT")
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
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-setpivotinteractioncontext
 * @since windows8.0
 */
export SetPivotInteractionContext(interactionContext, x, y, radius) {
    result := DllCall("NInput.dll\SetPivotInteractionContext", HINTERACTIONCONTEXT, interactionContext, "float", x, "float", y, "float", radius, "HRESULT")
    return result
}

;@endregion Functions
