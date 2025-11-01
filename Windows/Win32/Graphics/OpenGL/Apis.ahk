#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\HGLRC.ahk
#Include ..\Gdi\HDC.ahk

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 * @version v4.0.30319
 */
class OpenGL {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERSION_1_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ACCUM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LOAD => 257

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RETURN => 258

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MULT => 259

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ADD => 260

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NEVER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LESS => 513

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EQUAL => 514

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LEQUAL => 515

    /**
     * @type {Integer (UInt32)}
     */
    static GL_GREATER => 516

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NOTEQUAL => 517

    /**
     * @type {Integer (UInt32)}
     */
    static GL_GEQUAL => 518

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALWAYS => 519

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POINT_BIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_BIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_BIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_STIPPLE_BIT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MODE_BIT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHTING_BIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FOG_BIT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH_BUFFER_BIT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ACCUM_BUFFER_BIT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_BUFFER_BIT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VIEWPORT_BIT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TRANSFORM_BIT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ENABLE_BIT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_BUFFER_BIT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static GL_HINT_BIT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EVAL_BIT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIST_BIT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_BIT => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SCISSOR_BIT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALL_ATTRIB_BITS => 1048575

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POINTS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_LOOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_STRIP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TRIANGLES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TRIANGLE_STRIP => 5

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TRIANGLE_FAN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static GL_QUADS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static GL_QUAD_STRIP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON => 9

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ZERO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SRC_COLOR => 768

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ONE_MINUS_SRC_COLOR => 769

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SRC_ALPHA => 770

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ONE_MINUS_SRC_ALPHA => 771

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DST_ALPHA => 772

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ONE_MINUS_DST_ALPHA => 773

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DST_COLOR => 774

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ONE_MINUS_DST_COLOR => 775

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SRC_ALPHA_SATURATE => 776

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TRUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FALSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLIP_PLANE0 => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLIP_PLANE1 => 12289

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLIP_PLANE2 => 12290

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLIP_PLANE3 => 12291

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLIP_PLANE4 => 12292

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLIP_PLANE5 => 12293

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BYTE => 5120

    /**
     * @type {Integer (UInt32)}
     */
    static GL_UNSIGNED_BYTE => 5121

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SHORT => 5122

    /**
     * @type {Integer (UInt32)}
     */
    static GL_UNSIGNED_SHORT => 5123

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INT => 5124

    /**
     * @type {Integer (UInt32)}
     */
    static GL_UNSIGNED_INT => 5125

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FLOAT => 5126

    /**
     * @type {Integer (UInt32)}
     */
    static GL_2_BYTES => 5127

    /**
     * @type {Integer (UInt32)}
     */
    static GL_3_BYTES => 5128

    /**
     * @type {Integer (UInt32)}
     */
    static GL_4_BYTES => 5129

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DOUBLE => 5130

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FRONT_LEFT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FRONT_RIGHT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BACK_LEFT => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BACK_RIGHT => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FRONT => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BACK => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LEFT => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RIGHT => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FRONT_AND_BACK => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AUX0 => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AUX1 => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AUX2 => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AUX3 => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NO_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INVALID_ENUM => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INVALID_VALUE => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INVALID_OPERATION => 1282

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STACK_OVERFLOW => 1283

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STACK_UNDERFLOW => 1284

    /**
     * @type {Integer (UInt32)}
     */
    static GL_OUT_OF_MEMORY => 1285

    /**
     * @type {Integer (UInt32)}
     */
    static GL_2D => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static GL_3D => 1537

    /**
     * @type {Integer (UInt32)}
     */
    static GL_3D_COLOR => 1538

    /**
     * @type {Integer (UInt32)}
     */
    static GL_3D_COLOR_TEXTURE => 1539

    /**
     * @type {Integer (UInt32)}
     */
    static GL_4D_COLOR_TEXTURE => 1540

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PASS_THROUGH_TOKEN => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POINT_TOKEN => 1793

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_TOKEN => 1794

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_TOKEN => 1795

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BITMAP_TOKEN => 1796

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DRAW_PIXEL_TOKEN => 1797

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COPY_PIXEL_TOKEN => 1798

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_RESET_TOKEN => 1799

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EXP => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EXP2 => 2049

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CW => 2304

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CCW => 2305

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COEFF => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ORDER => 2561

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DOMAIN => 2562

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_COLOR => 2816

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_INDEX => 2817

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_NORMAL => 2818

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_TEXTURE_COORDS => 2819

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_RASTER_COLOR => 2820

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_RASTER_INDEX => 2821

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_RASTER_TEXTURE_COORDS => 2822

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_RASTER_POSITION => 2823

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_RASTER_POSITION_VALID => 2824

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CURRENT_RASTER_DISTANCE => 2825

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POINT_SMOOTH => 2832

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POINT_SIZE => 2833

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POINT_SIZE_RANGE => 2834

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POINT_SIZE_GRANULARITY => 2835

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_SMOOTH => 2848

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_WIDTH => 2849

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_WIDTH_RANGE => 2850

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_WIDTH_GRANULARITY => 2851

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_STIPPLE => 2852

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_STIPPLE_PATTERN => 2853

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_STIPPLE_REPEAT => 2854

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIST_MODE => 2864

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_LIST_NESTING => 2865

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIST_BASE => 2866

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIST_INDEX => 2867

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_MODE => 2880

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_SMOOTH => 2881

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_STIPPLE => 2882

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EDGE_FLAG => 2883

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CULL_FACE => 2884

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CULL_FACE_MODE => 2885

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FRONT_FACE => 2886

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHTING => 2896

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT_MODEL_LOCAL_VIEWER => 2897

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT_MODEL_TWO_SIDE => 2898

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT_MODEL_AMBIENT => 2899

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SHADE_MODEL => 2900

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_MATERIAL_FACE => 2901

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_MATERIAL_PARAMETER => 2902

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_MATERIAL => 2903

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FOG => 2912

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FOG_INDEX => 2913

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FOG_DENSITY => 2914

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FOG_START => 2915

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FOG_END => 2916

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FOG_MODE => 2917

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FOG_COLOR => 2918

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH_RANGE => 2928

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH_TEST => 2929

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH_WRITEMASK => 2930

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH_CLEAR_VALUE => 2931

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH_FUNC => 2932

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ACCUM_CLEAR_VALUE => 2944

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_TEST => 2960

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_CLEAR_VALUE => 2961

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_FUNC => 2962

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_VALUE_MASK => 2963

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_FAIL => 2964

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_PASS_DEPTH_FAIL => 2965

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_PASS_DEPTH_PASS => 2966

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_REF => 2967

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_WRITEMASK => 2968

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MATRIX_MODE => 2976

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NORMALIZE => 2977

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VIEWPORT => 2978

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MODELVIEW_STACK_DEPTH => 2979

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PROJECTION_STACK_DEPTH => 2980

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_STACK_DEPTH => 2981

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MODELVIEW_MATRIX => 2982

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PROJECTION_MATRIX => 2983

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_MATRIX => 2984

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ATTRIB_STACK_DEPTH => 2992

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLIENT_ATTRIB_STACK_DEPTH => 2993

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA_TEST => 3008

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA_TEST_FUNC => 3009

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA_TEST_REF => 3010

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DITHER => 3024

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BLEND_DST => 3040

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BLEND_SRC => 3041

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BLEND => 3042

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LOGIC_OP_MODE => 3056

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_LOGIC_OP => 3057

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_LOGIC_OP => 3058

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AUX_BUFFERS => 3072

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DRAW_BUFFER => 3073

    /**
     * @type {Integer (UInt32)}
     */
    static GL_READ_BUFFER => 3074

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SCISSOR_BOX => 3088

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SCISSOR_TEST => 3089

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_CLEAR_VALUE => 3104

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_WRITEMASK => 3105

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_CLEAR_VALUE => 3106

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_WRITEMASK => 3107

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_MODE => 3120

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGBA_MODE => 3121

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DOUBLEBUFFER => 3122

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STEREO => 3123

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RENDER_MODE => 3136

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PERSPECTIVE_CORRECTION_HINT => 3152

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POINT_SMOOTH_HINT => 3153

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE_SMOOTH_HINT => 3154

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_SMOOTH_HINT => 3155

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FOG_HINT => 3156

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_GEN_S => 3168

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_GEN_T => 3169

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_GEN_R => 3170

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_GEN_Q => 3171

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_I_TO_I => 3184

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_S_TO_S => 3185

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_I_TO_R => 3186

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_I_TO_G => 3187

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_I_TO_B => 3188

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_I_TO_A => 3189

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_R_TO_R => 3190

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_G_TO_G => 3191

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_B_TO_B => 3192

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_A_TO_A => 3193

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_I_TO_I_SIZE => 3248

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_S_TO_S_SIZE => 3249

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_I_TO_R_SIZE => 3250

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_I_TO_G_SIZE => 3251

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_I_TO_B_SIZE => 3252

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_I_TO_A_SIZE => 3253

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_R_TO_R_SIZE => 3254

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_G_TO_G_SIZE => 3255

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_B_TO_B_SIZE => 3256

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PIXEL_MAP_A_TO_A_SIZE => 3257

    /**
     * @type {Integer (UInt32)}
     */
    static GL_UNPACK_SWAP_BYTES => 3312

    /**
     * @type {Integer (UInt32)}
     */
    static GL_UNPACK_LSB_FIRST => 3313

    /**
     * @type {Integer (UInt32)}
     */
    static GL_UNPACK_ROW_LENGTH => 3314

    /**
     * @type {Integer (UInt32)}
     */
    static GL_UNPACK_SKIP_ROWS => 3315

    /**
     * @type {Integer (UInt32)}
     */
    static GL_UNPACK_SKIP_PIXELS => 3316

    /**
     * @type {Integer (UInt32)}
     */
    static GL_UNPACK_ALIGNMENT => 3317

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PACK_SWAP_BYTES => 3328

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PACK_LSB_FIRST => 3329

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PACK_ROW_LENGTH => 3330

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PACK_SKIP_ROWS => 3331

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PACK_SKIP_PIXELS => 3332

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PACK_ALIGNMENT => 3333

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP_COLOR => 3344

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP_STENCIL => 3345

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_SHIFT => 3346

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_OFFSET => 3347

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RED_SCALE => 3348

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RED_BIAS => 3349

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ZOOM_X => 3350

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ZOOM_Y => 3351

    /**
     * @type {Integer (UInt32)}
     */
    static GL_GREEN_SCALE => 3352

    /**
     * @type {Integer (UInt32)}
     */
    static GL_GREEN_BIAS => 3353

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BLUE_SCALE => 3354

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BLUE_BIAS => 3355

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA_SCALE => 3356

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA_BIAS => 3357

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH_SCALE => 3358

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH_BIAS => 3359

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_EVAL_ORDER => 3376

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_LIGHTS => 3377

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_CLIP_PLANES => 3378

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_TEXTURE_SIZE => 3379

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_PIXEL_MAP_TABLE => 3380

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_ATTRIB_STACK_DEPTH => 3381

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_MODELVIEW_STACK_DEPTH => 3382

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_NAME_STACK_DEPTH => 3383

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_PROJECTION_STACK_DEPTH => 3384

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_TEXTURE_STACK_DEPTH => 3385

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_VIEWPORT_DIMS => 3386

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_CLIENT_ATTRIB_STACK_DEPTH => 3387

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SUBPIXEL_BITS => 3408

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_BITS => 3409

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RED_BITS => 3410

    /**
     * @type {Integer (UInt32)}
     */
    static GL_GREEN_BITS => 3411

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BLUE_BITS => 3412

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA_BITS => 3413

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH_BITS => 3414

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_BITS => 3415

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ACCUM_RED_BITS => 3416

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ACCUM_GREEN_BITS => 3417

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ACCUM_BLUE_BITS => 3418

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ACCUM_ALPHA_BITS => 3419

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NAME_STACK_DEPTH => 3440

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AUTO_NORMAL => 3456

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_COLOR_4 => 3472

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_INDEX => 3473

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_NORMAL => 3474

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_TEXTURE_COORD_1 => 3475

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_TEXTURE_COORD_2 => 3476

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_TEXTURE_COORD_3 => 3477

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_TEXTURE_COORD_4 => 3478

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_VERTEX_3 => 3479

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_VERTEX_4 => 3480

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_COLOR_4 => 3504

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_INDEX => 3505

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_NORMAL => 3506

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_TEXTURE_COORD_1 => 3507

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_TEXTURE_COORD_2 => 3508

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_TEXTURE_COORD_3 => 3509

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_TEXTURE_COORD_4 => 3510

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_VERTEX_3 => 3511

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_VERTEX_4 => 3512

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_GRID_DOMAIN => 3536

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP1_GRID_SEGMENTS => 3537

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_GRID_DOMAIN => 3538

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAP2_GRID_SEGMENTS => 3539

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_1D => 3552

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_2D => 3553

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FEEDBACK_BUFFER_POINTER => 3568

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FEEDBACK_BUFFER_SIZE => 3569

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FEEDBACK_BUFFER_TYPE => 3570

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SELECTION_BUFFER_POINTER => 3571

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SELECTION_BUFFER_SIZE => 3572

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_WIDTH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_HEIGHT => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_INTERNAL_FORMAT => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_BORDER_COLOR => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_BORDER => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DONT_CARE => 4352

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FASTEST => 4353

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NICEST => 4354

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT0 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT1 => 16385

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT2 => 16386

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT3 => 16387

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT4 => 16388

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT5 => 16389

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT6 => 16390

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LIGHT7 => 16391

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AMBIENT => 4608

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DIFFUSE => 4609

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SPECULAR => 4610

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POSITION => 4611

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SPOT_DIRECTION => 4612

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SPOT_EXPONENT => 4613

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SPOT_CUTOFF => 4614

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CONSTANT_ATTENUATION => 4615

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINEAR_ATTENUATION => 4616

    /**
     * @type {Integer (UInt32)}
     */
    static GL_QUADRATIC_ATTENUATION => 4617

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COMPILE => 4864

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COMPILE_AND_EXECUTE => 4865

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLEAR => 5376

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AND => 5377

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AND_REVERSE => 5378

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COPY => 5379

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AND_INVERTED => 5380

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NOOP => 5381

    /**
     * @type {Integer (UInt32)}
     */
    static GL_XOR => 5382

    /**
     * @type {Integer (UInt32)}
     */
    static GL_OR => 5383

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NOR => 5384

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EQUIV => 5385

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INVERT => 5386

    /**
     * @type {Integer (UInt32)}
     */
    static GL_OR_REVERSE => 5387

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COPY_INVERTED => 5388

    /**
     * @type {Integer (UInt32)}
     */
    static GL_OR_INVERTED => 5389

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NAND => 5390

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SET => 5391

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EMISSION => 5632

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SHININESS => 5633

    /**
     * @type {Integer (UInt32)}
     */
    static GL_AMBIENT_AND_DIFFUSE => 5634

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_INDEXES => 5635

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MODELVIEW => 5888

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PROJECTION => 5889

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE => 5890

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR => 6144

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH => 6145

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL => 6146

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_INDEX => 6400

    /**
     * @type {Integer (UInt32)}
     */
    static GL_STENCIL_INDEX => 6401

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DEPTH_COMPONENT => 6402

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RED => 6403

    /**
     * @type {Integer (UInt32)}
     */
    static GL_GREEN => 6404

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BLUE => 6405

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA => 6406

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGB => 6407

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGBA => 6408

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE => 6409

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE_ALPHA => 6410

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BITMAP => 6656

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POINT => 6912

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINE => 6913

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FILL => 6914

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RENDER => 7168

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FEEDBACK => 7169

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SELECT => 7170

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FLAT => 7424

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SMOOTH => 7425

    /**
     * @type {Integer (UInt32)}
     */
    static GL_KEEP => 7680

    /**
     * @type {Integer (UInt32)}
     */
    static GL_REPLACE => 7681

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INCR => 7682

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DECR => 7683

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VENDOR => 7936

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RENDERER => 7937

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERSION => 7938

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EXTENSIONS => 7939

