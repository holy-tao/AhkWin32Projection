#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DCOLORVALUE.ahk
#Include ..\Direct3D\D3DVECTOR.ahk

/**
 * Defines a set of lighting properties.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dlight9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DLIGHT9 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Type: **[**D3DLIGHTTYPE**](./d3dlighttype.md)**
     * 
     * 
     * Type of the light source. This value is one of the members of the [**D3DLIGHTTYPE**](./d3dlighttype.md) enumerated type.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Diffuse color emitted by the light. This member is a [**D3DCOLORVALUE**](d3dcolorvalue.md) structure.
     * @type {D3DCOLORVALUE}
     */
    Diffuse{
        get {
            if(!this.HasProp("__Diffuse"))
                this.__Diffuse := D3DCOLORVALUE(8, this)
            return this.__Diffuse
        }
    }

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Specular color emitted by the light. This member is a [**D3DCOLORVALUE**](d3dcolorvalue.md) structure.
     * @type {D3DCOLORVALUE}
     */
    Specular{
        get {
            if(!this.HasProp("__Specular"))
                this.__Specular := D3DCOLORVALUE(24, this)
            return this.__Specular
        }
    }

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Ambient color emitted by the light. This member is a [**D3DCOLORVALUE**](d3dcolorvalue.md) structure.
     * @type {D3DCOLORVALUE}
     */
    Ambient{
        get {
            if(!this.HasProp("__Ambient"))
                this.__Ambient := D3DCOLORVALUE(40, this)
            return this.__Ambient
        }
    }

    /**
     * Type: **[**D3DVECTOR**](d3dvector.md)**
     * 
     * 
     * Position of the light in world space, specified by a [**D3DVECTOR**](d3dvector.md) structure. This member has no meaning for directional lights and is ignored in that case.
     * @type {D3DVECTOR}
     */
    Position{
        get {
            if(!this.HasProp("__Position"))
                this.__Position := D3DVECTOR(56, this)
            return this.__Position
        }
    }

    /**
     * Type: **[**D3DVECTOR**](d3dvector.md)**
     * 
     * 
     * Direction that the light is pointing in world space, specified by a [**D3DVECTOR**](d3dvector.md) structure. This member has meaning only for directional and spotlights. This vector need not be normalized, but it should have a nonzero length.
     * @type {D3DVECTOR}
     */
    Direction{
        get {
            if(!this.HasProp("__Direction"))
                this.__Direction := D3DVECTOR(72, this)
            return this.__Direction
        }
    }

    /**
     * Type: **float**
     * 
     * 
     * Distance beyond which the light has no effect. The maximum allowable value for this member is the square root of FLT\_MAX. This member does not affect directional lights.
     * @type {Float}
     */
    Range {
        get => NumGet(this, 84, "float")
        set => NumPut("float", value, this, 84)
    }

    /**
     * Type: **float**
     * 
     * 
     * Decrease in illumination between a spotlight's inner cone (the angle specified by Theta) and the outer edge of the outer cone (the angle specified by Phi).
     * 
     * The effect of falloff on the lighting is subtle. Furthermore, a small performance penalty is incurred by shaping the falloff curve. For these reasons, most developers set this value to 1.0.
     * @type {Float}
     */
    Falloff {
        get => NumGet(this, 88, "float")
        set => NumPut("float", value, this, 88)
    }

    /**
     * Type: **float**
     * 
     * 
     * Value specifying how the light intensity changes over distance. Attenuation values are ignored for directional lights. This member represents an attenuation constant. For information about attenuation, see [Light Properties (Direct3D 9)](light-properties.md). Valid values for this member range from 0.0 to infinity. For non-directional lights, all three attenuation values should not be set to 0.0 at the same time.
     * @type {Float}
     */
    Attenuation0 {
        get => NumGet(this, 92, "float")
        set => NumPut("float", value, this, 92)
    }

    /**
     * Type: **float**
     * 
     * 
     * Value specifying how the light intensity changes over distance. Attenuation values are ignored for directional lights. This member represents an attenuation constant. For information about attenuation, see [Light Properties (Direct3D 9)](light-properties.md). Valid values for this member range from 0.0 to infinity. For non-directional lights, all three attenuation values should not be set to 0.0 at the same time.
     * @type {Float}
     */
    Attenuation1 {
        get => NumGet(this, 96, "float")
        set => NumPut("float", value, this, 96)
    }

    /**
     * Type: **float**
     * 
     * 
     * Value specifying how the light intensity changes over distance. Attenuation values are ignored for directional lights. This member represents an attenuation constant. For information about attenuation, see [Light Properties (Direct3D 9)](light-properties.md). Valid values for this member range from 0.0 to infinity. For non-directional lights, all three attenuation values should not be set to 0.0 at the same time.
     * @type {Float}
     */
    Attenuation2 {
        get => NumGet(this, 100, "float")
        set => NumPut("float", value, this, 100)
    }

    /**
     * Type: **float**
     * 
     * 
     * Angle, in radians, of a spotlight's inner cone - that is, the fully illuminated spotlight cone. This value must be in the range from 0 through the value specified by Phi.
     * @type {Float}
     */
    Theta {
        get => NumGet(this, 104, "float")
        set => NumPut("float", value, this, 104)
    }

    /**
     * Type: **float**
     * 
     * 
     * Angle, in radians, defining the outer edge of the spotlight's outer cone. Points outside this cone are not lit by the spotlight. This value must be between 0 and pi.
     * @type {Float}
     */
    Phi {
        get => NumGet(this, 108, "float")
        set => NumPut("float", value, this, 108)
    }
}
