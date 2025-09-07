#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the inertia values for a manipulation (translation, rotation, scaling).
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-inertia_parameter
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class INERTIA_PARAMETER{

    /**
     * The rate of deceleration, in degrees/ms².
     * @type {Integer (Int32)}
     */
    static INERTIA_PARAMETER_TRANSLATION_DECELERATION => 1

    /**
     * The relative change in screen location, in DIPs.
     * @type {Integer (Int32)}
     */
    static INERTIA_PARAMETER_TRANSLATION_DISPLACEMENT => 2

    /**
     * The rate of deceleration, in degrees/ms².
     * @type {Integer (Int32)}
     */
    static INERTIA_PARAMETER_ROTATION_DECELERATION => 3

    /**
     * The relative change in angle of rotation, in radians.
     * @type {Integer (Int32)}
     */
    static INERTIA_PARAMETER_ROTATION_ANGLE => 4

    /**
     * The rate of deceleration, in degrees/ms².
     * @type {Integer (Int32)}
     */
    static INERTIA_PARAMETER_EXPANSION_DECELERATION => 5

    /**
     * The relative change in size, in pixels.
     * @type {Integer (Int32)}
     */
    static INERTIA_PARAMETER_EXPANSION_EXPANSION => 6

    /**
     * Maximum number of interactions exceeded.
     * @type {Integer (Int32)}
     */
    static INERTIA_PARAMETER_MAX => -1
}