    /**
     * @type {Integer (UInt32)}
     */
    static GL_S => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static GL_T => 8193

    /**
     * @type {Integer (UInt32)}
     */
    static GL_R => 8194

    /**
     * @type {Integer (UInt32)}
     */
    static GL_Q => 8195

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MODULATE => 8448

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DECAL => 8449

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_ENV_MODE => 8704

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_ENV_COLOR => 8705

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_ENV => 8960

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EYE_LINEAR => 9216

    /**
     * @type {Integer (UInt32)}
     */
    static GL_OBJECT_LINEAR => 9217

    /**
     * @type {Integer (UInt32)}
     */
    static GL_SPHERE_MAP => 9218

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_GEN_MODE => 9472

    /**
     * @type {Integer (UInt32)}
     */
    static GL_OBJECT_PLANE => 9473

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EYE_PLANE => 9474

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NEAREST => 9728

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINEAR => 9729

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NEAREST_MIPMAP_NEAREST => 9984

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINEAR_MIPMAP_NEAREST => 9985

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NEAREST_MIPMAP_LINEAR => 9986

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LINEAR_MIPMAP_LINEAR => 9987

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_MAG_FILTER => 10240

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_MIN_FILTER => 10241

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_WRAP_S => 10242

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_WRAP_T => 10243

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLAMP => 10496

    /**
     * @type {Integer (UInt32)}
     */
    static GL_REPEAT => 10497

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLIENT_PIXEL_STORE_BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLIENT_VERTEX_ARRAY_BIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GL_CLIENT_ALL_ATTRIB_BITS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_OFFSET_FACTOR => 32824

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_OFFSET_UNITS => 10752

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_OFFSET_POINT => 10753

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_OFFSET_LINE => 10754

    /**
     * @type {Integer (UInt32)}
     */
    static GL_POLYGON_OFFSET_FILL => 32823

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA4 => 32827

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA8 => 32828

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA12 => 32829

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ALPHA16 => 32830

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE4 => 32831

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE8 => 32832

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE12 => 32833

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE16 => 32834

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE4_ALPHA4 => 32835

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE6_ALPHA2 => 32836

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE8_ALPHA8 => 32837

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE12_ALPHA4 => 32838

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE12_ALPHA12 => 32839

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LUMINANCE16_ALPHA16 => 32840

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INTENSITY => 32841

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INTENSITY4 => 32842

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INTENSITY8 => 32843

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INTENSITY12 => 32844

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INTENSITY16 => 32845

    /**
     * @type {Integer (UInt32)}
     */
    static GL_R3_G3_B2 => 10768

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGB4 => 32847

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGB5 => 32848

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGB8 => 32849

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGB10 => 32850

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGB12 => 32851

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGB16 => 32852

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGBA2 => 32853

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGBA4 => 32854

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGB5_A1 => 32855

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGBA8 => 32856

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGB10_A2 => 32857

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGBA12 => 32858

    /**
     * @type {Integer (UInt32)}
     */
    static GL_RGBA16 => 32859

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_RED_SIZE => 32860

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_GREEN_SIZE => 32861

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_BLUE_SIZE => 32862

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_ALPHA_SIZE => 32863

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_LUMINANCE_SIZE => 32864

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_INTENSITY_SIZE => 32865

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PROXY_TEXTURE_1D => 32867

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PROXY_TEXTURE_2D => 32868

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_PRIORITY => 32870

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_RESIDENT => 32871

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_BINDING_1D => 32872

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_BINDING_2D => 32873

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY => 32884

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NORMAL_ARRAY => 32885

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY => 32886

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_ARRAY => 32887

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY => 32888

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EDGE_FLAG_ARRAY => 32889

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY_SIZE => 32890

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY_TYPE => 32891

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY_STRIDE => 32892

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NORMAL_ARRAY_TYPE => 32894

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NORMAL_ARRAY_STRIDE => 32895

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY_SIZE => 32897

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY_TYPE => 32898

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY_STRIDE => 32899

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_ARRAY_TYPE => 32901

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_ARRAY_STRIDE => 32902

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY_SIZE => 32904

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY_TYPE => 32905

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY_STRIDE => 32906

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EDGE_FLAG_ARRAY_STRIDE => 32908

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY_POINTER => 32910

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NORMAL_ARRAY_POINTER => 32911

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY_POINTER => 32912

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_ARRAY_POINTER => 32913

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY_POINTER => 32914

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EDGE_FLAG_ARRAY_POINTER => 32915

    /**
     * @type {Integer (UInt32)}
     */
    static GL_V2F => 10784

    /**
     * @type {Integer (UInt32)}
     */
    static GL_V3F => 10785

    /**
     * @type {Integer (UInt32)}
     */
    static GL_C4UB_V2F => 10786

    /**
     * @type {Integer (UInt32)}
     */
    static GL_C4UB_V3F => 10787

    /**
     * @type {Integer (UInt32)}
     */
    static GL_C3F_V3F => 10788

    /**
     * @type {Integer (UInt32)}
     */
    static GL_N3F_V3F => 10789

    /**
     * @type {Integer (UInt32)}
     */
    static GL_C4F_N3F_V3F => 10790

    /**
     * @type {Integer (UInt32)}
     */
    static GL_T2F_V3F => 10791

    /**
     * @type {Integer (UInt32)}
     */
    static GL_T4F_V4F => 10792

    /**
     * @type {Integer (UInt32)}
     */
    static GL_T2F_C4UB_V3F => 10793

    /**
     * @type {Integer (UInt32)}
     */
    static GL_T2F_C3F_V3F => 10794

    /**
     * @type {Integer (UInt32)}
     */
    static GL_T2F_N3F_V3F => 10795

    /**
     * @type {Integer (UInt32)}
     */
    static GL_T2F_C4F_N3F_V3F => 10796

    /**
     * @type {Integer (UInt32)}
     */
    static GL_T4F_C4F_N3F_V4F => 10797

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EXT_vertex_array => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EXT_bgra => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EXT_paletted_texture => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_WIN_swap_hint => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_WIN_draw_range_elements => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY_EXT => 32884

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NORMAL_ARRAY_EXT => 32885

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY_EXT => 32886

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_ARRAY_EXT => 32887

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY_EXT => 32888

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EDGE_FLAG_ARRAY_EXT => 32889

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY_SIZE_EXT => 32890

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY_TYPE_EXT => 32891

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY_STRIDE_EXT => 32892

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY_COUNT_EXT => 32893

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NORMAL_ARRAY_TYPE_EXT => 32894

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NORMAL_ARRAY_STRIDE_EXT => 32895

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NORMAL_ARRAY_COUNT_EXT => 32896

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY_SIZE_EXT => 32897

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY_TYPE_EXT => 32898

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY_STRIDE_EXT => 32899

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY_COUNT_EXT => 32900

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_ARRAY_TYPE_EXT => 32901

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_ARRAY_STRIDE_EXT => 32902

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_ARRAY_COUNT_EXT => 32903

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY_SIZE_EXT => 32904

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY_TYPE_EXT => 32905

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY_STRIDE_EXT => 32906

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY_COUNT_EXT => 32907

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EDGE_FLAG_ARRAY_STRIDE_EXT => 32908

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EDGE_FLAG_ARRAY_COUNT_EXT => 32909

    /**
     * @type {Integer (UInt32)}
     */
    static GL_VERTEX_ARRAY_POINTER_EXT => 32910

    /**
     * @type {Integer (UInt32)}
     */
    static GL_NORMAL_ARRAY_POINTER_EXT => 32911

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_ARRAY_POINTER_EXT => 32912

    /**
     * @type {Integer (UInt32)}
     */
    static GL_INDEX_ARRAY_POINTER_EXT => 32913

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COORD_ARRAY_POINTER_EXT => 32914

    /**
     * @type {Integer (UInt32)}
     */
    static GL_EDGE_FLAG_ARRAY_POINTER_EXT => 32915

    /**
     * @type {Integer (UInt32)}
     */
    static GL_DOUBLE_EXT => 5130

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BGR_EXT => 32992

    /**
     * @type {Integer (UInt32)}
     */
    static GL_BGRA_EXT => 32993

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_TABLE_FORMAT_EXT => 32984

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_TABLE_WIDTH_EXT => 32985

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_TABLE_RED_SIZE_EXT => 32986

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_TABLE_GREEN_SIZE_EXT => 32987

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_TABLE_BLUE_SIZE_EXT => 32988

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_TABLE_ALPHA_SIZE_EXT => 32989

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_TABLE_LUMINANCE_SIZE_EXT => 32990

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_TABLE_INTENSITY_SIZE_EXT => 32991

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_INDEX1_EXT => 32994

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_INDEX2_EXT => 32995

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_INDEX4_EXT => 32996

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_INDEX8_EXT => 32997

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_INDEX12_EXT => 32998

    /**
     * @type {Integer (UInt32)}
     */
    static GL_COLOR_INDEX16_EXT => 32999

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_ELEMENTS_VERTICES_WIN => 33000

    /**
     * @type {Integer (UInt32)}
     */
    static GL_MAX_ELEMENTS_INDICES_WIN => 33001

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PHONG_WIN => 33002

    /**
     * @type {Integer (UInt32)}
     */
    static GL_PHONG_HINT_WIN => 33003

    /**
     * @type {Integer (UInt32)}
     */
    static GL_FOG_SPECULAR_TEXTURE_WIN => 33004

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LOGIC_OP => 3057

    /**
     * @type {Integer (UInt32)}
     */
    static GL_TEXTURE_COMPONENTS => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_VERSION_1_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_VERSION_1_2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_INVALID_ENUM => 100900

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_INVALID_VALUE => 100901

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_OUT_OF_MEMORY => 100902

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_INCOMPATIBLE_GL_VERSION => 100903

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_VERSION => 100800

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_EXTENSIONS => 100801

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TRUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_FALSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_SMOOTH => 100000

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_FLAT => 100001

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NONE => 100002

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_POINT => 100010

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_LINE => 100011

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_FILL => 100012

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_SILHOUETTE => 100013

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_OUTSIDE => 100020

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_INSIDE => 100021

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_WINDING_RULE => 100140

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_BOUNDARY_ONLY => 100141

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_TOLERANCE => 100142

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_WINDING_ODD => 100130

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_WINDING_NONZERO => 100131

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_WINDING_POSITIVE => 100132

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_WINDING_NEGATIVE => 100133

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_WINDING_ABS_GEQ_TWO => 100134

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_BEGIN => 100100

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_VERTEX => 100101

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_END => 100102

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_ERROR => 100103

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_EDGE_FLAG => 100104

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_COMBINE => 100105

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_BEGIN_DATA => 100106

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_VERTEX_DATA => 100107

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_END_DATA => 100108

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_ERROR_DATA => 100109

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_EDGE_FLAG_DATA => 100110

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_COMBINE_DATA => 100111

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_ERROR1 => 100151

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_ERROR2 => 100152

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_ERROR3 => 100153

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_ERROR4 => 100154

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_ERROR5 => 100155

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_ERROR6 => 100156

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_ERROR7 => 100157

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_ERROR8 => 100158

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_MISSING_BEGIN_POLYGON => 100151

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_MISSING_BEGIN_CONTOUR => 100152

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_MISSING_END_POLYGON => 100153

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_MISSING_END_CONTOUR => 100154

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_COORD_TOO_LARGE => 100155

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_TESS_NEED_COMBINE_CALLBACK => 100156

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_AUTO_LOAD_MATRIX => 100200

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_CULLING => 100201

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_SAMPLING_TOLERANCE => 100203

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_DISPLAY_MODE => 100204

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_PARAMETRIC_TOLERANCE => 100202

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_SAMPLING_METHOD => 100205

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_U_STEP => 100206

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_V_STEP => 100207

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_PATH_LENGTH => 100215

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_PARAMETRIC_ERROR => 100216

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_DOMAIN_DISTANCE => 100217

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_MAP1_TRIM_2 => 100210

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_MAP1_TRIM_3 => 100211

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_OUTLINE_POLYGON => 100240

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_OUTLINE_PATCH => 100241

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR1 => 100251

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR2 => 100252

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR3 => 100253

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR4 => 100254

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR5 => 100255

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR6 => 100256

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR7 => 100257

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR8 => 100258

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR9 => 100259

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR10 => 100260

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR11 => 100261

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR12 => 100262

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR13 => 100263

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR14 => 100264

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR15 => 100265

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR16 => 100266

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR17 => 100267

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR18 => 100268

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR19 => 100269

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR20 => 100270

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR21 => 100271

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR22 => 100272

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR23 => 100273

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR24 => 100274

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR25 => 100275

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR26 => 100276

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR27 => 100277

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR28 => 100278

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR29 => 100279

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR30 => 100280

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR31 => 100281

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR32 => 100282

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR33 => 100283

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR34 => 100284

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR35 => 100285

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR36 => 100286

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_NURBS_ERROR37 => 100287

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_CW => 100120

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_CCW => 100121

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_INTERIOR => 100122

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_EXTERIOR => 100123

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_UNKNOWN => 100124

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_BEGIN => 100100

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_VERTEX => 100101

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_END => 100102

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_ERROR => 100103

    /**
     * @type {Integer (UInt32)}
     */
    static GLU_EDGE_FLAG => 100104
;@endregion Constants

;@region Methods
    /**
     * The ChoosePixelFormat function attempts to match an appropriate pixel format supported by a device context to a given pixel format specification.
     * @param {HDC} hdc Specifies the device context that the function examines to determine the best match for the pixel format descriptor pointed to by <i>ppfd</i>.
     * @param {Pointer<PIXELFORMATDESCRIPTOR>} ppfd Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a> structure that specifies the requested pixel format. In this context, the members of the <b>PIXELFORMATDESCRIPTOR</b> structure that <i>ppfd</i> points to are used as follows:
     * 
     * <table>
     * <tr>
     * <td><i>nSize</i></td>
     * <td>Specifies the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a> data structure. Set this member to <c>sizeof(PIXELFORMATDESCRIPTOR)</c>.</td>
     * </tr>
     * <tr>
     * <td><i>nVersion</i></td>
     * <td>Specifies the version number of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a> data structure. Set this member to 1.</td>
     * </tr>
     * <tr>
     * <td><i>dwFlags</i></td>
     * <td>A set of bit flags that specify properties of the pixel buffer. You can combine the following bit flag constants by using bitwise-OR. If any of the following flags are set, the <b>ChoosePixelFormat</b> function attempts to match pixel formats that also have that flag or flags set. Otherwise, <b>ChoosePixelFormat</b> ignores that flag in the pixel formats: <b>PFD_DRAW_TO_WINDOW</b>, <b>PFD_DRAW_TO_BITMAP</b>, <b>PFD_SUPPORT_GDI</b>, <b>PFD_SUPPORT_OPENGL</b> If any of the following flags are set, <b>ChoosePixelFormat</b> attempts to match pixel formats that also have that flag or flags set. Otherwise, it attempts to match pixel formats without that flag set: <b>PFD_DOUBLEBUFFER PFD_STEREO</b> If the following flag is set, the function ignores the <b>PFD_DOUBLEBUFFER</b> flag in the pixel formats: <b>PFD_DOUBLEBUFFER_DONTCARE</b> If the following flag is set, the function ignores the <b>PFD_STEREO</b> flag in the pixel formats: <b>PFD_STEREO_DONTCARE</b></td>
     * </tr>
     * <tr>
     * <td><i>iPixelType</i></td>
     * <td>Specifies the type of pixel format for the function to consider: <b>PFD_TYPE_RGBA</b>, <b>PFD_TYPE_COLORINDEX</b></td>
     * </tr>
     * <tr>
     * <td><i>cColorBits</i></td>
     * <td>Zero or greater.</td>
     * </tr>
     * <tr>
     * <td><i>cRedBits</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cRedShift</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cGreenBits</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cGreenShift</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cBlueBits</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cBlueShift</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cAlphaBits</i></td>
     * <td>Zero or greater.</td>
     * </tr>
     * <tr>
     * <td><i>cAlphaShift</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cAccumBits</i></td>
     * <td>Zero or greater.</td>
     * </tr>
     * <tr>
     * <td><i>cAccumRedBits</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cAccumGreenBits</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cAccumBlueBits</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cAccumAlphaBits</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>cDepthBits</i></td>
     * <td>Zero or greater.</td>
     * </tr>
     * <tr>
     * <td><i>cStencilBits</i></td>
     * <td>Zero or greater.</td>
     * </tr>
     * <tr>
     * <td><i>cAuxBuffers</i></td>
     * <td>Zero or greater.</td>
     * </tr>
     * <tr>
     * <td><i>iLayerType</i></td>
     * <td>Specifies one of the following layer type values: <b>PFD_MAIN_PLANE</b>, <b>PFD_OVERLAY_PLANE</b>, <b>PFD_UNDERLAY_PLANE</b></td>
     * </tr>
     * <tr>
     * <td><i>bReserved</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>dwLayerMask</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>dwVisibleMask</i></td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td><i>dwDamageMask</i></td>
     * <td>Not used.</td>
     * </tr>
     * </table>
     *  
     * 
     * <i></i>
     * @returns {Integer} If the function succeeds, the return value is a pixel format index (one-based) that is the closest match to the given pixel format descriptor.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-choosepixelformat
     * @since windows5.0
     */
    static ChoosePixelFormat(hdc, ppfd) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        A_LastError := 0

