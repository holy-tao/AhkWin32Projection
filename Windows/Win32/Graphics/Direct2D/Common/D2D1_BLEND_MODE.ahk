#Requires AutoHotkey v2.0.0 64-bit

/**
 * The blend mode used for the Blend effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_blend_mode
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_BLEND_MODE{

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formula for a mutiply effect." src="./images/blend_mode_multiply_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_MULTIPLY => 0

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formula for a screen effect." src="./images/blend_mode_screen_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_SCREEN => 1

    /**
     * Basic blend formula for alpha only.  
 * 
 * <img alt="mathematical formula for a darken effect." src="./images/blend_mode_darken_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_DARKEN => 2

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formula for a lighten effect." src="./images/blend_mode_lighten_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_LIGHTEN => 3

    /**
     * Given:
 *             
 * 
 * <ul>
 * <li>A scene coordinate XY for the current pixel</li>
 * <li>A deterministic pseudo-random number generator rand(XY) based on seed coordinate XY, with unbiased distribution of values from [0, 1]</li>
 * </ul>
 * <img alt="Mathematical formula for a dissolve blend effect." src="./images/blend_mode_dissolve_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_DISSOLVE => 4

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) =  
 * 
 * <img alt="Mathematical formula for a coor burn effect." src="./images/blend_mode_colorburn_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_COLOR_BURN => 5

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) =  
 * 
 * <img alt="Mathematical formula for a linear burn effect." src="./images/blend_mode_linearburn_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_LINEAR_BURN => 6

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formla for a darken color effect." src="./images/blend_mode_darkencolor_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_DARKER_COLOR => 7

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formula for a lighter color effect." src="./images/blend_mode_lightercolor_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_LIGHTER_COLOR => 8

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) =  
 * 
 * <img alt="Mathematical formula for a color dodge effect." src="./images/blend_mode_colordodge_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_COLOR_DODGE => 9

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) = 
 * 
 * <img alt="Mathematical formula for a linear dodge effect." src="./images/blend_mode_lineardodge_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_LINEAR_DODGE => 10

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) = 
 * 
 * <img alt="Mathematical formula for an overlay effect." src="./images/blend_mode_overlay_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_OVERLAY => 11

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) = 
 * 
 * <img alt="Mathematical formula for a soft light effect." src="./images/blend_mode_softlight_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_SOFT_LIGHT => 12

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) = 
 * 
 * <img alt="Mathematical formula for a hard light effect." src="./images/blend_mode_hardlight_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_HARD_LIGHT => 13

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) = 
 * 
 * <img alt="Mathematical formula for a vivid light effect." src="./images/blend_mode_vividlight_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_VIVID_LIGHT => 14

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) = 
 * 
 * <img alt="Mathematical formula for a linear light effect." src="./images/blend_mode_linearlight_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_LINEAR_LIGHT => 15

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) = 
 * 
 * <img alt="Mathematical formula for a pin light effect." src="./images/blend_mode_pinlight_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_PIN_LIGHT => 16

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) = 
 * 
 * <img alt="Mathematical formula for a hard mix effect." src="./images/blend_mode_hardmix_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_HARD_MIX => 17

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) = abs(F<sub>RGB</sub> - B<sub>RGB</sub>)
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_DIFFERENCE => 18

    /**
     * Basic blend formulas with <i>f</i>(F<sub>RGB</sub>, B<sub>RGB</sub>) = F<sub>RGB</sub> + B<sub>RGB</sub> – 2 * F<sub>RGB</sub> * B<sub>RGB</sub>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_EXCLUSION => 19

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formula for a hue blend effect." src="./images/blend_mode_hue_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_HUE => 20

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formula for a sturation blend effect." src="./images/blend_mode_saturation_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_SATURATION => 21

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formula for a color blend effect." src="./images/blend_mode_color_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_COLOR => 22

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formula for a luminosity blend effect." src="./images/blend_mode_luminosity_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_LUMINOSITY => 23

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formula for a subtract blend effect." src="./images/blend_mode_subtract_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_SUBTRACT => 24

    /**
     * Basic blend formula for alpha only. 
 * 
 * <img alt="Mathematical formula for a division blend effect." src="./images/blend_mode_division_1.png"/>
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_MODE_DIVISION => 25
}
