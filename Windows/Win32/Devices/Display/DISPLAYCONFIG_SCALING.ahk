#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DISPLAYCONFIG_SCALING enumeration specifies the scaling transformation applied to content displayed on a video present network (VidPN) present path.
 * @remarks
 * For more information about scaling, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/scaling-the-desktop-image">Scaling the Desktop Image</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ne-wingdi-displayconfig_scaling
 * @namespace Windows.Win32.Devices.Display
 */
class DISPLAYCONFIG_SCALING extends Win32Enum {

    /**
     * Indicates the identity transformation; the source content is presented with no change. This transformation is available only if the path's source mode has the same spatial resolution as the path's target mode.
     * Native name: DISPLAYCONFIG_SCALING_IDENTITY
     * @type {Integer (Int32)}
     */
    static IDENTITY => 1

    /**
     * Indicates the centering transformation; the source content is presented unscaled, centered with respect to the spatial resolution of the target mode.
     * Native name: DISPLAYCONFIG_SCALING_CENTERED
     * @type {Integer (Int32)}
     */
    static CENTERED => 2

    /**
     * Indicates the content is scaled to fit the path's target.
     * Native name: DISPLAYCONFIG_SCALING_STRETCHED
     * @type {Integer (Int32)}
     */
    static STRETCHED => 3

    /**
     * Indicates the aspect-ratio centering transformation.
     * Native name: DISPLAYCONFIG_SCALING_ASPECTRATIOCENTEREDMAX
     * @type {Integer (Int32)}
     */
    static ASPECTRATIOCENTEREDMAX => 4

    /**
     * Indicates that the caller requests a custom scaling that the caller cannot describe with any of the other DISPLAYCONFIG_SCALING_XXX values. Only a hardware vendor's value-add application should use DISPLAYCONFIG_SCALING_CUSTOM, because the value-add application might require a private interface to the driver. The application can then use DISPLAYCONFIG_SCALING_CUSTOM to indicate additional context for the driver for the custom value on the specified path.
     * Native name: DISPLAYCONFIG_SCALING_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 5

    /**
     * Indicates that the caller does not have any preference for the scaling. The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setdisplayconfig">SetDisplayConfig</a> function will use the scaling value that was last saved in the database for the path. If such a scaling value does not exist, <b>SetDisplayConfig</b> will use the default scaling for the computer. For example, stretched (DISPLAYCONFIG_SCALING_STRETCHED) for tablet computers and aspect-ratio centered (DISPLAYCONFIG_SCALING_ASPECTRATIOCENTEREDMAX) for non-tablet computers.
     * Native name: DISPLAYCONFIG_SCALING_PREFERRED
     * @type {Integer (Int32)}
     */
    static PREFERRED => 128
}
