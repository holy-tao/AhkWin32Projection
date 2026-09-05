#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the inertia values for a manipulation (translation, rotation, scaling).
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-inertia_parameter
 * @namespace Windows.Win32.UI.InteractionContext
 */
class INERTIA_PARAMETER extends Win32Enum {

    /**
     * The rate of deceleration, in degrees/ms².
     * Native name: INERTIA_PARAMETER_TRANSLATION_DECELERATION
     * @type {Integer (Int32)}
     */
    static TRANSLATION_DECELERATION => 1

    /**
     * The relative change in screen location, in DIPs.
     * Native name: INERTIA_PARAMETER_TRANSLATION_DISPLACEMENT
     * @type {Integer (Int32)}
     */
    static TRANSLATION_DISPLACEMENT => 2

    /**
     * The rate of deceleration, in degrees/ms².
     * Native name: INERTIA_PARAMETER_ROTATION_DECELERATION
     * @type {Integer (Int32)}
     */
    static ROTATION_DECELERATION => 3

    /**
     * The relative change in angle of rotation, in radians.
     * Native name: INERTIA_PARAMETER_ROTATION_ANGLE
     * @type {Integer (Int32)}
     */
    static ROTATION_ANGLE => 4

    /**
     * The rate of deceleration, in degrees/ms².
     * Native name: INERTIA_PARAMETER_EXPANSION_DECELERATION
     * @type {Integer (Int32)}
     */
    static EXPANSION_DECELERATION => 5

    /**
     * The relative change in size, in pixels.
     * Native name: INERTIA_PARAMETER_EXPANSION_EXPANSION
     * @type {Integer (Int32)}
     */
    static EXPANSION_EXPANSION => 6

    /**
     * Maximum number of interactions exceeded.
     * Native name: INERTIA_PARAMETER_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}