        result := DllCall("GDI32.dll\ChoosePixelFormat", "ptr", hdc, "ptr", ppfd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The DescribePixelFormat function obtains information about the pixel format identified by iPixelFormat of the device associated with hdc. The function sets the members of the PIXELFORMATDESCRIPTOR structure pointed to by ppfd with that pixel format data.
     * @param {HDC} hdc Specifies the device context.
     * @param {Integer} iPixelFormat Index that specifies the pixel format. The pixel formats that a device context supports are identified by positive one-based integer indexes.
     * @param {Integer} nBytes The size, in bytes, of the structure pointed to by <i>ppfd</i>. The <b>DescribePixelFormat</b> function stores no more than <i>nBytes</i> bytes of data to that structure. Set this value to <b>sizeof</b>(<b>PIXELFORMATDESCRIPTOR</b>).
     * @param {Pointer} ppfd Pointer to a <b>PIXELFORMATDESCRIPTOR</b> structure whose members the function sets with pixel format data. The function stores the number of bytes copied to the structure in the structure's <b>nSize</b> member. If, upon entry, <i>ppfd</i> is <b>NULL</b>, the function writes no data to the structure. This is useful when you only want to obtain the maximum pixel format index of a device context.
     * @returns {Integer} If the function succeeds, the return value is the maximum pixel format index of the device context. In addition, the function sets the members of the <b>PIXELFORMATDESCRIPTOR</b> structure pointed to by <i>ppfd</i> according to the specified pixel format.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-describepixelformat
     * @since windows5.0
     */
    static DescribePixelFormat(hdc, iPixelFormat, nBytes, ppfd) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        A_LastError := 0

        result := DllCall("GDI32.dll\DescribePixelFormat", "ptr", hdc, "int", iPixelFormat, "uint", nBytes, "ptr", ppfd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @param {HDC} hdc Specifies the device context of the currently selected pixel format index returned by the function.
     * @returns {Integer} If the function succeeds, the return value is the currently selected pixel format index of the specified device context. This is a positive, one-based index value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixelformat
     * @since windows5.0
     */
    static GetPixelFormat(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        A_LastError := 0

        result := DllCall("GDI32.dll\GetPixelFormat", "ptr", hdc, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SetPixelFormat function sets the pixel format of the specified device context to the format specified by the iPixelFormat index.
     * @param {HDC} hdc Specifies the device context whose pixel format the function attempts to set.
     * @param {Integer} format Index that identifies the pixel format to set. The various pixel formats supported by a device context are identified by one-based indexes.
     * @param {Pointer<PIXELFORMATDESCRIPTOR>} ppfd Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a> structure that contains the logical pixel format specification. The system's metafile component uses this structure to record the logical pixel format specification. The structure has no other effect upon the behavior of the <b>SetPixelFormat</b> function.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setpixelformat
     * @since windows5.0
     */
    static SetPixelFormat(hdc, format, ppfd) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        A_LastError := 0

        result := DllCall("GDI32.dll\SetPixelFormat", "ptr", hdc, "int", format, "ptr", ppfd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetEnhMetaFilePixelFormat function retrieves pixel format information for an enhanced metafile.
     * @param {HENHMETAFILE} hemf Identifies the enhanced metafile.
     * @param {Integer} cbBuffer Specifies the size, in bytes, of the buffer into which the pixel format information is copied.
     * @param {Pointer} ppfd Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a> structure that contains the logical pixel format specification. The metafile uses this structure to record the logical pixel format specification.
     * @returns {Integer} If the function succeeds and finds a pixel format, the return value is the size of the metafile's pixel format.
     * 
     * If no pixel format is present, the return value is zero.
     * 
     * If an error occurs and the function fails, the return value is GDI_ERROR. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getenhmetafilepixelformat
     * @since windows5.0
     */
    static GetEnhMetaFilePixelFormat(hemf, cbBuffer, ppfd) {
        hemf := hemf is Win32Handle ? NumGet(hemf, "ptr") : hemf

        A_LastError := 0

        result := DllCall("GDI32.dll\GetEnhMetaFilePixelFormat", "ptr", hemf, "uint", cbBuffer, "ptr", ppfd, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglCopyContext function copies selected groups of rendering states from one OpenGL rendering context to another.
     * @param {HGLRC} param0 
     * @param {HGLRC} param1 
     * @param {Integer} param2 
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglcopycontext
     * @since windows5.0
     */
    static wglCopyContext(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglCopyContext", "ptr", param0, "ptr", param1, "uint", param2, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglCreateContext function creates a new OpenGL rendering context, which is suitable for drawing on the device referenced by hdc. The rendering context has the same pixel format as the device context.
     * @param {HDC} param0 
     * @returns {HGLRC} If the function succeeds, the return value is a valid handle to an OpenGL rendering context.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglcreatecontext
     * @since windows5.0
     */
    static wglCreateContext(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglCreateContext", "ptr", param0, "ptr")
        if(A_LastError)
            throw OSError()

        return HGLRC({Value: result}, True)
    }

    /**
     * The wglCreateLayerContext function creates a new OpenGL rendering context for drawing to a specified layer plane on a device context.
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @returns {HGLRC} If the function succeeds, the return value is a handle to an OpenGL rendering context.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglcreatelayercontext
     * @since windows5.0
     */
    static wglCreateLayerContext(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglCreateLayerContext", "ptr", param0, "int", param1, "ptr")
        if(A_LastError)
            throw OSError()

        return HGLRC({Value: result}, True)
    }

    /**
     * The wglDeleteContext function deletes a specified OpenGL rendering context.
     * @param {HGLRC} param0 
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wgldeletecontext
     * @since windows5.0
     */
    static wglDeleteContext(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglDeleteContext", "ptr", param0, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglGetCurrentContext function obtains a handle to the current OpenGL rendering context of the calling thread.
     * @returns {HGLRC} If the calling thread has a current OpenGL rendering context, <b>wglGetCurrentContext</b> returns a handle to that rendering context. Otherwise, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglgetcurrentcontext
     * @since windows5.0
     */
    static wglGetCurrentContext() {
        result := DllCall("OPENGL32.dll\wglGetCurrentContext", "ptr")
        return HGLRC({Value: result}, True)
    }

    /**
     * The wglGetCurrentDC function obtains a handle to the device context that is associated with the current OpenGL rendering context of the calling thread.
     * @returns {HDC} If the calling thread has a current OpenGL rendering context, the function returns a handle to the device context associated with that rendering context by means of the <b>wglMakeCurrent</b> function. Otherwise, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglgetcurrentdc
     * @since windows5.0
     */
    static wglGetCurrentDC() {
        result := DllCall("OPENGL32.dll\wglGetCurrentDC", "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The wglGetProcAddress function returns the address of an OpenGL extension function for use with the current OpenGL rendering context.
     * @param {PSTR} param0 
     * @returns {Pointer<PROC>} When the function succeeds, the return value is the address of the extension function.
     * 
     * When no current rendering context exists or the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglgetprocaddress
     * @since windows5.0
     */
    static wglGetProcAddress(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglGetProcAddress", "ptr", param0, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglMakeCurrent function makes a specified OpenGL rendering context the calling thread's current rendering context.
     * @param {HDC} param0 
     * @param {HGLRC} param1 
     * @returns {BOOL} When the <b>wglMakeCurrent</b> function succeeds, the return value is <b>TRUE</b>; otherwise the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglmakecurrent
     * @since windows5.0
     */
    static wglMakeCurrent(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglMakeCurrent", "ptr", param0, "ptr", param1, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglShareLists function enables multiple OpenGL rendering contexts to share a single display-list space.
     * @param {HGLRC} param0 
     * @param {HGLRC} param1 
     * @returns {BOOL} When the function succeeds, the return value is <b>TRUE</b>.
     * 
     * When the function fails, the return value is <b>FALSE</b> and the display lists are not shared. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglsharelists
     * @since windows5.0
     */
    static wglShareLists(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglShareLists", "ptr", param0, "ptr", param1, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglUseFontBitmaps function creates a set of bitmap display lists for use in the current OpenGL rendering context.
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglusefontbitmapsa
     * @since windows5.0
     */
    static wglUseFontBitmapsA(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglUseFontBitmapsA", "ptr", param0, "uint", param1, "uint", param2, "uint", param3, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglUseFontBitmaps function creates a set of bitmap display lists for use in the current OpenGL rendering context.
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglusefontbitmapsw
     * @since windows5.0
     */
    static wglUseFontBitmapsW(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglUseFontBitmapsW", "ptr", param0, "uint", param1, "uint", param2, "uint", param3, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SwapBuffers function exchanges the front and back buffers if the current pixel format for the window referenced by the specified device context includes a back buffer.
     * @param {HDC} param0 
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-swapbuffers
     * @since windows5.0
     */
    static SwapBuffers(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("GDI32.dll\SwapBuffers", "ptr", param0, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglUseFontOutlines function creates a set of display lists, one for each glyph of the currently selected outline font of a device context, for use with the current rendering context.
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Float} param4 
     * @param {Float} param5 
     * @param {Integer} param6 
     * @param {Pointer<GLYPHMETRICSFLOAT>} param7 
     * @returns {BOOL} When the function succeeds, the return value is <b>TRUE</b>.
     * 
     * When the function fails, the return value is <b>FALSE</b> and no display lists are generated. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglusefontoutlinesa
     * @since windows5.0
     */
    static wglUseFontOutlinesA(param0, param1, param2, param3, param4, param5, param6, param7) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglUseFontOutlinesA", "ptr", param0, "uint", param1, "uint", param2, "uint", param3, "float", param4, "float", param5, "int", param6, "ptr", param7, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglUseFontOutlines function creates a set of display lists, one for each glyph of the currently selected outline font of a device context, for use with the current rendering context.
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Float} param4 
     * @param {Float} param5 
     * @param {Integer} param6 
     * @param {Pointer<GLYPHMETRICSFLOAT>} param7 
     * @returns {BOOL} When the function succeeds, the return value is <b>TRUE</b>.
     * 
     * When the function fails, the return value is <b>FALSE</b> and no display lists are generated. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglusefontoutlinesw
     * @since windows5.0
     */
    static wglUseFontOutlinesW(param0, param1, param2, param3, param4, param5, param6, param7) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglUseFontOutlinesW", "ptr", param0, "uint", param1, "uint", param2, "uint", param3, "float", param4, "float", param5, "int", param6, "ptr", param7, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglDescribeLayerPlane function obtains information about the layer planes of a given pixel format.
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<LAYERPLANEDESCRIPTOR>} param4 
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. In addition, the <b>wglDescribeLayerPlane</b> function sets the members of the <b>LAYERPLANEDESCRIPTOR</b> structure pointed to by <i>plpd</i> according to the specified layer plane (<i>iLayerPlane</i> ) of the specified pixel format (<i>iPixelFormat</i> ).
     * 
     * If the function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wgldescribelayerplane
     * @since windows5.0
     */
    static wglDescribeLayerPlane(param0, param1, param2, param3, param4) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := DllCall("OPENGL32.dll\wglDescribeLayerPlane", "ptr", param0, "int", param1, "int", param2, "uint", param3, "ptr", param4, "int")
        return result
    }

    /**
     * Sets the palette entries in a given color-index layer plane for a specified device context.
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<COLORREF>} param4 
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, the return value is the number of entries that were set in the palette in the specified layer plane of the window. If the function fails or no pixel format is selected, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglsetlayerpaletteentries
     * @since windows5.0
     */
    static wglSetLayerPaletteEntries(param0, param1, param2, param3, param4) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglSetLayerPaletteEntries", "ptr", param0, "int", param1, "int", param2, "int", param3, "ptr", param4, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the palette entries from a given color-index layer plane for a specified device context.
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<COLORREF>} param4 
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, the return value is the number of entries that were set in the palette in the specified layer plane of the window.
     * 
     * If the function fails or when no pixel format is selected, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglgetlayerpaletteentries
     * @since windows5.0
     */
    static wglGetLayerPaletteEntries(param0, param1, param2, param3, param4) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglGetLayerPaletteEntries", "ptr", param0, "int", param1, "int", param2, "int", param3, "ptr", param4, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglRealizeLayerPalette function maps palette entries from a given color-index layer plane into the physical palette or initializes the palette of an RGBA layer plane.
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @param {BOOL} param2 
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>, even if <i>bRealize</i> is <b>TRUE</b> and the physical palette is not available. If the function fails or when no pixel format is selected, the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglrealizelayerpalette
     * @since windows5.0
     */
    static wglRealizeLayerPalette(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglRealizeLayerPalette", "ptr", param0, "int", param1, "int", param2, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The wglSwapLayerBuffers function swaps the front and back buffers in the overlay, underlay, and main planes of the window referenced by a specified device context.
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-wglswaplayerbuffers
     * @since windows5.0
     */
    static wglSwapLayerBuffers(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        A_LastError := 0

        result := DllCall("OPENGL32.dll\wglSwapLayerBuffers", "ptr", param0, "uint", param1, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} op 
     * @param {Float} value 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glaccum
     */
    static glAccum(op, value) {
        DllCall("OPENGL32.dll\glAccum", "uint", op, "float", value)
    }

    /**
     * 
     * @param {Integer} func 
     * @param {Float} ref 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glalphafunc
     */
    static glAlphaFunc(func, ref) {
        DllCall("OPENGL32.dll\glAlphaFunc", "uint", func, "float", ref)
    }

    /**
     * 
     * @param {Integer} n 
     * @param {Pointer<Integer>} textures 
     * @param {Pointer<Integer>} residences 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glaretexturesresident
     */
    static glAreTexturesResident(n, textures, residences) {
        texturesMarshal := textures is VarRef ? "uint*" : "ptr"
        residencesMarshal := residences is VarRef ? "char*" : "ptr"

        result := DllCall("OPENGL32.dll\glAreTexturesResident", "int", n, texturesMarshal, textures, residencesMarshal, residences, "char")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glarrayelement
     */
    static glArrayElement(i) {
        DllCall("OPENGL32.dll\glArrayElement", "int", i)
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glbegin
     */
    static glBegin(mode) {
        DllCall("OPENGL32.dll\glBegin", "uint", mode)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} texture 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glbindtexture
     */
    static glBindTexture(target, texture) {
        DllCall("OPENGL32.dll\glBindTexture", "uint", target, "uint", texture)
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Float} xorig 
     * @param {Float} yorig 
     * @param {Float} xmove 
     * @param {Float} ymove 
     * @param {Pointer<Integer>} bitmap 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glbitmap
     */
    static glBitmap(width, height, xorig, yorig, xmove, ymove, bitmap) {
        bitmapMarshal := bitmap is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glBitmap", "int", width, "int", height, "float", xorig, "float", yorig, "float", xmove, "float", ymove, bitmapMarshal, bitmap)
    }

    /**
     * 
     * @param {Integer} sfactor 
     * @param {Integer} dfactor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glblendfunc
     */
    static glBlendFunc(sfactor, dfactor) {
        DllCall("OPENGL32.dll\glBlendFunc", "uint", sfactor, "uint", dfactor)
    }

    /**
     * 
     * @param {Integer} list 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcalllist
     */
    static glCallList(list) {
        DllCall("OPENGL32.dll\glCallList", "uint", list)
    }

    /**
     * 
     * @param {Integer} n 
     * @param {Integer} type 
     * @param {Pointer<Void>} lists 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcalllists
     */
    static glCallLists(n, type, lists) {
        listsMarshal := lists is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glCallLists", "int", n, "uint", type, listsMarshal, lists)
    }

    /**
     * 
     * @param {Integer} mask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glclear
     */
    static glClear(mask) {
        DllCall("OPENGL32.dll\glClear", "uint", mask)
    }

    /**
     * 
     * @param {Float} red 
     * @param {Float} green 
     * @param {Float} blue 
     * @param {Float} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glclearaccum
     */
    static glClearAccum(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glClearAccum", "float", red, "float", green, "float", blue, "float", alpha)
    }

    /**
     * 
     * @param {Float} red 
     * @param {Float} green 
     * @param {Float} blue 
     * @param {Float} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glclearcolor
     */
    static glClearColor(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glClearColor", "float", red, "float", green, "float", blue, "float", alpha)
    }

    /**
     * 
     * @param {Float} depth 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcleardepth
     */
    static glClearDepth(depth) {
        DllCall("OPENGL32.dll\glClearDepth", "double", depth)
    }

    /**
     * 
     * @param {Float} c 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glclearindex
     */
    static glClearIndex(c) {
        DllCall("OPENGL32.dll\glClearIndex", "float", c)
    }

    /**
     * 
     * @param {Integer} s 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glclearstencil
     */
    static glClearStencil(s) {
        DllCall("OPENGL32.dll\glClearStencil", "int", s)
    }

    /**
     * 
     * @param {Integer} plane 
     * @param {Pointer<Float>} equation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glclipplane
     */
    static glClipPlane(plane, equation) {
        equationMarshal := equation is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glClipPlane", "uint", plane, equationMarshal, equation)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3b
     */
    static glColor3b(red, green, blue) {
        DllCall("OPENGL32.dll\glColor3b", "char", red, "char", green, "char", blue)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3bv
     */
    static glColor3bv(v) {
        vMarshal := v is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glColor3bv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} red 
     * @param {Float} green 
     * @param {Float} blue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3d
     */
    static glColor3d(red, green, blue) {
        DllCall("OPENGL32.dll\glColor3d", "double", red, "double", green, "double", blue)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3dv
     */
    static glColor3dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glColor3dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} red 
     * @param {Float} green 
     * @param {Float} blue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3f
     */
    static glColor3f(red, green, blue) {
        DllCall("OPENGL32.dll\glColor3f", "float", red, "float", green, "float", blue)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3fv
     */
    static glColor3fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glColor3fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3i
     */
    static glColor3i(red, green, blue) {
        DllCall("OPENGL32.dll\glColor3i", "int", red, "int", green, "int", blue)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3iv
     */
    static glColor3iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glColor3iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3s
     */
    static glColor3s(red, green, blue) {
        DllCall("OPENGL32.dll\glColor3s", "short", red, "short", green, "short", blue)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3sv
     */
    static glColor3sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glColor3sv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3ub
     */
    static glColor3ub(red, green, blue) {
        DllCall("OPENGL32.dll\glColor3ub", "char", red, "char", green, "char", blue)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3ubv
     */
    static glColor3ubv(v) {
        vMarshal := v is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glColor3ubv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3ui
     */
    static glColor3ui(red, green, blue) {
        DllCall("OPENGL32.dll\glColor3ui", "uint", red, "uint", green, "uint", blue)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3uiv
     */
    static glColor3uiv(v) {
        vMarshal := v is VarRef ? "uint*" : "ptr"

        DllCall("OPENGL32.dll\glColor3uiv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3us
     */
    static glColor3us(red, green, blue) {
        DllCall("OPENGL32.dll\glColor3us", "ushort", red, "ushort", green, "ushort", blue)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor3usv
     */
    static glColor3usv(v) {
        vMarshal := v is VarRef ? "ushort*" : "ptr"

        DllCall("OPENGL32.dll\glColor3usv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @param {Integer} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4b
     */
    static glColor4b(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glColor4b", "char", red, "char", green, "char", blue, "char", alpha)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4bv
     */
    static glColor4bv(v) {
        vMarshal := v is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glColor4bv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} red 
     * @param {Float} green 
     * @param {Float} blue 
     * @param {Float} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4d
     */
    static glColor4d(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glColor4d", "double", red, "double", green, "double", blue, "double", alpha)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4dv
     */
    static glColor4dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glColor4dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} red 
     * @param {Float} green 
     * @param {Float} blue 
     * @param {Float} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4f
     */
    static glColor4f(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glColor4f", "float", red, "float", green, "float", blue, "float", alpha)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4fv
     */
    static glColor4fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glColor4fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @param {Integer} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4i
     */
    static glColor4i(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glColor4i", "int", red, "int", green, "int", blue, "int", alpha)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4iv
     */
    static glColor4iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glColor4iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @param {Integer} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4s
     */
    static glColor4s(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glColor4s", "short", red, "short", green, "short", blue, "short", alpha)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4sv
     */
    static glColor4sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glColor4sv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @param {Integer} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4ub
     */
    static glColor4ub(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glColor4ub", "char", red, "char", green, "char", blue, "char", alpha)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4ubv
     */
    static glColor4ubv(v) {
        vMarshal := v is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glColor4ubv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @param {Integer} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4ui
     */
    static glColor4ui(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glColor4ui", "uint", red, "uint", green, "uint", blue, "uint", alpha)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4uiv
     */
    static glColor4uiv(v) {
        vMarshal := v is VarRef ? "uint*" : "ptr"

        DllCall("OPENGL32.dll\glColor4uiv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @param {Integer} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4us
     */
    static glColor4us(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glColor4us", "ushort", red, "ushort", green, "ushort", blue, "ushort", alpha)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolor4usv
     */
    static glColor4usv(v) {
        vMarshal := v is VarRef ? "ushort*" : "ptr"

        DllCall("OPENGL32.dll\glColor4usv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} red 
     * @param {Integer} green 
     * @param {Integer} blue 
     * @param {Integer} alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolormask
     */
    static glColorMask(red, green, blue, alpha) {
        DllCall("OPENGL32.dll\glColorMask", "char", red, "char", green, "char", blue, "char", alpha)
    }

    /**
     * 
     * @param {Integer} face 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolormaterial
     */
    static glColorMaterial(face, mode) {
        DllCall("OPENGL32.dll\glColorMaterial", "uint", face, "uint", mode)
    }

    /**
     * 
     * @param {Integer} size 
     * @param {Integer} type 
     * @param {Integer} stride 
     * @param {Pointer<Void>} pointer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcolorpointer
     */
    static glColorPointer(size, type, stride, pointer) {
        pointerMarshal := pointer is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glColorPointer", "int", size, "uint", type, "int", stride, pointerMarshal, pointer)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} type 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcopypixels
     */
    static glCopyPixels(x, y, width, height, type) {
        DllCall("OPENGL32.dll\glCopyPixels", "int", x, "int", y, "int", width, "int", height, "uint", type)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} internalFormat 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} border 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcopyteximage1d
     */
    static glCopyTexImage1D(target, level, internalFormat, x, y, width, border) {
        DllCall("OPENGL32.dll\glCopyTexImage1D", "uint", target, "int", level, "uint", internalFormat, "int", x, "int", y, "int", width, "int", border)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} internalFormat 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} border 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcopyteximage2d
     */
    static glCopyTexImage2D(target, level, internalFormat, x, y, width, height, border) {
        DllCall("OPENGL32.dll\glCopyTexImage2D", "uint", target, "int", level, "uint", internalFormat, "int", x, "int", y, "int", width, "int", height, "int", border)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} xoffset 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcopytexsubimage1d
     */
    static glCopyTexSubImage1D(target, level, xoffset, x, y, width) {
        DllCall("OPENGL32.dll\glCopyTexSubImage1D", "uint", target, "int", level, "int", xoffset, "int", x, "int", y, "int", width)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} xoffset 
     * @param {Integer} yoffset 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcopytexsubimage2d
     */
    static glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height) {
        DllCall("OPENGL32.dll\glCopyTexSubImage2D", "uint", target, "int", level, "int", xoffset, "int", yoffset, "int", x, "int", y, "int", width, "int", height)
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glcullface
     */
    static glCullFace(mode) {
        DllCall("OPENGL32.dll\glCullFace", "uint", mode)
    }

    /**
     * 
     * @param {Integer} list 
     * @param {Integer} range 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldeletelists
     */
    static glDeleteLists(list, range) {
        DllCall("OPENGL32.dll\glDeleteLists", "uint", list, "int", range)
    }

    /**
     * 
     * @param {Integer} n 
     * @param {Pointer<Integer>} textures 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldeletetextures
     */
    static glDeleteTextures(n, textures) {
        texturesMarshal := textures is VarRef ? "uint*" : "ptr"

        DllCall("OPENGL32.dll\glDeleteTextures", "int", n, texturesMarshal, textures)
    }

    /**
     * 
     * @param {Integer} func 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldepthfunc
     */
    static glDepthFunc(func) {
        DllCall("OPENGL32.dll\glDepthFunc", "uint", func)
    }

    /**
     * 
     * @param {Integer} flag 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldepthmask
     */
    static glDepthMask(flag) {
        DllCall("OPENGL32.dll\glDepthMask", "char", flag)
    }

    /**
     * 
     * @param {Float} zNear 
     * @param {Float} zFar 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldepthrange
     */
    static glDepthRange(zNear, zFar) {
        DllCall("OPENGL32.dll\glDepthRange", "double", zNear, "double", zFar)
    }

    /**
     * 
     * @param {Integer} cap 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldisable
     */
    static glDisable(cap) {
        DllCall("OPENGL32.dll\glDisable", "uint", cap)
    }

    /**
     * 
     * @param {Integer} array 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldisableclientstate
     */
    static glDisableClientState(array) {
        DllCall("OPENGL32.dll\glDisableClientState", "uint", array)
    }

    /**
     * 
     * @param {Integer} mode 
     * @param {Integer} first 
     * @param {Integer} count 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldrawarrays
     */
    static glDrawArrays(mode, first, count) {
        DllCall("OPENGL32.dll\glDrawArrays", "uint", mode, "int", first, "int", count)
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldrawbuffer
     */
    static glDrawBuffer(mode) {
        DllCall("OPENGL32.dll\glDrawBuffer", "uint", mode)
    }

    /**
     * 
     * @param {Integer} mode 
     * @param {Integer} count 
     * @param {Integer} type 
     * @param {Pointer<Void>} indices 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldrawelements
     */
    static glDrawElements(mode, count, type, indices) {
        indicesMarshal := indices is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glDrawElements", "uint", mode, "int", count, "uint", type, indicesMarshal, indices)
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} format 
     * @param {Integer} type 
     * @param {Pointer<Void>} pixels 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gldrawpixels
     */
    static glDrawPixels(width, height, format, type, pixels) {
        pixelsMarshal := pixels is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glDrawPixels", "int", width, "int", height, "uint", format, "uint", type, pixelsMarshal, pixels)
    }

    /**
     * 
     * @param {Integer} flag 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gledgeflag
     */
    static glEdgeFlag(flag) {
        DllCall("OPENGL32.dll\glEdgeFlag", "char", flag)
    }

    /**
     * 
     * @param {Integer} stride 
     * @param {Pointer<Void>} pointer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gledgeflagpointer
     */
    static glEdgeFlagPointer(stride, pointer) {
        pointerMarshal := pointer is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glEdgeFlagPointer", "int", stride, pointerMarshal, pointer)
    }

    /**
     * 
     * @param {Pointer<Integer>} flag 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gledgeflagv
     */
    static glEdgeFlagv(flag) {
        flagMarshal := flag is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glEdgeFlagv", flagMarshal, flag)
    }

    /**
     * 
     * @param {Integer} cap 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glenable
     */
    static glEnable(cap) {
        DllCall("OPENGL32.dll\glEnable", "uint", cap)
    }

    /**
     * 
     * @param {Integer} array 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glenableclientstate
     */
    static glEnableClientState(array) {
        DllCall("OPENGL32.dll\glEnableClientState", "uint", array)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glend
     */
    static glEnd() {
        DllCall("OPENGL32.dll\glEnd")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glendlist
     */
    static glEndList() {
        DllCall("OPENGL32.dll\glEndList")
    }

    /**
     * 
     * @param {Float} u 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalcoord1d
     */
    static glEvalCoord1d(u) {
        DllCall("OPENGL32.dll\glEvalCoord1d", "double", u)
    }

    /**
     * 
     * @param {Pointer<Float>} u 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalcoord1dv
     */
    static glEvalCoord1dv(u) {
        uMarshal := u is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glEvalCoord1dv", uMarshal, u)
    }

    /**
     * 
     * @param {Float} u 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalcoord1f
     */
    static glEvalCoord1f(u) {
        DllCall("OPENGL32.dll\glEvalCoord1f", "float", u)
    }

    /**
     * 
     * @param {Pointer<Float>} u 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalcoord1fv
     */
    static glEvalCoord1fv(u) {
        uMarshal := u is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glEvalCoord1fv", uMarshal, u)
    }

    /**
     * 
     * @param {Float} u 
     * @param {Float} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalcoord2d
     */
    static glEvalCoord2d(u, v) {
        DllCall("OPENGL32.dll\glEvalCoord2d", "double", u, "double", v)
    }

    /**
     * 
     * @param {Pointer<Float>} u 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalcoord2dv
     */
    static glEvalCoord2dv(u) {
        uMarshal := u is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glEvalCoord2dv", uMarshal, u)
    }

    /**
     * 
     * @param {Float} u 
     * @param {Float} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalcoord2f
     */
    static glEvalCoord2f(u, v) {
        DllCall("OPENGL32.dll\glEvalCoord2f", "float", u, "float", v)
    }

    /**
     * 
     * @param {Pointer<Float>} u 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalcoord2fv
     */
    static glEvalCoord2fv(u) {
        uMarshal := u is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glEvalCoord2fv", uMarshal, u)
    }

    /**
     * 
     * @param {Integer} mode 
     * @param {Integer} i1 
     * @param {Integer} i2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalmesh1
     */
    static glEvalMesh1(mode, i1, i2) {
        DllCall("OPENGL32.dll\glEvalMesh1", "uint", mode, "int", i1, "int", i2)
    }

    /**
     * 
     * @param {Integer} mode 
     * @param {Integer} i1 
     * @param {Integer} i2 
     * @param {Integer} j1 
     * @param {Integer} j2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalmesh2
     */
    static glEvalMesh2(mode, i1, i2, j1, j2) {
        DllCall("OPENGL32.dll\glEvalMesh2", "uint", mode, "int", i1, "int", i2, "int", j1, "int", j2)
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalpoint1
     */
    static glEvalPoint1(i) {
        DllCall("OPENGL32.dll\glEvalPoint1", "int", i)
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Integer} j 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glevalpoint2
     */
    static glEvalPoint2(i, j) {
        DllCall("OPENGL32.dll\glEvalPoint2", "int", i, "int", j)
    }

    /**
     * 
     * @param {Integer} size 
     * @param {Integer} type 
     * @param {Pointer<Float>} buffer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glfeedbackbuffer
     */
    static glFeedbackBuffer(size, type, buffer) {
        bufferMarshal := buffer is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glFeedbackBuffer", "int", size, "uint", type, bufferMarshal, buffer)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glfinish
     */
    static glFinish() {
        DllCall("OPENGL32.dll\glFinish")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glflush
     */
    static glFlush() {
        DllCall("OPENGL32.dll\glFlush")
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Float} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glfogf
     */
    static glFogf(pname, param1) {
        DllCall("OPENGL32.dll\glFogf", "uint", pname, "float", param1)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glfogfv
     */
    static glFogfv(pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glFogfv", "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Integer} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glfogi
     */
    static glFogi(pname, param1) {
        DllCall("OPENGL32.dll\glFogi", "uint", pname, "int", param1)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glfogiv
     */
    static glFogiv(pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glFogiv", "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glfrontface
     */
    static glFrontFace(mode) {
        DllCall("OPENGL32.dll\glFrontFace", "uint", mode)
    }

    /**
     * 
     * @param {Float} left 
     * @param {Float} right 
     * @param {Float} bottom 
     * @param {Float} top 
     * @param {Float} zNear 
     * @param {Float} zFar 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glfrustum
     */
    static glFrustum(left, right, bottom, top, zNear, zFar) {
        DllCall("OPENGL32.dll\glFrustum", "double", left, "double", right, "double", bottom, "double", top, "double", zNear, "double", zFar)
    }

    /**
     * 
     * @param {Integer} range 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgenlists
     */
    static glGenLists(range) {
        result := DllCall("OPENGL32.dll\glGenLists", "int", range, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} n 
     * @param {Pointer<Integer>} textures 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgentextures
     */
    static glGenTextures(n, textures) {
        texturesMarshal := textures is VarRef ? "uint*" : "ptr"

        DllCall("OPENGL32.dll\glGenTextures", "int", n, texturesMarshal, textures)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetbooleanv
     */
    static glGetBooleanv(pname, params) {
        paramsMarshal := params is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glGetBooleanv", "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} plane 
     * @param {Pointer<Float>} equation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetclipplane
     */
    static glGetClipPlane(plane, equation) {
        equationMarshal := equation is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glGetClipPlane", "uint", plane, equationMarshal, equation)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetdoublev
     */
    static glGetDoublev(pname, params) {
        paramsMarshal := params is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glGetDoublev", "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgeterror
     */
    static glGetError() {
        result := DllCall("OPENGL32.dll\glGetError", "uint")
        return result
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetfloatv
     */
    static glGetFloatv(pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glGetFloatv", "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetintegerv
     */
    static glGetIntegerv(pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glGetIntegerv", "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} light 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetlightfv
     */
    static glGetLightfv(light, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glGetLightfv", "uint", light, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} light 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetlightiv
     */
    static glGetLightiv(light, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glGetLightiv", "uint", light, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} query 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetmapdv
     */
    static glGetMapdv(target, query, v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glGetMapdv", "uint", target, "uint", query, vMarshal, v)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} query 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetmapfv
     */
    static glGetMapfv(target, query, v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glGetMapfv", "uint", target, "uint", query, vMarshal, v)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} query 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetmapiv
     */
    static glGetMapiv(target, query, v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glGetMapiv", "uint", target, "uint", query, vMarshal, v)
    }

    /**
     * 
     * @param {Integer} face 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetmaterialfv
     */
    static glGetMaterialfv(face, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glGetMaterialfv", "uint", face, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} face 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetmaterialiv
     */
    static glGetMaterialiv(face, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glGetMaterialiv", "uint", face, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} map 
     * @param {Pointer<Float>} values 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetpixelmapfv
     */
    static glGetPixelMapfv(map, values) {
        valuesMarshal := values is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glGetPixelMapfv", "uint", map, valuesMarshal, values)
    }

    /**
     * 
     * @param {Integer} map 
     * @param {Pointer<Integer>} values 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetpixelmapuiv
     */
    static glGetPixelMapuiv(map, values) {
        valuesMarshal := values is VarRef ? "uint*" : "ptr"

        DllCall("OPENGL32.dll\glGetPixelMapuiv", "uint", map, valuesMarshal, values)
    }

    /**
     * 
     * @param {Integer} map 
     * @param {Pointer<Integer>} values 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetpixelmapusv
     */
    static glGetPixelMapusv(map, values) {
        valuesMarshal := values is VarRef ? "ushort*" : "ptr"

        DllCall("OPENGL32.dll\glGetPixelMapusv", "uint", map, valuesMarshal, values)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Pointer<Pointer<Void>>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetpointerv
     */
    static glGetPointerv(pname, params) {
        DllCall("OPENGL32.dll\glGetPointerv", "uint", pname, "ptr*", params)
    }

    /**
     * 
     * @param {Pointer<Integer>} mask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetpolygonstipple
     */
    static glGetPolygonStipple(mask) {
        maskMarshal := mask is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glGetPolygonStipple", maskMarshal, mask)
    }

    /**
     * 
     * @param {Integer} name 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetstring
     */
    static glGetString(name) {
        result := DllCall("OPENGL32.dll\glGetString", "uint", name, "char*")
        return result
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgettexenvfv
     */
    static glGetTexEnvfv(target, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glGetTexEnvfv", "uint", target, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgettexenviv
     */
    static glGetTexEnviv(target, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glGetTexEnviv", "uint", target, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} coord 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgettexgendv
     */
    static glGetTexGendv(coord, pname, params) {
        paramsMarshal := params is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glGetTexGendv", "uint", coord, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} coord 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgettexgenfv
     */
    static glGetTexGenfv(coord, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glGetTexGenfv", "uint", coord, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} coord 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgettexgeniv
     */
    static glGetTexGeniv(coord, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glGetTexGeniv", "uint", coord, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} format 
     * @param {Integer} type 
     * @param {Pointer<Void>} pixels 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgetteximage
     */
    static glGetTexImage(target, level, format, type, pixels) {
        pixelsMarshal := pixels is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glGetTexImage", "uint", target, "int", level, "uint", format, "uint", type, pixelsMarshal, pixels)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgettexlevelparameterfv
     */
    static glGetTexLevelParameterfv(target, level, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glGetTexLevelParameterfv", "uint", target, "int", level, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgettexlevelparameteriv
     */
    static glGetTexLevelParameteriv(target, level, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glGetTexLevelParameteriv", "uint", target, "int", level, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgettexparameterfv
     */
    static glGetTexParameterfv(target, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glGetTexParameterfv", "uint", target, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glgettexparameteriv
     */
    static glGetTexParameteriv(target, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glGetTexParameteriv", "uint", target, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glhint
     */
    static glHint(target, mode) {
        DllCall("OPENGL32.dll\glHint", "uint", target, "uint", mode)
    }

    /**
     * 
     * @param {Integer} mask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glindexmask
     */
    static glIndexMask(mask) {
        DllCall("OPENGL32.dll\glIndexMask", "uint", mask)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Integer} stride 
     * @param {Pointer<Void>} pointer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glindexpointer
     */
    static glIndexPointer(type, stride, pointer) {
        pointerMarshal := pointer is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glIndexPointer", "uint", type, "int", stride, pointerMarshal, pointer)
    }

    /**
     * 
     * @param {Float} c 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glindexd
     */
    static glIndexd(c) {
        DllCall("OPENGL32.dll\glIndexd", "double", c)
    }

    /**
     * 
     * @param {Pointer<Float>} c 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glindexdv
     */
    static glIndexdv(c) {
        cMarshal := c is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glIndexdv", cMarshal, c)
    }

    /**
     * 
     * @param {Float} c 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glindexf
     */
    static glIndexf(c) {
        DllCall("OPENGL32.dll\glIndexf", "float", c)
    }

    /**
     * 
     * @param {Pointer<Float>} c 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glindexfv
     */
    static glIndexfv(c) {
        cMarshal := c is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glIndexfv", cMarshal, c)
    }

    /**
     * 
     * @param {Integer} c 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glindexi
     */
    static glIndexi(c) {
        DllCall("OPENGL32.dll\glIndexi", "int", c)
    }

    /**
     * 
     * @param {Pointer<Integer>} c 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glindexiv
     */
    static glIndexiv(c) {
        cMarshal := c is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glIndexiv", cMarshal, c)
    }

    /**
     * 
     * @param {Integer} c 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glindexs
     */
    static glIndexs(c) {
        DllCall("OPENGL32.dll\glIndexs", "short", c)
    }

    /**
     * 
     * @param {Pointer<Integer>} c 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glindexsv
     */
    static glIndexsv(c) {
        cMarshal := c is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glIndexsv", cMarshal, c)
    }

    /**
     * 
     * @param {Integer} c 
     * @returns {String} Nothing - always returns an empty string
     */
    static glIndexub(c) {
        DllCall("OPENGL32.dll\glIndexub", "char", c)
    }

    /**
     * 
     * @param {Pointer<Integer>} c 
     * @returns {String} Nothing - always returns an empty string
     */
    static glIndexubv(c) {
        cMarshal := c is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glIndexubv", cMarshal, c)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glinitnames
     */
    static glInitNames() {
        DllCall("OPENGL32.dll\glInitNames")
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Integer} stride 
     * @param {Pointer<Void>} pointer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glinterleavedarrays
     */
    static glInterleavedArrays(format, stride, pointer) {
        pointerMarshal := pointer is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glInterleavedArrays", "uint", format, "int", stride, pointerMarshal, pointer)
    }

    /**
     * 
     * @param {Integer} cap 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glisenabled
     */
    static glIsEnabled(cap) {
        result := DllCall("OPENGL32.dll\glIsEnabled", "uint", cap, "char")
        return result
    }

    /**
     * 
     * @param {Integer} list 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glislist
     */
    static glIsList(list) {
        result := DllCall("OPENGL32.dll\glIsList", "uint", list, "char")
        return result
    }

    /**
     * 
     * @param {Integer} texture 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glistexture
     */
    static glIsTexture(texture) {
        result := DllCall("OPENGL32.dll\glIsTexture", "uint", texture, "char")
        return result
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Float} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllightmodelf
     */
    static glLightModelf(pname, param1) {
        DllCall("OPENGL32.dll\glLightModelf", "uint", pname, "float", param1)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllightmodelfv
     */
    static glLightModelfv(pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glLightModelfv", "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Integer} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllightmodeli
     */
    static glLightModeli(pname, param1) {
        DllCall("OPENGL32.dll\glLightModeli", "uint", pname, "int", param1)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllightmodeliv
     */
    static glLightModeliv(pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glLightModeliv", "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} light 
     * @param {Integer} pname 
     * @param {Float} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllightf
     */
    static glLightf(light, pname, param2) {
        DllCall("OPENGL32.dll\glLightf", "uint", light, "uint", pname, "float", param2)
    }

    /**
     * 
     * @param {Integer} light 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllightfv
     */
    static glLightfv(light, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glLightfv", "uint", light, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} light 
     * @param {Integer} pname 
     * @param {Integer} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllighti
     */
    static glLighti(light, pname, param2) {
        DllCall("OPENGL32.dll\glLighti", "uint", light, "uint", pname, "int", param2)
    }

    /**
     * 
     * @param {Integer} light 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllightiv
     */
    static glLightiv(light, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glLightiv", "uint", light, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} factor 
     * @param {Integer} pattern 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllinestipple
     */
    static glLineStipple(factor, pattern) {
        DllCall("OPENGL32.dll\glLineStipple", "int", factor, "ushort", pattern)
    }

    /**
     * 
     * @param {Float} width 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllinewidth
     */
    static glLineWidth(width) {
        DllCall("OPENGL32.dll\glLineWidth", "float", width)
    }

    /**
     * 
     * @param {Integer} base 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllistbase
     */
    static glListBase(base) {
        DllCall("OPENGL32.dll\glListBase", "uint", base)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glloadidentity
     */
    static glLoadIdentity() {
        DllCall("OPENGL32.dll\glLoadIdentity")
    }

    /**
     * 
     * @param {Pointer<Float>} m 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glloadmatrixd
     */
    static glLoadMatrixd(m) {
        mMarshal := m is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glLoadMatrixd", mMarshal, m)
    }

    /**
     * 
     * @param {Pointer<Float>} m 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glloadmatrixf
     */
    static glLoadMatrixf(m) {
        mMarshal := m is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glLoadMatrixf", mMarshal, m)
    }

    /**
     * 
     * @param {Integer} name 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glloadname
     */
    static glLoadName(name) {
        DllCall("OPENGL32.dll\glLoadName", "uint", name)
    }

    /**
     * 
     * @param {Integer} opcode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gllogicop
     */
    static glLogicOp(opcode) {
        DllCall("OPENGL32.dll\glLogicOp", "uint", opcode)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Float} u1 
     * @param {Float} u2 
     * @param {Integer} stride 
     * @param {Integer} order 
     * @param {Pointer<Float>} points 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmap1d
     */
    static glMap1d(target, u1, u2, stride, order, points) {
        pointsMarshal := points is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glMap1d", "uint", target, "double", u1, "double", u2, "int", stride, "int", order, pointsMarshal, points)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Float} u1 
     * @param {Float} u2 
     * @param {Integer} stride 
     * @param {Integer} order 
     * @param {Pointer<Float>} points 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmap1f
     */
    static glMap1f(target, u1, u2, stride, order, points) {
        pointsMarshal := points is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glMap1f", "uint", target, "float", u1, "float", u2, "int", stride, "int", order, pointsMarshal, points)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Float} u1 
     * @param {Float} u2 
     * @param {Integer} ustride 
     * @param {Integer} uorder 
     * @param {Float} v1 
     * @param {Float} v2 
     * @param {Integer} vstride 
     * @param {Integer} vorder 
     * @param {Pointer<Float>} points 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmap2d
     */
    static glMap2d(target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points) {
        pointsMarshal := points is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glMap2d", "uint", target, "double", u1, "double", u2, "int", ustride, "int", uorder, "double", v1, "double", v2, "int", vstride, "int", vorder, pointsMarshal, points)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Float} u1 
     * @param {Float} u2 
     * @param {Integer} ustride 
     * @param {Integer} uorder 
     * @param {Float} v1 
     * @param {Float} v2 
     * @param {Integer} vstride 
     * @param {Integer} vorder 
     * @param {Pointer<Float>} points 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmap2f
     */
    static glMap2f(target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points) {
        pointsMarshal := points is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glMap2f", "uint", target, "float", u1, "float", u2, "int", ustride, "int", uorder, "float", v1, "float", v2, "int", vstride, "int", vorder, pointsMarshal, points)
    }

    /**
     * 
     * @param {Integer} un 
     * @param {Float} u1 
     * @param {Float} u2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmapgrid1d
     */
    static glMapGrid1d(un, u1, u2) {
        DllCall("OPENGL32.dll\glMapGrid1d", "int", un, "double", u1, "double", u2)
    }

    /**
     * 
     * @param {Integer} un 
     * @param {Float} u1 
     * @param {Float} u2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmapgrid1f
     */
    static glMapGrid1f(un, u1, u2) {
        DllCall("OPENGL32.dll\glMapGrid1f", "int", un, "float", u1, "float", u2)
    }

    /**
     * 
     * @param {Integer} un 
     * @param {Float} u1 
     * @param {Float} u2 
     * @param {Integer} vn 
     * @param {Float} v1 
     * @param {Float} v2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmapgrid2d
     */
    static glMapGrid2d(un, u1, u2, vn, v1, v2) {
        DllCall("OPENGL32.dll\glMapGrid2d", "int", un, "double", u1, "double", u2, "int", vn, "double", v1, "double", v2)
    }

    /**
     * 
     * @param {Integer} un 
     * @param {Float} u1 
     * @param {Float} u2 
     * @param {Integer} vn 
     * @param {Float} v1 
     * @param {Float} v2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmapgrid2f
     */
    static glMapGrid2f(un, u1, u2, vn, v1, v2) {
        DllCall("OPENGL32.dll\glMapGrid2f", "int", un, "float", u1, "float", u2, "int", vn, "float", v1, "float", v2)
    }

    /**
     * 
     * @param {Integer} face 
     * @param {Integer} pname 
     * @param {Float} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmaterialf
     */
    static glMaterialf(face, pname, param2) {
        DllCall("OPENGL32.dll\glMaterialf", "uint", face, "uint", pname, "float", param2)
    }

    /**
     * 
     * @param {Integer} face 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmaterialfv
     */
    static glMaterialfv(face, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glMaterialfv", "uint", face, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} face 
     * @param {Integer} pname 
     * @param {Integer} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmateriali
     */
    static glMateriali(face, pname, param2) {
        DllCall("OPENGL32.dll\glMateriali", "uint", face, "uint", pname, "int", param2)
    }

    /**
     * 
     * @param {Integer} face 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmaterialiv
     */
    static glMaterialiv(face, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glMaterialiv", "uint", face, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmatrixmode
     */
    static glMatrixMode(mode) {
        DllCall("OPENGL32.dll\glMatrixMode", "uint", mode)
    }

    /**
     * 
     * @param {Pointer<Float>} m 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmultmatrixd
     */
    static glMultMatrixd(m) {
        mMarshal := m is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glMultMatrixd", mMarshal, m)
    }

    /**
     * 
     * @param {Pointer<Float>} m 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glmultmatrixf
     */
    static glMultMatrixf(m) {
        mMarshal := m is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glMultMatrixf", mMarshal, m)
    }

    /**
     * 
     * @param {Integer} list 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnewlist
     */
    static glNewList(list, mode) {
        DllCall("OPENGL32.dll\glNewList", "uint", list, "uint", mode)
    }

    /**
     * 
     * @param {Integer} nx 
     * @param {Integer} ny 
     * @param {Integer} nz 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormal3b
     */
    static glNormal3b(nx, ny, nz) {
        DllCall("OPENGL32.dll\glNormal3b", "char", nx, "char", ny, "char", nz)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormal3bv
     */
    static glNormal3bv(v) {
        vMarshal := v is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glNormal3bv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} nx 
     * @param {Float} ny 
     * @param {Float} nz 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormal3d
     */
    static glNormal3d(nx, ny, nz) {
        DllCall("OPENGL32.dll\glNormal3d", "double", nx, "double", ny, "double", nz)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormal3dv
     */
    static glNormal3dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glNormal3dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} nx 
     * @param {Float} ny 
     * @param {Float} nz 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormal3f
     */
    static glNormal3f(nx, ny, nz) {
        DllCall("OPENGL32.dll\glNormal3f", "float", nx, "float", ny, "float", nz)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormal3fv
     */
    static glNormal3fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glNormal3fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} nx 
     * @param {Integer} ny 
     * @param {Integer} nz 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormal3i
     */
    static glNormal3i(nx, ny, nz) {
        DllCall("OPENGL32.dll\glNormal3i", "int", nx, "int", ny, "int", nz)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormal3iv
     */
    static glNormal3iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glNormal3iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} nx 
     * @param {Integer} ny 
     * @param {Integer} nz 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormal3s
     */
    static glNormal3s(nx, ny, nz) {
        DllCall("OPENGL32.dll\glNormal3s", "short", nx, "short", ny, "short", nz)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormal3sv
     */
    static glNormal3sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glNormal3sv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Integer} stride 
     * @param {Pointer<Void>} pointer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glnormalpointer
     */
    static glNormalPointer(type, stride, pointer) {
        pointerMarshal := pointer is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glNormalPointer", "uint", type, "int", stride, pointerMarshal, pointer)
    }

    /**
     * 
     * @param {Float} left 
     * @param {Float} right 
     * @param {Float} bottom 
     * @param {Float} top 
     * @param {Float} zNear 
     * @param {Float} zFar 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glortho
     */
    static glOrtho(left, right, bottom, top, zNear, zFar) {
        DllCall("OPENGL32.dll\glOrtho", "double", left, "double", right, "double", bottom, "double", top, "double", zNear, "double", zFar)
    }

    /**
     * 
     * @param {Float} token 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpassthrough
     */
    static glPassThrough(token) {
        DllCall("OPENGL32.dll\glPassThrough", "float", token)
    }

    /**
     * 
     * @param {Integer} map 
     * @param {Integer} mapsize 
     * @param {Pointer<Float>} values 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpixelmapfv
     */
    static glPixelMapfv(map, mapsize, values) {
        valuesMarshal := values is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glPixelMapfv", "uint", map, "int", mapsize, valuesMarshal, values)
    }

    /**
     * 
     * @param {Integer} map 
     * @param {Integer} mapsize 
     * @param {Pointer<Integer>} values 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpixelmapuiv
     */
    static glPixelMapuiv(map, mapsize, values) {
        valuesMarshal := values is VarRef ? "uint*" : "ptr"

        DllCall("OPENGL32.dll\glPixelMapuiv", "uint", map, "int", mapsize, valuesMarshal, values)
    }

    /**
     * 
     * @param {Integer} map 
     * @param {Integer} mapsize 
     * @param {Pointer<Integer>} values 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpixelmapusv
     */
    static glPixelMapusv(map, mapsize, values) {
        valuesMarshal := values is VarRef ? "ushort*" : "ptr"

        DllCall("OPENGL32.dll\glPixelMapusv", "uint", map, "int", mapsize, valuesMarshal, values)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Float} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpixelstoref
     */
    static glPixelStoref(pname, param1) {
        DllCall("OPENGL32.dll\glPixelStoref", "uint", pname, "float", param1)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Integer} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpixelstorei
     */
    static glPixelStorei(pname, param1) {
        DllCall("OPENGL32.dll\glPixelStorei", "uint", pname, "int", param1)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Float} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpixeltransferf
     */
    static glPixelTransferf(pname, param1) {
        DllCall("OPENGL32.dll\glPixelTransferf", "uint", pname, "float", param1)
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Integer} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpixeltransferi
     */
    static glPixelTransferi(pname, param1) {
        DllCall("OPENGL32.dll\glPixelTransferi", "uint", pname, "int", param1)
    }

    /**
     * 
     * @param {Float} xfactor 
     * @param {Float} yfactor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpixelzoom
     */
    static glPixelZoom(xfactor, yfactor) {
        DllCall("OPENGL32.dll\glPixelZoom", "float", xfactor, "float", yfactor)
    }

    /**
     * 
     * @param {Float} size 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpointsize
     */
    static glPointSize(size) {
        DllCall("OPENGL32.dll\glPointSize", "float", size)
    }

    /**
     * 
     * @param {Integer} face 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpolygonmode
     */
    static glPolygonMode(face, mode) {
        DllCall("OPENGL32.dll\glPolygonMode", "uint", face, "uint", mode)
    }

    /**
     * 
     * @param {Float} factor 
     * @param {Float} units 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpolygonoffset
     */
    static glPolygonOffset(factor, units) {
        DllCall("OPENGL32.dll\glPolygonOffset", "float", factor, "float", units)
    }

    /**
     * 
     * @param {Pointer<Integer>} mask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpolygonstipple
     */
    static glPolygonStipple(mask) {
        maskMarshal := mask is VarRef ? "char*" : "ptr"

        DllCall("OPENGL32.dll\glPolygonStipple", maskMarshal, mask)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpopattrib
     */
    static glPopAttrib() {
        DllCall("OPENGL32.dll\glPopAttrib")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpopclientattrib
     */
    static glPopClientAttrib() {
        DllCall("OPENGL32.dll\glPopClientAttrib")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpopmatrix
     */
    static glPopMatrix() {
        DllCall("OPENGL32.dll\glPopMatrix")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpopname
     */
    static glPopName() {
        DllCall("OPENGL32.dll\glPopName")
    }

    /**
     * 
     * @param {Integer} n 
     * @param {Pointer<Integer>} textures 
     * @param {Pointer<Float>} priorities 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glprioritizetextures
     */
    static glPrioritizeTextures(n, textures, priorities) {
        texturesMarshal := textures is VarRef ? "uint*" : "ptr"
        prioritiesMarshal := priorities is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glPrioritizeTextures", "int", n, texturesMarshal, textures, prioritiesMarshal, priorities)
    }

    /**
     * 
     * @param {Integer} mask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpushattrib
     */
    static glPushAttrib(mask) {
        DllCall("OPENGL32.dll\glPushAttrib", "uint", mask)
    }

    /**
     * 
     * @param {Integer} mask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpushclientattrib
     */
    static glPushClientAttrib(mask) {
        DllCall("OPENGL32.dll\glPushClientAttrib", "uint", mask)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpushmatrix
     */
    static glPushMatrix() {
        DllCall("OPENGL32.dll\glPushMatrix")
    }

    /**
     * 
     * @param {Integer} name 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glpushname
     */
    static glPushName(name) {
        DllCall("OPENGL32.dll\glPushName", "uint", name)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos2d
     */
    static glRasterPos2d(x, y) {
        DllCall("OPENGL32.dll\glRasterPos2d", "double", x, "double", y)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos2dv
     */
    static glRasterPos2dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos2dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos2f
     */
    static glRasterPos2f(x, y) {
        DllCall("OPENGL32.dll\glRasterPos2f", "float", x, "float", y)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos2fv
     */
    static glRasterPos2fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos2fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos2i
     */
    static glRasterPos2i(x, y) {
        DllCall("OPENGL32.dll\glRasterPos2i", "int", x, "int", y)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos2iv
     */
    static glRasterPos2iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos2iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos2s
     */
    static glRasterPos2s(x, y) {
        DllCall("OPENGL32.dll\glRasterPos2s", "short", x, "short", y)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos2sv
     */
    static glRasterPos2sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos2sv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos3d
     */
    static glRasterPos3d(x, y, z) {
        DllCall("OPENGL32.dll\glRasterPos3d", "double", x, "double", y, "double", z)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos3dv
     */
    static glRasterPos3dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos3dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos3f
     */
    static glRasterPos3f(x, y, z) {
        DllCall("OPENGL32.dll\glRasterPos3f", "float", x, "float", y, "float", z)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos3fv
     */
    static glRasterPos3fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos3fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos3i
     */
    static glRasterPos3i(x, y, z) {
        DllCall("OPENGL32.dll\glRasterPos3i", "int", x, "int", y, "int", z)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos3iv
     */
    static glRasterPos3iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos3iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos3s
     */
    static glRasterPos3s(x, y, z) {
        DllCall("OPENGL32.dll\glRasterPos3s", "short", x, "short", y, "short", z)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos3sv
     */
    static glRasterPos3sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos3sv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @param {Float} w 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos4d
     */
    static glRasterPos4d(x, y, z, w) {
        DllCall("OPENGL32.dll\glRasterPos4d", "double", x, "double", y, "double", z, "double", w)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos4dv
     */
    static glRasterPos4dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos4dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @param {Float} w 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos4f
     */
    static glRasterPos4f(x, y, z, w) {
        DllCall("OPENGL32.dll\glRasterPos4f", "float", x, "float", y, "float", z, "float", w)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos4fv
     */
    static glRasterPos4fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos4fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} z 
     * @param {Integer} w 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos4i
     */
    static glRasterPos4i(x, y, z, w) {
        DllCall("OPENGL32.dll\glRasterPos4i", "int", x, "int", y, "int", z, "int", w)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos4iv
     */
    static glRasterPos4iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos4iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} z 
     * @param {Integer} w 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos4s
     */
    static glRasterPos4s(x, y, z, w) {
        DllCall("OPENGL32.dll\glRasterPos4s", "short", x, "short", y, "short", z, "short", w)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrasterpos4sv
     */
    static glRasterPos4sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glRasterPos4sv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glreadbuffer
     */
    static glReadBuffer(mode) {
        DllCall("OPENGL32.dll\glReadBuffer", "uint", mode)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} format 
     * @param {Integer} type 
     * @param {Pointer<Void>} pixels 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glreadpixels
     */
    static glReadPixels(x, y, width, height, format, type, pixels) {
        pixelsMarshal := pixels is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glReadPixels", "int", x, "int", y, "int", width, "int", height, "uint", format, "uint", type, pixelsMarshal, pixels)
    }

    /**
     * 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrectd
     */
    static glRectd(x1, y1, x2, y2) {
        DllCall("OPENGL32.dll\glRectd", "double", x1, "double", y1, "double", x2, "double", y2)
    }

    /**
     * 
     * @param {Pointer<Float>} v1 
     * @param {Pointer<Float>} v2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrectdv
     */
    static glRectdv(v1, v2) {
        v1Marshal := v1 is VarRef ? "double*" : "ptr"
        v2Marshal := v2 is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glRectdv", v1Marshal, v1, v2Marshal, v2)
    }

    /**
     * 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrectf
     */
    static glRectf(x1, y1, x2, y2) {
        DllCall("OPENGL32.dll\glRectf", "float", x1, "float", y1, "float", x2, "float", y2)
    }

    /**
     * 
     * @param {Pointer<Float>} v1 
     * @param {Pointer<Float>} v2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrectfv
     */
    static glRectfv(v1, v2) {
        v1Marshal := v1 is VarRef ? "float*" : "ptr"
        v2Marshal := v2 is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glRectfv", v1Marshal, v1, v2Marshal, v2)
    }

    /**
     * 
     * @param {Integer} x1 
     * @param {Integer} y1 
     * @param {Integer} x2 
     * @param {Integer} y2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrecti
     */
    static glRecti(x1, y1, x2, y2) {
        DllCall("OPENGL32.dll\glRecti", "int", x1, "int", y1, "int", x2, "int", y2)
    }

    /**
     * 
     * @param {Pointer<Integer>} v1 
     * @param {Pointer<Integer>} v2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrectiv
     */
    static glRectiv(v1, v2) {
        v1Marshal := v1 is VarRef ? "int*" : "ptr"
        v2Marshal := v2 is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glRectiv", v1Marshal, v1, v2Marshal, v2)
    }

    /**
     * 
     * @param {Integer} x1 
     * @param {Integer} y1 
     * @param {Integer} x2 
     * @param {Integer} y2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrects
     */
    static glRects(x1, y1, x2, y2) {
        DllCall("OPENGL32.dll\glRects", "short", x1, "short", y1, "short", x2, "short", y2)
    }

    /**
     * 
     * @param {Pointer<Integer>} v1 
     * @param {Pointer<Integer>} v2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrectsv
     */
    static glRectsv(v1, v2) {
        v1Marshal := v1 is VarRef ? "short*" : "ptr"
        v2Marshal := v2 is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glRectsv", v1Marshal, v1, v2Marshal, v2)
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrendermode
     */
    static glRenderMode(mode) {
        result := DllCall("OPENGL32.dll\glRenderMode", "uint", mode, "int")
        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrotated
     */
    static glRotated(angle, x, y, z) {
        DllCall("OPENGL32.dll\glRotated", "double", angle, "double", x, "double", y, "double", z)
    }

    /**
     * 
     * @param {Float} angle 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glrotatef
     */
    static glRotatef(angle, x, y, z) {
        DllCall("OPENGL32.dll\glRotatef", "float", angle, "float", x, "float", y, "float", z)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glscaled
     */
    static glScaled(x, y, z) {
        DllCall("OPENGL32.dll\glScaled", "double", x, "double", y, "double", z)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glscalef
     */
    static glScalef(x, y, z) {
        DllCall("OPENGL32.dll\glScalef", "float", x, "float", y, "float", z)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glscissor
     */
    static glScissor(x, y, width, height) {
        DllCall("OPENGL32.dll\glScissor", "int", x, "int", y, "int", width, "int", height)
    }

    /**
     * 
     * @param {Integer} size 
     * @param {Pointer<Integer>} buffer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glselectbuffer
     */
    static glSelectBuffer(size, buffer) {
        bufferMarshal := buffer is VarRef ? "uint*" : "ptr"

        DllCall("OPENGL32.dll\glSelectBuffer", "int", size, bufferMarshal, buffer)
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glshademodel
     */
    static glShadeModel(mode) {
        DllCall("OPENGL32.dll\glShadeModel", "uint", mode)
    }

    /**
     * 
     * @param {Integer} func 
     * @param {Integer} ref 
     * @param {Integer} mask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glstencilfunc
     */
    static glStencilFunc(func, ref, mask) {
        DllCall("OPENGL32.dll\glStencilFunc", "uint", func, "int", ref, "uint", mask)
    }

    /**
     * 
     * @param {Integer} mask 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glstencilmask
     */
    static glStencilMask(mask) {
        DllCall("OPENGL32.dll\glStencilMask", "uint", mask)
    }

    /**
     * 
     * @param {Integer} fail 
     * @param {Integer} zfail 
     * @param {Integer} zpass 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glstencilop
     */
    static glStencilOp(fail, zfail, zpass) {
        DllCall("OPENGL32.dll\glStencilOp", "uint", fail, "uint", zfail, "uint", zpass)
    }

    /**
     * 
     * @param {Float} s 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord1d
     */
    static glTexCoord1d(s) {
        DllCall("OPENGL32.dll\glTexCoord1d", "double", s)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord1dv
     */
    static glTexCoord1dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord1dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} s 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord1f
     */
    static glTexCoord1f(s) {
        DllCall("OPENGL32.dll\glTexCoord1f", "float", s)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord1fv
     */
    static glTexCoord1fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord1fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} s 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord1i
     */
    static glTexCoord1i(s) {
        DllCall("OPENGL32.dll\glTexCoord1i", "int", s)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord1iv
     */
    static glTexCoord1iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord1iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} s 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord1s
     */
    static glTexCoord1s(s) {
        DllCall("OPENGL32.dll\glTexCoord1s", "short", s)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord1sv
     */
    static glTexCoord1sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord1sv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} s 
     * @param {Float} t 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord2d
     */
    static glTexCoord2d(s, t) {
        DllCall("OPENGL32.dll\glTexCoord2d", "double", s, "double", t)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord2dv
     */
    static glTexCoord2dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord2dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} s 
     * @param {Float} t 
     * @returns {String} Nothing - always returns an empty string
     */
    static glTexCoord2f(s, t) {
        DllCall("OPENGL32.dll\glTexCoord2f", "float", s, "float", t)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord2fv
     */
    static glTexCoord2fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord2fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} s 
     * @param {Integer} t 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord2i
     */
    static glTexCoord2i(s, t) {
        DllCall("OPENGL32.dll\glTexCoord2i", "int", s, "int", t)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord2iv
     */
    static glTexCoord2iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord2iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} s 
     * @param {Integer} t 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord2s
     */
    static glTexCoord2s(s, t) {
        DllCall("OPENGL32.dll\glTexCoord2s", "short", s, "short", t)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord2sv
     */
    static glTexCoord2sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord2sv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} s 
     * @param {Float} t 
     * @param {Float} r 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord3d
     */
    static glTexCoord3d(s, t, r) {
        DllCall("OPENGL32.dll\glTexCoord3d", "double", s, "double", t, "double", r)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord3dv
     */
    static glTexCoord3dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord3dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} s 
     * @param {Float} t 
     * @param {Float} r 
     * @returns {String} Nothing - always returns an empty string
     */
    static glTexCoord3f(s, t, r) {
        DllCall("OPENGL32.dll\glTexCoord3f", "float", s, "float", t, "float", r)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord3fv
     */
    static glTexCoord3fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord3fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} s 
     * @param {Integer} t 
     * @param {Integer} r 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord3i
     */
    static glTexCoord3i(s, t, r) {
        DllCall("OPENGL32.dll\glTexCoord3i", "int", s, "int", t, "int", r)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord3iv
     */
    static glTexCoord3iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord3iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} s 
     * @param {Integer} t 
     * @param {Integer} r 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord3s
     */
    static glTexCoord3s(s, t, r) {
        DllCall("OPENGL32.dll\glTexCoord3s", "short", s, "short", t, "short", r)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord3sv
     */
    static glTexCoord3sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord3sv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} s 
     * @param {Float} t 
     * @param {Float} r 
     * @param {Float} q 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord4d
     */
    static glTexCoord4d(s, t, r, q) {
        DllCall("OPENGL32.dll\glTexCoord4d", "double", s, "double", t, "double", r, "double", q)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord4dv
     */
    static glTexCoord4dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord4dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} s 
     * @param {Float} t 
     * @param {Float} r 
     * @param {Float} q 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord4f
     */
    static glTexCoord4f(s, t, r, q) {
        DllCall("OPENGL32.dll\glTexCoord4f", "float", s, "float", t, "float", r, "float", q)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord4fv
     */
    static glTexCoord4fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord4fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} s 
     * @param {Integer} t 
     * @param {Integer} r 
     * @param {Integer} q 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord4i
     */
    static glTexCoord4i(s, t, r, q) {
        DllCall("OPENGL32.dll\glTexCoord4i", "int", s, "int", t, "int", r, "int", q)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord4iv
     */
    static glTexCoord4iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord4iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} s 
     * @param {Integer} t 
     * @param {Integer} r 
     * @param {Integer} q 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord4s
     */
    static glTexCoord4s(s, t, r, q) {
        DllCall("OPENGL32.dll\glTexCoord4s", "short", s, "short", t, "short", r, "short", q)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoord4sv
     */
    static glTexCoord4sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glTexCoord4sv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} size 
     * @param {Integer} type 
     * @param {Integer} stride 
     * @param {Pointer<Void>} pointer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexcoordpointer
     */
    static glTexCoordPointer(size, type, stride, pointer) {
        pointerMarshal := pointer is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glTexCoordPointer", "int", size, "uint", type, "int", stride, pointerMarshal, pointer)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Float} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexenvf
     */
    static glTexEnvf(target, pname, param2) {
        DllCall("OPENGL32.dll\glTexEnvf", "uint", target, "uint", pname, "float", param2)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexenvfv
     */
    static glTexEnvfv(target, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glTexEnvfv", "uint", target, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Integer} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexenvi
     */
    static glTexEnvi(target, pname, param2) {
        DllCall("OPENGL32.dll\glTexEnvi", "uint", target, "uint", pname, "int", param2)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexenviv
     */
    static glTexEnviv(target, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glTexEnviv", "uint", target, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} coord 
     * @param {Integer} pname 
     * @param {Float} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexgend
     */
    static glTexGend(coord, pname, param2) {
        DllCall("OPENGL32.dll\glTexGend", "uint", coord, "uint", pname, "double", param2)
    }

    /**
     * 
     * @param {Integer} coord 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexgendv
     */
    static glTexGendv(coord, pname, params) {
        paramsMarshal := params is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glTexGendv", "uint", coord, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} coord 
     * @param {Integer} pname 
     * @param {Float} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexgenf
     */
    static glTexGenf(coord, pname, param2) {
        DllCall("OPENGL32.dll\glTexGenf", "uint", coord, "uint", pname, "float", param2)
    }

    /**
     * 
     * @param {Integer} coord 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexgenfv
     */
    static glTexGenfv(coord, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glTexGenfv", "uint", coord, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} coord 
     * @param {Integer} pname 
     * @param {Integer} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexgeni
     */
    static glTexGeni(coord, pname, param2) {
        DllCall("OPENGL32.dll\glTexGeni", "uint", coord, "uint", pname, "int", param2)
    }

    /**
     * 
     * @param {Integer} coord 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexgeniv
     */
    static glTexGeniv(coord, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glTexGeniv", "uint", coord, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} internalformat 
     * @param {Integer} width 
     * @param {Integer} border 
     * @param {Integer} format 
     * @param {Integer} type 
     * @param {Pointer<Void>} pixels 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glteximage1d
     */
    static glTexImage1D(target, level, internalformat, width, border, format, type, pixels) {
        pixelsMarshal := pixels is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glTexImage1D", "uint", target, "int", level, "int", internalformat, "int", width, "int", border, "uint", format, "uint", type, pixelsMarshal, pixels)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} internalformat 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} border 
     * @param {Integer} format 
     * @param {Integer} type 
     * @param {Pointer<Void>} pixels 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glteximage2d
     */
    static glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels) {
        pixelsMarshal := pixels is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glTexImage2D", "uint", target, "int", level, "int", internalformat, "int", width, "int", height, "int", border, "uint", format, "uint", type, pixelsMarshal, pixels)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Float} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexparameterf
     */
    static glTexParameterf(target, pname, param2) {
        DllCall("OPENGL32.dll\glTexParameterf", "uint", target, "uint", pname, "float", param2)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexparameterfv
     */
    static glTexParameterfv(target, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glTexParameterfv", "uint", target, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Integer} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexparameteri
     */
    static glTexParameteri(target, pname, param2) {
        DllCall("OPENGL32.dll\glTexParameteri", "uint", target, "uint", pname, "int", param2)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexparameteriv
     */
    static glTexParameteriv(target, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glTexParameteriv", "uint", target, "uint", pname, paramsMarshal, params)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} xoffset 
     * @param {Integer} width 
     * @param {Integer} format 
     * @param {Integer} type 
     * @param {Pointer<Void>} pixels 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexsubimage1d
     */
    static glTexSubImage1D(target, level, xoffset, width, format, type, pixels) {
        pixelsMarshal := pixels is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glTexSubImage1D", "uint", target, "int", level, "int", xoffset, "int", width, "uint", format, "uint", type, pixelsMarshal, pixels)
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} level 
     * @param {Integer} xoffset 
     * @param {Integer} yoffset 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} format 
     * @param {Integer} type 
     * @param {Pointer<Void>} pixels 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltexsubimage2d
     */
    static glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels) {
        pixelsMarshal := pixels is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glTexSubImage2D", "uint", target, "int", level, "int", xoffset, "int", yoffset, "int", width, "int", height, "uint", format, "uint", type, pixelsMarshal, pixels)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltranslated
     */
    static glTranslated(x, y, z) {
        DllCall("OPENGL32.dll\glTranslated", "double", x, "double", y, "double", z)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gltranslatef
     */
    static glTranslatef(x, y, z) {
        DllCall("OPENGL32.dll\glTranslatef", "float", x, "float", y, "float", z)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex2d
     */
    static glVertex2d(x, y) {
        DllCall("OPENGL32.dll\glVertex2d", "double", x, "double", y)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex2dv
     */
    static glVertex2dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glVertex2dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex2f
     */
    static glVertex2f(x, y) {
        DllCall("OPENGL32.dll\glVertex2f", "float", x, "float", y)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex2fv
     */
    static glVertex2fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glVertex2fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex2i
     */
    static glVertex2i(x, y) {
        DllCall("OPENGL32.dll\glVertex2i", "int", x, "int", y)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex2iv
     */
    static glVertex2iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glVertex2iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex2s
     */
    static glVertex2s(x, y) {
        DllCall("OPENGL32.dll\glVertex2s", "short", x, "short", y)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex2sv
     */
    static glVertex2sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glVertex2sv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex3d
     */
    static glVertex3d(x, y, z) {
        DllCall("OPENGL32.dll\glVertex3d", "double", x, "double", y, "double", z)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex3dv
     */
    static glVertex3dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glVertex3dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex3f
     */
    static glVertex3f(x, y, z) {
        DllCall("OPENGL32.dll\glVertex3f", "float", x, "float", y, "float", z)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex3fv
     */
    static glVertex3fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glVertex3fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex3i
     */
    static glVertex3i(x, y, z) {
        DllCall("OPENGL32.dll\glVertex3i", "int", x, "int", y, "int", z)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex3iv
     */
    static glVertex3iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glVertex3iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex3s
     */
    static glVertex3s(x, y, z) {
        DllCall("OPENGL32.dll\glVertex3s", "short", x, "short", y, "short", z)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex3sv
     */
    static glVertex3sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glVertex3sv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @param {Float} w 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex4d
     */
    static glVertex4d(x, y, z, w) {
        DllCall("OPENGL32.dll\glVertex4d", "double", x, "double", y, "double", z, "double", w)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex4dv
     */
    static glVertex4dv(v) {
        vMarshal := v is VarRef ? "double*" : "ptr"

        DllCall("OPENGL32.dll\glVertex4dv", vMarshal, v)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @param {Float} w 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex4f
     */
    static glVertex4f(x, y, z, w) {
        DllCall("OPENGL32.dll\glVertex4f", "float", x, "float", y, "float", z, "float", w)
    }

    /**
     * 
     * @param {Pointer<Float>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex4fv
     */
    static glVertex4fv(v) {
        vMarshal := v is VarRef ? "float*" : "ptr"

        DllCall("OPENGL32.dll\glVertex4fv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} z 
     * @param {Integer} w 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex4i
     */
    static glVertex4i(x, y, z, w) {
        DllCall("OPENGL32.dll\glVertex4i", "int", x, "int", y, "int", z, "int", w)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex4iv
     */
    static glVertex4iv(v) {
        vMarshal := v is VarRef ? "int*" : "ptr"

        DllCall("OPENGL32.dll\glVertex4iv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} z 
     * @param {Integer} w 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex4s
     */
    static glVertex4s(x, y, z, w) {
        DllCall("OPENGL32.dll\glVertex4s", "short", x, "short", y, "short", z, "short", w)
    }

    /**
     * 
     * @param {Pointer<Integer>} v 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertex4sv
     */
    static glVertex4sv(v) {
        vMarshal := v is VarRef ? "short*" : "ptr"

        DllCall("OPENGL32.dll\glVertex4sv", vMarshal, v)
    }

    /**
     * 
     * @param {Integer} size 
     * @param {Integer} type 
     * @param {Integer} stride 
     * @param {Pointer<Void>} pointer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glvertexpointer
     */
    static glVertexPointer(size, type, stride, pointer) {
        pointerMarshal := pointer is VarRef ? "ptr" : "ptr"

        DllCall("OPENGL32.dll\glVertexPointer", "int", size, "uint", type, "int", stride, pointerMarshal, pointer)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glviewport
     */
    static glViewport(x, y, width, height) {
        DllCall("OPENGL32.dll\glViewport", "int", x, "int", y, "int", width, "int", height)
    }

    /**
     * 
     * @param {Integer} errCode 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluerrorstring
     */
    static gluErrorString(errCode) {
        result := DllCall("GLU32.dll\gluErrorString", "uint", errCode, "char*")
        return result
    }

    /**
     * 
     * @param {Integer} errCode 
     * @returns {PWSTR} 
     */
    static gluErrorUnicodeStringEXT(errCode) {
        result := DllCall("GLU32.dll\gluErrorUnicodeStringEXT", "uint", errCode, "char*")
        return result
    }

    /**
     * 
     * @param {Integer} name 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glugetstring
     */
    static gluGetString(name) {
        result := DllCall("GLU32.dll\gluGetString", "uint", name, "char*")
        return result
    }

    /**
     * 
     * @param {Float} left 
     * @param {Float} right 
     * @param {Float} bottom 
     * @param {Float} top 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluortho2d
     */
    static gluOrtho2D(left, right, bottom, top) {
        DllCall("GLU32.dll\gluOrtho2D", "double", left, "double", right, "double", bottom, "double", top)
    }

    /**
     * 
     * @param {Float} fovy 
     * @param {Float} aspect 
     * @param {Float} zNear 
     * @param {Float} zFar 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluperspective
     */
    static gluPerspective(fovy, aspect, zNear, zFar) {
        DllCall("GLU32.dll\gluPerspective", "double", fovy, "double", aspect, "double", zNear, "double", zFar)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<Integer>} viewport 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glupickmatrix
     */
    static gluPickMatrix(x, y, width, height, viewport) {
        viewportMarshal := viewport is VarRef ? "int*" : "ptr"

        DllCall("GLU32.dll\gluPickMatrix", "double", x, "double", y, "double", width, "double", height, viewportMarshal, viewport)
    }

    /**
     * 
     * @param {Float} eyex 
     * @param {Float} eyey 
     * @param {Float} eyez 
     * @param {Float} centerx 
     * @param {Float} centery 
     * @param {Float} centerz 
     * @param {Float} upx 
     * @param {Float} upy 
     * @param {Float} upz 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glulookat
     */
    static gluLookAt(eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz) {
        DllCall("GLU32.dll\gluLookAt", "double", eyex, "double", eyey, "double", eyez, "double", centerx, "double", centery, "double", centerz, "double", upx, "double", upy, "double", upz)
    }

    /**
     * 
     * @param {Float} objx 
     * @param {Float} objy 
     * @param {Float} objz 
     * @param {Pointer<Float>} modelMatrix 
     * @param {Pointer<Float>} projMatrix 
     * @param {Pointer<Integer>} viewport 
     * @param {Pointer<Float>} winx 
     * @param {Pointer<Float>} winy 
     * @param {Pointer<Float>} winz 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluproject
     */
    static gluProject(objx, objy, objz, modelMatrix, projMatrix, viewport, winx, winy, winz) {
        modelMatrixMarshal := modelMatrix is VarRef ? "double*" : "ptr"
        projMatrixMarshal := projMatrix is VarRef ? "double*" : "ptr"
        viewportMarshal := viewport is VarRef ? "int*" : "ptr"
        winxMarshal := winx is VarRef ? "double*" : "ptr"
        winyMarshal := winy is VarRef ? "double*" : "ptr"
        winzMarshal := winz is VarRef ? "double*" : "ptr"

        result := DllCall("GLU32.dll\gluProject", "double", objx, "double", objy, "double", objz, modelMatrixMarshal, modelMatrix, projMatrixMarshal, projMatrix, viewportMarshal, viewport, winxMarshal, winx, winyMarshal, winy, winzMarshal, winz, "int")
        return result
    }

    /**
     * 
     * @param {Float} winx 
     * @param {Float} winy 
     * @param {Float} winz 
     * @param {Pointer<Float>} modelMatrix 
     * @param {Pointer<Float>} projMatrix 
     * @param {Pointer<Integer>} viewport 
     * @param {Pointer<Float>} objx 
     * @param {Pointer<Float>} objy 
     * @param {Pointer<Float>} objz 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluunproject
     */
    static gluUnProject(winx, winy, winz, modelMatrix, projMatrix, viewport, objx, objy, objz) {
        modelMatrixMarshal := modelMatrix is VarRef ? "double*" : "ptr"
        projMatrixMarshal := projMatrix is VarRef ? "double*" : "ptr"
        viewportMarshal := viewport is VarRef ? "int*" : "ptr"
        objxMarshal := objx is VarRef ? "double*" : "ptr"
        objyMarshal := objy is VarRef ? "double*" : "ptr"
        objzMarshal := objz is VarRef ? "double*" : "ptr"

        result := DllCall("GLU32.dll\gluUnProject", "double", winx, "double", winy, "double", winz, modelMatrixMarshal, modelMatrix, projMatrixMarshal, projMatrix, viewportMarshal, viewport, objxMarshal, objx, objyMarshal, objy, objzMarshal, objz, "int")
        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Integer} widthin 
     * @param {Integer} heightin 
     * @param {Integer} typein 
     * @param {Pointer<Void>} datain 
     * @param {Integer} widthout 
     * @param {Integer} heightout 
     * @param {Integer} typeout 
     * @param {Pointer<Void>} dataout 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluscaleimage
     */
    static gluScaleImage(format, widthin, heightin, typein, datain, widthout, heightout, typeout, dataout) {
        datainMarshal := datain is VarRef ? "ptr" : "ptr"
        dataoutMarshal := dataout is VarRef ? "ptr" : "ptr"

        result := DllCall("GLU32.dll\gluScaleImage", "uint", format, "int", widthin, "int", heightin, "uint", typein, datainMarshal, datain, "int", widthout, "int", heightout, "uint", typeout, dataoutMarshal, dataout, "int")
        return result
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} components 
     * @param {Integer} width 
     * @param {Integer} format 
     * @param {Integer} type 
     * @param {Pointer<Void>} data 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glubuild1dmipmaps
     */
    static gluBuild1DMipmaps(target, components, width, format, type, data) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        result := DllCall("GLU32.dll\gluBuild1DMipmaps", "uint", target, "int", components, "int", width, "uint", format, "uint", type, dataMarshal, data, "int")
        return result
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} components 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} format 
     * @param {Integer} type 
     * @param {Pointer<Void>} data 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glubuild2dmipmaps
     */
    static gluBuild2DMipmaps(target, components, width, height, format, type, data) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        result := DllCall("GLU32.dll\gluBuild2DMipmaps", "uint", target, "int", components, "int", width, "int", height, "uint", format, "uint", type, dataMarshal, data, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<GLUquadric>} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glunewquadric
     */
    static gluNewQuadric() {
        result := DllCall("GLU32.dll\gluNewQuadric", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<GLUquadric>} state 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gludeletequadric
     */
    static gluDeleteQuadric(state) {
        DllCall("GLU32.dll\gluDeleteQuadric", "ptr", state)
    }

    /**
     * 
     * @param {Pointer<GLUquadric>} quadObject 
     * @param {Integer} normals 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluquadricnormals
     */
    static gluQuadricNormals(quadObject, normals) {
        DllCall("GLU32.dll\gluQuadricNormals", "ptr", quadObject, "uint", normals)
    }

    /**
     * 
     * @param {Pointer<GLUquadric>} quadObject 
     * @param {Integer} textureCoords 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluquadrictexture
     */
    static gluQuadricTexture(quadObject, textureCoords) {
        DllCall("GLU32.dll\gluQuadricTexture", "ptr", quadObject, "char", textureCoords)
    }

    /**
     * 
     * @param {Pointer<GLUquadric>} quadObject 
     * @param {Integer} orientation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluquadricorientation
     */
    static gluQuadricOrientation(quadObject, orientation) {
        DllCall("GLU32.dll\gluQuadricOrientation", "ptr", quadObject, "uint", orientation)
    }

    /**
     * 
     * @param {Pointer<GLUquadric>} quadObject 
     * @param {Integer} drawStyle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluquadricdrawstyle
     */
    static gluQuadricDrawStyle(quadObject, drawStyle) {
        DllCall("GLU32.dll\gluQuadricDrawStyle", "ptr", quadObject, "uint", drawStyle)
    }

    /**
     * 
     * @param {Pointer<GLUquadric>} qobj 
     * @param {Float} baseRadius 
     * @param {Float} topRadius 
     * @param {Float} height 
     * @param {Integer} slices 
     * @param {Integer} stacks 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glucylinder
     */
    static gluCylinder(qobj, baseRadius, topRadius, height, slices, stacks) {
        DllCall("GLU32.dll\gluCylinder", "ptr", qobj, "double", baseRadius, "double", topRadius, "double", height, "int", slices, "int", stacks)
    }

    /**
     * 
     * @param {Pointer<GLUquadric>} qobj 
     * @param {Float} innerRadius 
     * @param {Float} outerRadius 
     * @param {Integer} slices 
     * @param {Integer} loops 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gludisk
     */
    static gluDisk(qobj, innerRadius, outerRadius, slices, loops) {
        DllCall("GLU32.dll\gluDisk", "ptr", qobj, "double", innerRadius, "double", outerRadius, "int", slices, "int", loops)
    }

    /**
     * 
     * @param {Pointer<GLUquadric>} qobj 
     * @param {Float} innerRadius 
     * @param {Float} outerRadius 
     * @param {Integer} slices 
     * @param {Integer} loops 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glupartialdisk
     */
    static gluPartialDisk(qobj, innerRadius, outerRadius, slices, loops, startAngle, sweepAngle) {
        DllCall("GLU32.dll\gluPartialDisk", "ptr", qobj, "double", innerRadius, "double", outerRadius, "int", slices, "int", loops, "double", startAngle, "double", sweepAngle)
    }

    /**
     * 
     * @param {Pointer<GLUquadric>} qobj 
     * @param {Float} radius 
     * @param {Integer} slices 
     * @param {Integer} stacks 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glusphere
     */
    static gluSphere(qobj, radius, slices, stacks) {
        DllCall("GLU32.dll\gluSphere", "ptr", qobj, "double", radius, "int", slices, "int", stacks)
    }

    /**
     * 
     * @param {Pointer<GLUquadric>} qobj 
     * @param {Integer} which 
     * @param {Pointer} fn 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluquadric
     */
    static gluQuadricCallback(qobj, which, fn) {
        DllCall("GLU32.dll\gluQuadricCallback", "ptr", qobj, "uint", which, "ptr", fn)
    }

    /**
     * 
     * @returns {Pointer<GLUtesselator>} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glunewtess
     */
    static gluNewTess() {
        result := DllCall("GLU32.dll\gluNewTess", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gludeletetess
     */
    static gluDeleteTess(tess) {
        DllCall("GLU32.dll\gluDeleteTess", "ptr", tess)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @param {Pointer<Void>} polygon_data 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glutessbeginpolygon
     */
    static gluTessBeginPolygon(tess, polygon_data) {
        polygon_dataMarshal := polygon_data is VarRef ? "ptr" : "ptr"

        DllCall("GLU32.dll\gluTessBeginPolygon", "ptr", tess, polygon_dataMarshal, polygon_data)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glutessbegincontour
     */
    static gluTessBeginContour(tess) {
        DllCall("GLU32.dll\gluTessBeginContour", "ptr", tess)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @param {Pointer<Float>} coords 
     * @param {Pointer<Void>} data 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glutessvertex
     */
    static gluTessVertex(tess, coords, data) {
        coordsMarshal := coords is VarRef ? "double*" : "ptr"
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        DllCall("GLU32.dll\gluTessVertex", "ptr", tess, coordsMarshal, coords, dataMarshal, data)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glutessendcontour
     */
    static gluTessEndContour(tess) {
        DllCall("GLU32.dll\gluTessEndContour", "ptr", tess)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glutessendpolygon
     */
    static gluTessEndPolygon(tess) {
        DllCall("GLU32.dll\gluTessEndPolygon", "ptr", tess)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @param {Integer} which 
     * @param {Float} value 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glutessproperty
     */
    static gluTessProperty(tess, which, value) {
        DllCall("GLU32.dll\gluTessProperty", "ptr", tess, "uint", which, "double", value)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glutessnormal
     */
    static gluTessNormal(tess, x, y, z) {
        DllCall("GLU32.dll\gluTessNormal", "ptr", tess, "double", x, "double", y, "double", z)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @param {Integer} which 
     * @param {Pointer} fn 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glutess
     */
    static gluTessCallback(tess, which, fn) {
        DllCall("GLU32.dll\gluTessCallback", "ptr", tess, "uint", which, "ptr", fn)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @param {Integer} which 
     * @param {Pointer<Float>} value 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glugettessproperty
     */
    static gluGetTessProperty(tess, which, value) {
        valueMarshal := value is VarRef ? "double*" : "ptr"

        DllCall("GLU32.dll\gluGetTessProperty", "ptr", tess, "uint", which, valueMarshal, value)
    }

    /**
     * 
     * @returns {Pointer<GLUnurbs>} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glunewnurbsrenderer
     */
    static gluNewNurbsRenderer() {
        result := DllCall("GLU32.dll\gluNewNurbsRenderer", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gludeletenurbsrenderer
     */
    static gluDeleteNurbsRenderer(nobj) {
        DllCall("GLU32.dll\gluDeleteNurbsRenderer", "ptr", nobj)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glubeginsurface
     */
    static gluBeginSurface(nobj) {
        DllCall("GLU32.dll\gluBeginSurface", "ptr", nobj)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glubegincurve
     */
    static gluBeginCurve(nobj) {
        DllCall("GLU32.dll\gluBeginCurve", "ptr", nobj)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluendcurve
     */
    static gluEndCurve(nobj) {
        DllCall("GLU32.dll\gluEndCurve", "ptr", nobj)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluendsurface
     */
    static gluEndSurface(nobj) {
        DllCall("GLU32.dll\gluEndSurface", "ptr", nobj)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glubegintrim
     */
    static gluBeginTrim(nobj) {
        DllCall("GLU32.dll\gluBeginTrim", "ptr", nobj)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluendtrim
     */
    static gluEndTrim(nobj) {
        DllCall("GLU32.dll\gluEndTrim", "ptr", nobj)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @param {Integer} count 
     * @param {Pointer<Float>} array 
     * @param {Integer} stride 
     * @param {Integer} type 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glupwlcurve
     */
    static gluPwlCurve(nobj, count, array, stride, type) {
        arrayMarshal := array is VarRef ? "float*" : "ptr"

        DllCall("GLU32.dll\gluPwlCurve", "ptr", nobj, "int", count, arrayMarshal, array, "int", stride, "uint", type)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @param {Integer} nknots 
     * @param {Pointer<Float>} knot 
     * @param {Integer} stride 
     * @param {Pointer<Float>} ctlarray 
     * @param {Integer} order 
     * @param {Integer} type 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glunurbscurve
     */
    static gluNurbsCurve(nobj, nknots, knot, stride, ctlarray, order, type) {
        knotMarshal := knot is VarRef ? "float*" : "ptr"
        ctlarrayMarshal := ctlarray is VarRef ? "float*" : "ptr"

        DllCall("GLU32.dll\gluNurbsCurve", "ptr", nobj, "int", nknots, knotMarshal, knot, "int", stride, ctlarrayMarshal, ctlarray, "int", order, "uint", type)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @param {Integer} sknot_count 
     * @param {Pointer<Float>} sknot 
     * @param {Integer} tknot_count 
     * @param {Pointer<Float>} tknot 
     * @param {Integer} s_stride 
     * @param {Integer} t_stride 
     * @param {Pointer<Float>} ctlarray 
     * @param {Integer} sorder 
     * @param {Integer} torder 
     * @param {Integer} type 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glunurbssurface
     */
    static gluNurbsSurface(nobj, sknot_count, sknot, tknot_count, tknot, s_stride, t_stride, ctlarray, sorder, torder, type) {
        sknotMarshal := sknot is VarRef ? "float*" : "ptr"
        tknotMarshal := tknot is VarRef ? "float*" : "ptr"
        ctlarrayMarshal := ctlarray is VarRef ? "float*" : "ptr"

        DllCall("GLU32.dll\gluNurbsSurface", "ptr", nobj, "int", sknot_count, sknotMarshal, sknot, "int", tknot_count, tknotMarshal, tknot, "int", s_stride, "int", t_stride, ctlarrayMarshal, ctlarray, "int", sorder, "int", torder, "uint", type)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @param {Pointer<Float>} modelMatrix 
     * @param {Pointer<Float>} projMatrix 
     * @param {Pointer<Integer>} viewport 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluloadsamplingmatrices
     */
    static gluLoadSamplingMatrices(nobj, modelMatrix, projMatrix, viewport) {
        modelMatrixMarshal := modelMatrix is VarRef ? "float*" : "ptr"
        projMatrixMarshal := projMatrix is VarRef ? "float*" : "ptr"
        viewportMarshal := viewport is VarRef ? "int*" : "ptr"

        DllCall("GLU32.dll\gluLoadSamplingMatrices", "ptr", nobj, modelMatrixMarshal, modelMatrix, projMatrixMarshal, projMatrix, viewportMarshal, viewport)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @param {Integer} property 
     * @param {Float} value 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glunurbsproperty
     */
    static gluNurbsProperty(nobj, property, value) {
        DllCall("GLU32.dll\gluNurbsProperty", "ptr", nobj, "uint", property, "float", value)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @param {Integer} property 
     * @param {Pointer<Float>} value 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glugetnurbsproperty
     */
    static gluGetNurbsProperty(nobj, property, value) {
        valueMarshal := value is VarRef ? "float*" : "ptr"

        DllCall("GLU32.dll\gluGetNurbsProperty", "ptr", nobj, "uint", property, valueMarshal, value)
    }

    /**
     * 
     * @param {Pointer<GLUnurbs>} nobj 
     * @param {Integer} which 
     * @param {Pointer} fn 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glunurbs
     */
    static gluNurbsCallback(nobj, which, fn) {
        DllCall("GLU32.dll\gluNurbsCallback", "ptr", nobj, "uint", which, "ptr", fn)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glubeginpolygon
     */
    static gluBeginPolygon(tess) {
        DllCall("GLU32.dll\gluBeginPolygon", "ptr", tess)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @param {Integer} type 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/glunextcontour
     */
    static gluNextContour(tess, type) {
        DllCall("GLU32.dll\gluNextContour", "ptr", tess, "uint", type)
    }

    /**
     * 
     * @param {Pointer<GLUtesselator>} tess 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/OpenGL/gluendpolygon
     */
    static gluEndPolygon(tess) {
        DllCall("GLU32.dll\gluEndPolygon", "ptr", tess)
    }

;@endregion Methods
}
