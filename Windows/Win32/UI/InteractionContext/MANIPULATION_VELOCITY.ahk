#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the velocity data of a manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ns-interactioncontext-manipulation_velocity
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct MANIPULATION_VELOCITY {
    #StructPack 4

    /**
     * The velocity along the x-axis.
     */
    velocityX : Float32

    /**
     * The velocity along the y-axis.
     */
    velocityY : Float32

    /**
     * The velocity expansion.
     */
    velocityExpansion : Float32

    /**
     * The angular velocity.
     */
    velocityAngular : Float32

}
