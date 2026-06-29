#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DCOLORVALUE.ahk" { D3DCOLORVALUE }
#Import "..\Direct3D\D3DVECTOR.ahk" { D3DVECTOR }
#Import ".\D3DLIGHTTYPE.ahk" { D3DLIGHTTYPE }

/**
 * Defines a set of lighting properties.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dlight9
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DLIGHT9 {
    #StructPack 4

    /**
     * Type: **[**D3DLIGHTTYPE**](./d3dlighttype.md)**
     * 
     * 
     * Type of the light source. This value is one of the members of the [**D3DLIGHTTYPE**](./d3dlighttype.md) enumerated type.
     */
    Type : D3DLIGHTTYPE

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Diffuse color emitted by the light. This member is a [**D3DCOLORVALUE**](d3dcolorvalue.md) structure.
     */
    Diffuse : D3DCOLORVALUE

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Specular color emitted by the light. This member is a [**D3DCOLORVALUE**](d3dcolorvalue.md) structure.
     */
    Specular : D3DCOLORVALUE

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Ambient color emitted by the light. This member is a [**D3DCOLORVALUE**](d3dcolorvalue.md) structure.
     */
    Ambient : D3DCOLORVALUE

    /**
     * Type: **[**D3DVECTOR**](d3dvector.md)**
     * 
     * 
     * Position of the light in world space, specified by a [**D3DVECTOR**](d3dvector.md) structure. This member has no meaning for directional lights and is ignored in that case.
     */
    Position : D3DVECTOR

    /**
     * Type: **[**D3DVECTOR**](d3dvector.md)**
     * 
     * 
     * Direction that the light is pointing in world space, specified by a [**D3DVECTOR**](d3dvector.md) structure. This member has meaning only for directional and spotlights. This vector need not be normalized, but it should have a nonzero length.
     */
    Direction : D3DVECTOR

    /**
     * Type: **float**
     * 
     * 
     * Distance beyond which the light has no effect. The maximum allowable value for this member is the square root of FLT\_MAX. This member does not affect directional lights.
     */
    Range : Float32

    /**
     * Type: **float**
     * 
     * 
     * Decrease in illumination between a spotlight's inner cone (the angle specified by Theta) and the outer edge of the outer cone (the angle specified by Phi).
     * 
     * The effect of falloff on the lighting is subtle. Furthermore, a small performance penalty is incurred by shaping the falloff curve. For these reasons, most developers set this value to 1.0.
     */
    Falloff : Float32

    /**
     * Type: **float**
     * 
     * 
     * Value specifying how the light intensity changes over distance. Attenuation values are ignored for directional lights. This member represents an attenuation constant. For information about attenuation, see [Light Properties (Direct3D 9)](light-properties.md). Valid values for this member range from 0.0 to infinity. For non-directional lights, all three attenuation values should not be set to 0.0 at the same time.
     */
    Attenuation0 : Float32

    /**
     * Type: **float**
     * 
     * 
     * Value specifying how the light intensity changes over distance. Attenuation values are ignored for directional lights. This member represents an attenuation constant. For information about attenuation, see [Light Properties (Direct3D 9)](light-properties.md). Valid values for this member range from 0.0 to infinity. For non-directional lights, all three attenuation values should not be set to 0.0 at the same time.
     */
    Attenuation1 : Float32

    /**
     * Type: **float**
     * 
     * 
     * Value specifying how the light intensity changes over distance. Attenuation values are ignored for directional lights. This member represents an attenuation constant. For information about attenuation, see [Light Properties (Direct3D 9)](light-properties.md). Valid values for this member range from 0.0 to infinity. For non-directional lights, all three attenuation values should not be set to 0.0 at the same time.
     */
    Attenuation2 : Float32

    /**
     * Type: **float**
     * 
     * 
     * Angle, in radians, of a spotlight's inner cone - that is, the fully illuminated spotlight cone. This value must be in the range from 0 through the value specified by Phi.
     */
    Theta : Float32

    /**
     * Type: **float**
     * 
     * 
     * Angle, in radians, defining the outer edge of the spotlight's outer cone. Points outside this cone are not lit by the spotlight. This value must be between 0 and pi.
     */
    Phi : Float32

}
