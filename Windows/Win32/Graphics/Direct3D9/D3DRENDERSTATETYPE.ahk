#Requires AutoHotkey v2.0.0 64-bit

/**
 * Render states define set-up states for all kinds of vertex and pixel processing.
 * @remarks
 * | Render states        |   Texture sampler                 |
  * |----------------------|--------------------|
  * | ps\_1\_1 to ps\_1\_3 | 4 texture samplers |
  * 
  * 
  * 
  *  
  * 
  * Direct3D defines the D3DRENDERSTATE\_WRAPBIAS constant as a convenience for applications to enable or disable texture wrapping, based on the zero-based integer of a texture coordinate set (rather than explicitly using one of the D3DRS\_WRAP n state values). Add the D3DRENDERSTATE\_WRAPBIAS value to the zero-based index of a texture coordinate set to calculate the D3DRS\_WRAP n value that corresponds to that index, as shown in the following example.
  * 
  * 
  * ```
  * // Enable U/V wrapping for textures that use the texture 
  * // coordinate set at the index within the dwIndex variable
  *     
  * HRESULT hr = pd3dDevice->SetRenderState(
  * dwIndex + D3DRENDERSTATE_WRAPBIAS,  
  * D3DWRAPCOORD_0 | D3DWRAPCOORD_1);
  *      
  * // If dwIndex is 3, the value that results from 
  * // the addition equals D3DRS_WRAP3 (131)
  * ```
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3drenderstatetype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DRENDERSTATETYPE{

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ZENABLE => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_FILLMODE => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_SHADEMODE => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ZWRITEENABLE => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ALPHATESTENABLE => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_LASTPIXEL => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_SRCBLEND => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_DESTBLEND => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_CULLMODE => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ZFUNC => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ALPHAREF => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ALPHAFUNC => 25

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_DITHERENABLE => 26

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ALPHABLENDENABLE => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_FOGENABLE => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_SPECULARENABLE => 29

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_FOGCOLOR => 34

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_FOGTABLEMODE => 35

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_FOGSTART => 36

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_FOGEND => 37

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_FOGDENSITY => 38

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_RANGEFOGENABLE => 48

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_STENCILENABLE => 52

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_STENCILFAIL => 53

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_STENCILZFAIL => 54

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_STENCILPASS => 55

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_STENCILFUNC => 56

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_STENCILREF => 57

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_STENCILMASK => 58

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_STENCILWRITEMASK => 59

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_TEXTUREFACTOR => 60

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP0 => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP1 => 129

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP2 => 130

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP3 => 131

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP4 => 132

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP5 => 133

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP6 => 134

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP7 => 135

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_CLIPPING => 136

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_LIGHTING => 137

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_AMBIENT => 139

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_FOGVERTEXMODE => 140

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_COLORVERTEX => 141

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_LOCALVIEWER => 142

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_NORMALIZENORMALS => 143

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_DIFFUSEMATERIALSOURCE => 145

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_SPECULARMATERIALSOURCE => 146

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_AMBIENTMATERIALSOURCE => 147

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_EMISSIVEMATERIALSOURCE => 148

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_VERTEXBLEND => 151

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_CLIPPLANEENABLE => 152

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_POINTSIZE => 154

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_POINTSIZE_MIN => 155

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_POINTSPRITEENABLE => 156

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_POINTSCALEENABLE => 157

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_POINTSCALE_A => 158

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_POINTSCALE_B => 159

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_POINTSCALE_C => 160

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_MULTISAMPLEANTIALIAS => 161

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_MULTISAMPLEMASK => 162

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_PATCHEDGESTYLE => 163

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_DEBUGMONITORTOKEN => 165

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_POINTSIZE_MAX => 166

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_INDEXEDVERTEXBLENDENABLE => 167

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_COLORWRITEENABLE => 168

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_TWEENFACTOR => 170

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_BLENDOP => 171

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_POSITIONDEGREE => 172

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_NORMALDEGREE => 173

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_SCISSORTESTENABLE => 174

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_SLOPESCALEDEPTHBIAS => 175

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ANTIALIASEDLINEENABLE => 176

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_MINTESSELLATIONLEVEL => 178

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_MAXTESSELLATIONLEVEL => 179

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ADAPTIVETESS_X => 180

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ADAPTIVETESS_Y => 181

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ADAPTIVETESS_Z => 182

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ADAPTIVETESS_W => 183

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_ENABLEADAPTIVETESSELLATION => 184

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_TWOSIDEDSTENCILMODE => 185

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_CCW_STENCILFAIL => 186

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_CCW_STENCILZFAIL => 187

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_CCW_STENCILPASS => 188

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_CCW_STENCILFUNC => 189

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_COLORWRITEENABLE1 => 190

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_COLORWRITEENABLE2 => 191

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_COLORWRITEENABLE3 => 192

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_BLENDFACTOR => 193

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_SRGBWRITEENABLE => 194

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_DEPTHBIAS => 195

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP8 => 198

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP9 => 199

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP10 => 200

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP11 => 201

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP12 => 202

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP13 => 203

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP14 => 204

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_WRAP15 => 205

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_SEPARATEALPHABLENDENABLE => 206

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_SRCBLENDALPHA => 207

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_DESTBLENDALPHA => 208

    /**
     * @type {Integer (Int32)}
     */
    static D3DRS_BLENDOPALPHA => 209
}
