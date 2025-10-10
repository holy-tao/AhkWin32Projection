#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the velocity data of a manipulation.
 * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/ns-interactioncontext-manipulation_velocity
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class MANIPULATION_VELOCITY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The velocity along the x-axis.
     * @type {Float}
     */
    velocityX {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The velocity along the y-axis.
     * @type {Float}
     */
    velocityY {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The velocity expansion.
     * @type {Float}
     */
    velocityExpansion {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The angular velocity.
     * @type {Float}
     */
    velocityAngular {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
