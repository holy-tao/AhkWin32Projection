#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERSION_1_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_ACCUM := 256

/**
 * @type {Integer (UInt32)}
 */
export global GL_LOAD := 257

/**
 * @type {Integer (UInt32)}
 */
export global GL_RETURN := 258

/**
 * @type {Integer (UInt32)}
 */
export global GL_MULT := 259

/**
 * @type {Integer (UInt32)}
 */
export global GL_ADD := 260

/**
 * @type {Integer (UInt32)}
 */
export global GL_NEVER := 512

/**
 * @type {Integer (UInt32)}
 */
export global GL_LESS := 513

/**
 * @type {Integer (UInt32)}
 */
export global GL_EQUAL := 514

/**
 * @type {Integer (UInt32)}
 */
export global GL_LEQUAL := 515

/**
 * @type {Integer (UInt32)}
 */
export global GL_GREATER := 516

/**
 * @type {Integer (UInt32)}
 */
export global GL_NOTEQUAL := 517

/**
 * @type {Integer (UInt32)}
 */
export global GL_GEQUAL := 518

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALWAYS := 519

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_BIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_POINT_BIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_BIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_BIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_STIPPLE_BIT := 16

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MODE_BIT := 32

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHTING_BIT := 64

/**
 * @type {Integer (UInt32)}
 */
export global GL_FOG_BIT := 128

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH_BUFFER_BIT := 256

/**
 * @type {Integer (UInt32)}
 */
export global GL_ACCUM_BUFFER_BIT := 512

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_BUFFER_BIT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global GL_VIEWPORT_BIT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global GL_TRANSFORM_BIT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global GL_ENABLE_BIT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_BUFFER_BIT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global GL_HINT_BIT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global GL_EVAL_BIT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIST_BIT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_BIT := 262144

/**
 * @type {Integer (UInt32)}
 */
export global GL_SCISSOR_BIT := 524288

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALL_ATTRIB_BITS := 1048575

/**
 * @type {Integer (UInt32)}
 */
export global GL_POINTS := 0

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINES := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_LOOP := 2

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_STRIP := 3

/**
 * @type {Integer (UInt32)}
 */
export global GL_TRIANGLES := 4

/**
 * @type {Integer (UInt32)}
 */
export global GL_TRIANGLE_STRIP := 5

/**
 * @type {Integer (UInt32)}
 */
export global GL_TRIANGLE_FAN := 6

/**
 * @type {Integer (UInt32)}
 */
export global GL_QUADS := 7

/**
 * @type {Integer (UInt32)}
 */
export global GL_QUAD_STRIP := 8

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON := 9

/**
 * @type {Integer (UInt32)}
 */
export global GL_ZERO := 0

/**
 * @type {Integer (UInt32)}
 */
export global GL_ONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_SRC_COLOR := 768

/**
 * @type {Integer (UInt32)}
 */
export global GL_ONE_MINUS_SRC_COLOR := 769

/**
 * @type {Integer (UInt32)}
 */
export global GL_SRC_ALPHA := 770

/**
 * @type {Integer (UInt32)}
 */
export global GL_ONE_MINUS_SRC_ALPHA := 771

/**
 * @type {Integer (UInt32)}
 */
export global GL_DST_ALPHA := 772

/**
 * @type {Integer (UInt32)}
 */
export global GL_ONE_MINUS_DST_ALPHA := 773

/**
 * @type {Integer (UInt32)}
 */
export global GL_DST_COLOR := 774

/**
 * @type {Integer (UInt32)}
 */
export global GL_ONE_MINUS_DST_COLOR := 775

/**
 * @type {Integer (UInt32)}
 */
export global GL_SRC_ALPHA_SATURATE := 776

/**
 * @type {Integer (UInt32)}
 */
export global GL_TRUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_FALSE := 0

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLIP_PLANE0 := 12288

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLIP_PLANE1 := 12289

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLIP_PLANE2 := 12290

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLIP_PLANE3 := 12291

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLIP_PLANE4 := 12292

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLIP_PLANE5 := 12293

/**
 * @type {Integer (UInt32)}
 */
export global GL_BYTE := 5120

/**
 * @type {Integer (UInt32)}
 */
export global GL_UNSIGNED_BYTE := 5121

/**
 * @type {Integer (UInt32)}
 */
export global GL_SHORT := 5122

/**
 * @type {Integer (UInt32)}
 */
export global GL_UNSIGNED_SHORT := 5123

/**
 * @type {Integer (UInt32)}
 */
export global GL_INT := 5124

/**
 * @type {Integer (UInt32)}
 */
export global GL_UNSIGNED_INT := 5125

/**
 * @type {Integer (UInt32)}
 */
export global GL_FLOAT := 5126

/**
 * @type {Integer (UInt32)}
 */
export global GL_2_BYTES := 5127

/**
 * @type {Integer (UInt32)}
 */
export global GL_3_BYTES := 5128

/**
 * @type {Integer (UInt32)}
 */
export global GL_4_BYTES := 5129

/**
 * @type {Integer (UInt32)}
 */
export global GL_DOUBLE := 5130

/**
 * @type {Integer (UInt32)}
 */
export global GL_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global GL_FRONT_LEFT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global GL_FRONT_RIGHT := 1025

/**
 * @type {Integer (UInt32)}
 */
export global GL_BACK_LEFT := 1026

/**
 * @type {Integer (UInt32)}
 */
export global GL_BACK_RIGHT := 1027

/**
 * @type {Integer (UInt32)}
 */
export global GL_FRONT := 1028

/**
 * @type {Integer (UInt32)}
 */
export global GL_BACK := 1029

/**
 * @type {Integer (UInt32)}
 */
export global GL_LEFT := 1030

/**
 * @type {Integer (UInt32)}
 */
export global GL_RIGHT := 1031

/**
 * @type {Integer (UInt32)}
 */
export global GL_FRONT_AND_BACK := 1032

/**
 * @type {Integer (UInt32)}
 */
export global GL_AUX0 := 1033

/**
 * @type {Integer (UInt32)}
 */
export global GL_AUX1 := 1034

/**
 * @type {Integer (UInt32)}
 */
export global GL_AUX2 := 1035

/**
 * @type {Integer (UInt32)}
 */
export global GL_AUX3 := 1036

/**
 * @type {Integer (UInt32)}
 */
export global GL_NO_ERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global GL_INVALID_ENUM := 1280

/**
 * @type {Integer (UInt32)}
 */
export global GL_INVALID_VALUE := 1281

/**
 * @type {Integer (UInt32)}
 */
export global GL_INVALID_OPERATION := 1282

/**
 * @type {Integer (UInt32)}
 */
export global GL_STACK_OVERFLOW := 1283

/**
 * @type {Integer (UInt32)}
 */
export global GL_STACK_UNDERFLOW := 1284

/**
 * @type {Integer (UInt32)}
 */
export global GL_OUT_OF_MEMORY := 1285

/**
 * @type {Integer (UInt32)}
 */
export global GL_2D := 1536

/**
 * @type {Integer (UInt32)}
 */
export global GL_3D := 1537

/**
 * @type {Integer (UInt32)}
 */
export global GL_3D_COLOR := 1538

/**
 * @type {Integer (UInt32)}
 */
export global GL_3D_COLOR_TEXTURE := 1539

/**
 * @type {Integer (UInt32)}
 */
export global GL_4D_COLOR_TEXTURE := 1540

/**
 * @type {Integer (UInt32)}
 */
export global GL_PASS_THROUGH_TOKEN := 1792

/**
 * @type {Integer (UInt32)}
 */
export global GL_POINT_TOKEN := 1793

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_TOKEN := 1794

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_TOKEN := 1795

/**
 * @type {Integer (UInt32)}
 */
export global GL_BITMAP_TOKEN := 1796

/**
 * @type {Integer (UInt32)}
 */
export global GL_DRAW_PIXEL_TOKEN := 1797

/**
 * @type {Integer (UInt32)}
 */
export global GL_COPY_PIXEL_TOKEN := 1798

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_RESET_TOKEN := 1799

/**
 * @type {Integer (UInt32)}
 */
export global GL_EXP := 2048

/**
 * @type {Integer (UInt32)}
 */
export global GL_EXP2 := 2049

/**
 * @type {Integer (UInt32)}
 */
export global GL_CW := 2304

/**
 * @type {Integer (UInt32)}
 */
export global GL_CCW := 2305

/**
 * @type {Integer (UInt32)}
 */
export global GL_COEFF := 2560

/**
 * @type {Integer (UInt32)}
 */
export global GL_ORDER := 2561

/**
 * @type {Integer (UInt32)}
 */
export global GL_DOMAIN := 2562

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_COLOR := 2816

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_INDEX := 2817

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_NORMAL := 2818

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_TEXTURE_COORDS := 2819

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_RASTER_COLOR := 2820

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_RASTER_INDEX := 2821

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_RASTER_TEXTURE_COORDS := 2822

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_RASTER_POSITION := 2823

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_RASTER_POSITION_VALID := 2824

/**
 * @type {Integer (UInt32)}
 */
export global GL_CURRENT_RASTER_DISTANCE := 2825

/**
 * @type {Integer (UInt32)}
 */
export global GL_POINT_SMOOTH := 2832

/**
 * @type {Integer (UInt32)}
 */
export global GL_POINT_SIZE := 2833

/**
 * @type {Integer (UInt32)}
 */
export global GL_POINT_SIZE_RANGE := 2834

/**
 * @type {Integer (UInt32)}
 */
export global GL_POINT_SIZE_GRANULARITY := 2835

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_SMOOTH := 2848

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_WIDTH := 2849

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_WIDTH_RANGE := 2850

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_WIDTH_GRANULARITY := 2851

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_STIPPLE := 2852

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_STIPPLE_PATTERN := 2853

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_STIPPLE_REPEAT := 2854

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIST_MODE := 2864

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_LIST_NESTING := 2865

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIST_BASE := 2866

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIST_INDEX := 2867

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_MODE := 2880

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_SMOOTH := 2881

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_STIPPLE := 2882

/**
 * @type {Integer (UInt32)}
 */
export global GL_EDGE_FLAG := 2883

/**
 * @type {Integer (UInt32)}
 */
export global GL_CULL_FACE := 2884

/**
 * @type {Integer (UInt32)}
 */
export global GL_CULL_FACE_MODE := 2885

/**
 * @type {Integer (UInt32)}
 */
export global GL_FRONT_FACE := 2886

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHTING := 2896

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT_MODEL_LOCAL_VIEWER := 2897

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT_MODEL_TWO_SIDE := 2898

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT_MODEL_AMBIENT := 2899

/**
 * @type {Integer (UInt32)}
 */
export global GL_SHADE_MODEL := 2900

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_MATERIAL_FACE := 2901

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_MATERIAL_PARAMETER := 2902

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_MATERIAL := 2903

/**
 * @type {Integer (UInt32)}
 */
export global GL_FOG := 2912

/**
 * @type {Integer (UInt32)}
 */
export global GL_FOG_INDEX := 2913

/**
 * @type {Integer (UInt32)}
 */
export global GL_FOG_DENSITY := 2914

/**
 * @type {Integer (UInt32)}
 */
export global GL_FOG_START := 2915

/**
 * @type {Integer (UInt32)}
 */
export global GL_FOG_END := 2916

/**
 * @type {Integer (UInt32)}
 */
export global GL_FOG_MODE := 2917

/**
 * @type {Integer (UInt32)}
 */
export global GL_FOG_COLOR := 2918

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH_RANGE := 2928

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH_TEST := 2929

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH_WRITEMASK := 2930

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH_CLEAR_VALUE := 2931

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH_FUNC := 2932

/**
 * @type {Integer (UInt32)}
 */
export global GL_ACCUM_CLEAR_VALUE := 2944

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_TEST := 2960

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_CLEAR_VALUE := 2961

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_FUNC := 2962

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_VALUE_MASK := 2963

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_FAIL := 2964

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_PASS_DEPTH_FAIL := 2965

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_PASS_DEPTH_PASS := 2966

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_REF := 2967

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_WRITEMASK := 2968

/**
 * @type {Integer (UInt32)}
 */
export global GL_MATRIX_MODE := 2976

/**
 * @type {Integer (UInt32)}
 */
export global GL_NORMALIZE := 2977

/**
 * @type {Integer (UInt32)}
 */
export global GL_VIEWPORT := 2978

/**
 * @type {Integer (UInt32)}
 */
export global GL_MODELVIEW_STACK_DEPTH := 2979

/**
 * @type {Integer (UInt32)}
 */
export global GL_PROJECTION_STACK_DEPTH := 2980

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_STACK_DEPTH := 2981

/**
 * @type {Integer (UInt32)}
 */
export global GL_MODELVIEW_MATRIX := 2982

/**
 * @type {Integer (UInt32)}
 */
export global GL_PROJECTION_MATRIX := 2983

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_MATRIX := 2984

/**
 * @type {Integer (UInt32)}
 */
export global GL_ATTRIB_STACK_DEPTH := 2992

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLIENT_ATTRIB_STACK_DEPTH := 2993

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA_TEST := 3008

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA_TEST_FUNC := 3009

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA_TEST_REF := 3010

/**
 * @type {Integer (UInt32)}
 */
export global GL_DITHER := 3024

/**
 * @type {Integer (UInt32)}
 */
export global GL_BLEND_DST := 3040

/**
 * @type {Integer (UInt32)}
 */
export global GL_BLEND_SRC := 3041

/**
 * @type {Integer (UInt32)}
 */
export global GL_BLEND := 3042

/**
 * @type {Integer (UInt32)}
 */
export global GL_LOGIC_OP_MODE := 3056

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_LOGIC_OP := 3057

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_LOGIC_OP := 3058

/**
 * @type {Integer (UInt32)}
 */
export global GL_AUX_BUFFERS := 3072

/**
 * @type {Integer (UInt32)}
 */
export global GL_DRAW_BUFFER := 3073

/**
 * @type {Integer (UInt32)}
 */
export global GL_READ_BUFFER := 3074

/**
 * @type {Integer (UInt32)}
 */
export global GL_SCISSOR_BOX := 3088

/**
 * @type {Integer (UInt32)}
 */
export global GL_SCISSOR_TEST := 3089

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_CLEAR_VALUE := 3104

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_WRITEMASK := 3105

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_CLEAR_VALUE := 3106

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_WRITEMASK := 3107

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_MODE := 3120

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGBA_MODE := 3121

/**
 * @type {Integer (UInt32)}
 */
export global GL_DOUBLEBUFFER := 3122

/**
 * @type {Integer (UInt32)}
 */
export global GL_STEREO := 3123

/**
 * @type {Integer (UInt32)}
 */
export global GL_RENDER_MODE := 3136

/**
 * @type {Integer (UInt32)}
 */
export global GL_PERSPECTIVE_CORRECTION_HINT := 3152

/**
 * @type {Integer (UInt32)}
 */
export global GL_POINT_SMOOTH_HINT := 3153

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE_SMOOTH_HINT := 3154

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_SMOOTH_HINT := 3155

/**
 * @type {Integer (UInt32)}
 */
export global GL_FOG_HINT := 3156

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_GEN_S := 3168

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_GEN_T := 3169

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_GEN_R := 3170

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_GEN_Q := 3171

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_I_TO_I := 3184

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_S_TO_S := 3185

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_I_TO_R := 3186

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_I_TO_G := 3187

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_I_TO_B := 3188

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_I_TO_A := 3189

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_R_TO_R := 3190

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_G_TO_G := 3191

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_B_TO_B := 3192

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_A_TO_A := 3193

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_I_TO_I_SIZE := 3248

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_S_TO_S_SIZE := 3249

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_I_TO_R_SIZE := 3250

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_I_TO_G_SIZE := 3251

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_I_TO_B_SIZE := 3252

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_I_TO_A_SIZE := 3253

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_R_TO_R_SIZE := 3254

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_G_TO_G_SIZE := 3255

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_B_TO_B_SIZE := 3256

/**
 * @type {Integer (UInt32)}
 */
export global GL_PIXEL_MAP_A_TO_A_SIZE := 3257

/**
 * @type {Integer (UInt32)}
 */
export global GL_UNPACK_SWAP_BYTES := 3312

/**
 * @type {Integer (UInt32)}
 */
export global GL_UNPACK_LSB_FIRST := 3313

/**
 * @type {Integer (UInt32)}
 */
export global GL_UNPACK_ROW_LENGTH := 3314

/**
 * @type {Integer (UInt32)}
 */
export global GL_UNPACK_SKIP_ROWS := 3315

/**
 * @type {Integer (UInt32)}
 */
export global GL_UNPACK_SKIP_PIXELS := 3316

/**
 * @type {Integer (UInt32)}
 */
export global GL_UNPACK_ALIGNMENT := 3317

/**
 * @type {Integer (UInt32)}
 */
export global GL_PACK_SWAP_BYTES := 3328

/**
 * @type {Integer (UInt32)}
 */
export global GL_PACK_LSB_FIRST := 3329

/**
 * @type {Integer (UInt32)}
 */
export global GL_PACK_ROW_LENGTH := 3330

/**
 * @type {Integer (UInt32)}
 */
export global GL_PACK_SKIP_ROWS := 3331

/**
 * @type {Integer (UInt32)}
 */
export global GL_PACK_SKIP_PIXELS := 3332

/**
 * @type {Integer (UInt32)}
 */
export global GL_PACK_ALIGNMENT := 3333

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP_COLOR := 3344

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP_STENCIL := 3345

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_SHIFT := 3346

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_OFFSET := 3347

/**
 * @type {Integer (UInt32)}
 */
export global GL_RED_SCALE := 3348

/**
 * @type {Integer (UInt32)}
 */
export global GL_RED_BIAS := 3349

/**
 * @type {Integer (UInt32)}
 */
export global GL_ZOOM_X := 3350

/**
 * @type {Integer (UInt32)}
 */
export global GL_ZOOM_Y := 3351

/**
 * @type {Integer (UInt32)}
 */
export global GL_GREEN_SCALE := 3352

/**
 * @type {Integer (UInt32)}
 */
export global GL_GREEN_BIAS := 3353

/**
 * @type {Integer (UInt32)}
 */
export global GL_BLUE_SCALE := 3354

/**
 * @type {Integer (UInt32)}
 */
export global GL_BLUE_BIAS := 3355

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA_SCALE := 3356

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA_BIAS := 3357

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH_SCALE := 3358

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH_BIAS := 3359

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_EVAL_ORDER := 3376

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_LIGHTS := 3377

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_CLIP_PLANES := 3378

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_TEXTURE_SIZE := 3379

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_PIXEL_MAP_TABLE := 3380

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_ATTRIB_STACK_DEPTH := 3381

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_MODELVIEW_STACK_DEPTH := 3382

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_NAME_STACK_DEPTH := 3383

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_PROJECTION_STACK_DEPTH := 3384

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_TEXTURE_STACK_DEPTH := 3385

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_VIEWPORT_DIMS := 3386

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_CLIENT_ATTRIB_STACK_DEPTH := 3387

/**
 * @type {Integer (UInt32)}
 */
export global GL_SUBPIXEL_BITS := 3408

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_BITS := 3409

/**
 * @type {Integer (UInt32)}
 */
export global GL_RED_BITS := 3410

/**
 * @type {Integer (UInt32)}
 */
export global GL_GREEN_BITS := 3411

/**
 * @type {Integer (UInt32)}
 */
export global GL_BLUE_BITS := 3412

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA_BITS := 3413

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH_BITS := 3414

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_BITS := 3415

/**
 * @type {Integer (UInt32)}
 */
export global GL_ACCUM_RED_BITS := 3416

/**
 * @type {Integer (UInt32)}
 */
export global GL_ACCUM_GREEN_BITS := 3417

/**
 * @type {Integer (UInt32)}
 */
export global GL_ACCUM_BLUE_BITS := 3418

/**
 * @type {Integer (UInt32)}
 */
export global GL_ACCUM_ALPHA_BITS := 3419

/**
 * @type {Integer (UInt32)}
 */
export global GL_NAME_STACK_DEPTH := 3440

/**
 * @type {Integer (UInt32)}
 */
export global GL_AUTO_NORMAL := 3456

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_COLOR_4 := 3472

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_INDEX := 3473

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_NORMAL := 3474

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_TEXTURE_COORD_1 := 3475

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_TEXTURE_COORD_2 := 3476

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_TEXTURE_COORD_3 := 3477

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_TEXTURE_COORD_4 := 3478

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_VERTEX_3 := 3479

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_VERTEX_4 := 3480

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_COLOR_4 := 3504

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_INDEX := 3505

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_NORMAL := 3506

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_TEXTURE_COORD_1 := 3507

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_TEXTURE_COORD_2 := 3508

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_TEXTURE_COORD_3 := 3509

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_TEXTURE_COORD_4 := 3510

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_VERTEX_3 := 3511

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_VERTEX_4 := 3512

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_GRID_DOMAIN := 3536

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP1_GRID_SEGMENTS := 3537

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_GRID_DOMAIN := 3538

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAP2_GRID_SEGMENTS := 3539

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_1D := 3552

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_2D := 3553

/**
 * @type {Integer (UInt32)}
 */
export global GL_FEEDBACK_BUFFER_POINTER := 3568

/**
 * @type {Integer (UInt32)}
 */
export global GL_FEEDBACK_BUFFER_SIZE := 3569

/**
 * @type {Integer (UInt32)}
 */
export global GL_FEEDBACK_BUFFER_TYPE := 3570

/**
 * @type {Integer (UInt32)}
 */
export global GL_SELECTION_BUFFER_POINTER := 3571

/**
 * @type {Integer (UInt32)}
 */
export global GL_SELECTION_BUFFER_SIZE := 3572

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_WIDTH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_HEIGHT := 4097

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_INTERNAL_FORMAT := 4099

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_BORDER_COLOR := 4100

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_BORDER := 4101

/**
 * @type {Integer (UInt32)}
 */
export global GL_DONT_CARE := 4352

/**
 * @type {Integer (UInt32)}
 */
export global GL_FASTEST := 4353

/**
 * @type {Integer (UInt32)}
 */
export global GL_NICEST := 4354

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT0 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT1 := 16385

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT2 := 16386

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT3 := 16387

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT4 := 16388

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT5 := 16389

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT6 := 16390

/**
 * @type {Integer (UInt32)}
 */
export global GL_LIGHT7 := 16391

/**
 * @type {Integer (UInt32)}
 */
export global GL_AMBIENT := 4608

/**
 * @type {Integer (UInt32)}
 */
export global GL_DIFFUSE := 4609

/**
 * @type {Integer (UInt32)}
 */
export global GL_SPECULAR := 4610

/**
 * @type {Integer (UInt32)}
 */
export global GL_POSITION := 4611

/**
 * @type {Integer (UInt32)}
 */
export global GL_SPOT_DIRECTION := 4612

/**
 * @type {Integer (UInt32)}
 */
export global GL_SPOT_EXPONENT := 4613

/**
 * @type {Integer (UInt32)}
 */
export global GL_SPOT_CUTOFF := 4614

/**
 * @type {Integer (UInt32)}
 */
export global GL_CONSTANT_ATTENUATION := 4615

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINEAR_ATTENUATION := 4616

/**
 * @type {Integer (UInt32)}
 */
export global GL_QUADRATIC_ATTENUATION := 4617

/**
 * @type {Integer (UInt32)}
 */
export global GL_COMPILE := 4864

/**
 * @type {Integer (UInt32)}
 */
export global GL_COMPILE_AND_EXECUTE := 4865

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLEAR := 5376

/**
 * @type {Integer (UInt32)}
 */
export global GL_AND := 5377

/**
 * @type {Integer (UInt32)}
 */
export global GL_AND_REVERSE := 5378

/**
 * @type {Integer (UInt32)}
 */
export global GL_COPY := 5379

/**
 * @type {Integer (UInt32)}
 */
export global GL_AND_INVERTED := 5380

/**
 * @type {Integer (UInt32)}
 */
export global GL_NOOP := 5381

/**
 * @type {Integer (UInt32)}
 */
export global GL_XOR := 5382

/**
 * @type {Integer (UInt32)}
 */
export global GL_OR := 5383

/**
 * @type {Integer (UInt32)}
 */
export global GL_NOR := 5384

/**
 * @type {Integer (UInt32)}
 */
export global GL_EQUIV := 5385

/**
 * @type {Integer (UInt32)}
 */
export global GL_INVERT := 5386

/**
 * @type {Integer (UInt32)}
 */
export global GL_OR_REVERSE := 5387

/**
 * @type {Integer (UInt32)}
 */
export global GL_COPY_INVERTED := 5388

/**
 * @type {Integer (UInt32)}
 */
export global GL_OR_INVERTED := 5389

/**
 * @type {Integer (UInt32)}
 */
export global GL_NAND := 5390

/**
 * @type {Integer (UInt32)}
 */
export global GL_SET := 5391

/**
 * @type {Integer (UInt32)}
 */
export global GL_EMISSION := 5632

/**
 * @type {Integer (UInt32)}
 */
export global GL_SHININESS := 5633

/**
 * @type {Integer (UInt32)}
 */
export global GL_AMBIENT_AND_DIFFUSE := 5634

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_INDEXES := 5635

/**
 * @type {Integer (UInt32)}
 */
export global GL_MODELVIEW := 5888

/**
 * @type {Integer (UInt32)}
 */
export global GL_PROJECTION := 5889

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE := 5890

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR := 6144

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH := 6145

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL := 6146

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_INDEX := 6400

/**
 * @type {Integer (UInt32)}
 */
export global GL_STENCIL_INDEX := 6401

/**
 * @type {Integer (UInt32)}
 */
export global GL_DEPTH_COMPONENT := 6402

/**
 * @type {Integer (UInt32)}
 */
export global GL_RED := 6403

/**
 * @type {Integer (UInt32)}
 */
export global GL_GREEN := 6404

/**
 * @type {Integer (UInt32)}
 */
export global GL_BLUE := 6405

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA := 6406

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGB := 6407

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGBA := 6408

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE := 6409

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE_ALPHA := 6410

/**
 * @type {Integer (UInt32)}
 */
export global GL_BITMAP := 6656

/**
 * @type {Integer (UInt32)}
 */
export global GL_POINT := 6912

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINE := 6913

/**
 * @type {Integer (UInt32)}
 */
export global GL_FILL := 6914

/**
 * @type {Integer (UInt32)}
 */
export global GL_RENDER := 7168

/**
 * @type {Integer (UInt32)}
 */
export global GL_FEEDBACK := 7169

/**
 * @type {Integer (UInt32)}
 */
export global GL_SELECT := 7170

/**
 * @type {Integer (UInt32)}
 */
export global GL_FLAT := 7424

/**
 * @type {Integer (UInt32)}
 */
export global GL_SMOOTH := 7425

/**
 * @type {Integer (UInt32)}
 */
export global GL_KEEP := 7680

/**
 * @type {Integer (UInt32)}
 */
export global GL_REPLACE := 7681

/**
 * @type {Integer (UInt32)}
 */
export global GL_INCR := 7682

/**
 * @type {Integer (UInt32)}
 */
export global GL_DECR := 7683

/**
 * @type {Integer (UInt32)}
 */
export global GL_VENDOR := 7936

/**
 * @type {Integer (UInt32)}
 */
export global GL_RENDERER := 7937

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERSION := 7938

/**
 * @type {Integer (UInt32)}
 */
export global GL_EXTENSIONS := 7939

/**
 * @type {Integer (UInt32)}
 */
export global GL_S := 8192

/**
 * @type {Integer (UInt32)}
 */
export global GL_T := 8193

/**
 * @type {Integer (UInt32)}
 */
export global GL_R := 8194

/**
 * @type {Integer (UInt32)}
 */
export global GL_Q := 8195

/**
 * @type {Integer (UInt32)}
 */
export global GL_MODULATE := 8448

/**
 * @type {Integer (UInt32)}
 */
export global GL_DECAL := 8449

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_ENV_MODE := 8704

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_ENV_COLOR := 8705

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_ENV := 8960

/**
 * @type {Integer (UInt32)}
 */
export global GL_EYE_LINEAR := 9216

/**
 * @type {Integer (UInt32)}
 */
export global GL_OBJECT_LINEAR := 9217

/**
 * @type {Integer (UInt32)}
 */
export global GL_SPHERE_MAP := 9218

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_GEN_MODE := 9472

/**
 * @type {Integer (UInt32)}
 */
export global GL_OBJECT_PLANE := 9473

/**
 * @type {Integer (UInt32)}
 */
export global GL_EYE_PLANE := 9474

/**
 * @type {Integer (UInt32)}
 */
export global GL_NEAREST := 9728

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINEAR := 9729

/**
 * @type {Integer (UInt32)}
 */
export global GL_NEAREST_MIPMAP_NEAREST := 9984

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINEAR_MIPMAP_NEAREST := 9985

/**
 * @type {Integer (UInt32)}
 */
export global GL_NEAREST_MIPMAP_LINEAR := 9986

/**
 * @type {Integer (UInt32)}
 */
export global GL_LINEAR_MIPMAP_LINEAR := 9987

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_MAG_FILTER := 10240

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_MIN_FILTER := 10241

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_WRAP_S := 10242

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_WRAP_T := 10243

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLAMP := 10496

/**
 * @type {Integer (UInt32)}
 */
export global GL_REPEAT := 10497

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLIENT_PIXEL_STORE_BIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLIENT_VERTEX_ARRAY_BIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global GL_CLIENT_ALL_ATTRIB_BITS := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_OFFSET_FACTOR := 32824

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_OFFSET_UNITS := 10752

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_OFFSET_POINT := 10753

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_OFFSET_LINE := 10754

/**
 * @type {Integer (UInt32)}
 */
export global GL_POLYGON_OFFSET_FILL := 32823

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA4 := 32827

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA8 := 32828

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA12 := 32829

/**
 * @type {Integer (UInt32)}
 */
export global GL_ALPHA16 := 32830

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE4 := 32831

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE8 := 32832

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE12 := 32833

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE16 := 32834

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE4_ALPHA4 := 32835

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE6_ALPHA2 := 32836

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE8_ALPHA8 := 32837

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE12_ALPHA4 := 32838

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE12_ALPHA12 := 32839

/**
 * @type {Integer (UInt32)}
 */
export global GL_LUMINANCE16_ALPHA16 := 32840

/**
 * @type {Integer (UInt32)}
 */
export global GL_INTENSITY := 32841

/**
 * @type {Integer (UInt32)}
 */
export global GL_INTENSITY4 := 32842

/**
 * @type {Integer (UInt32)}
 */
export global GL_INTENSITY8 := 32843

/**
 * @type {Integer (UInt32)}
 */
export global GL_INTENSITY12 := 32844

/**
 * @type {Integer (UInt32)}
 */
export global GL_INTENSITY16 := 32845

/**
 * @type {Integer (UInt32)}
 */
export global GL_R3_G3_B2 := 10768

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGB4 := 32847

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGB5 := 32848

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGB8 := 32849

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGB10 := 32850

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGB12 := 32851

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGB16 := 32852

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGBA2 := 32853

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGBA4 := 32854

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGB5_A1 := 32855

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGBA8 := 32856

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGB10_A2 := 32857

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGBA12 := 32858

/**
 * @type {Integer (UInt32)}
 */
export global GL_RGBA16 := 32859

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_RED_SIZE := 32860

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_GREEN_SIZE := 32861

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_BLUE_SIZE := 32862

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_ALPHA_SIZE := 32863

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_LUMINANCE_SIZE := 32864

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_INTENSITY_SIZE := 32865

/**
 * @type {Integer (UInt32)}
 */
export global GL_PROXY_TEXTURE_1D := 32867

/**
 * @type {Integer (UInt32)}
 */
export global GL_PROXY_TEXTURE_2D := 32868

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_PRIORITY := 32870

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_RESIDENT := 32871

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_BINDING_1D := 32872

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_BINDING_2D := 32873

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY := 32884

/**
 * @type {Integer (UInt32)}
 */
export global GL_NORMAL_ARRAY := 32885

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY := 32886

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_ARRAY := 32887

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY := 32888

/**
 * @type {Integer (UInt32)}
 */
export global GL_EDGE_FLAG_ARRAY := 32889

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY_SIZE := 32890

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY_TYPE := 32891

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY_STRIDE := 32892

/**
 * @type {Integer (UInt32)}
 */
export global GL_NORMAL_ARRAY_TYPE := 32894

/**
 * @type {Integer (UInt32)}
 */
export global GL_NORMAL_ARRAY_STRIDE := 32895

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY_SIZE := 32897

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY_TYPE := 32898

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY_STRIDE := 32899

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_ARRAY_TYPE := 32901

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_ARRAY_STRIDE := 32902

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY_SIZE := 32904

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY_TYPE := 32905

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY_STRIDE := 32906

/**
 * @type {Integer (UInt32)}
 */
export global GL_EDGE_FLAG_ARRAY_STRIDE := 32908

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY_POINTER := 32910

/**
 * @type {Integer (UInt32)}
 */
export global GL_NORMAL_ARRAY_POINTER := 32911

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY_POINTER := 32912

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_ARRAY_POINTER := 32913

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY_POINTER := 32914

/**
 * @type {Integer (UInt32)}
 */
export global GL_EDGE_FLAG_ARRAY_POINTER := 32915

/**
 * @type {Integer (UInt32)}
 */
export global GL_V2F := 10784

/**
 * @type {Integer (UInt32)}
 */
export global GL_V3F := 10785

/**
 * @type {Integer (UInt32)}
 */
export global GL_C4UB_V2F := 10786

/**
 * @type {Integer (UInt32)}
 */
export global GL_C4UB_V3F := 10787

/**
 * @type {Integer (UInt32)}
 */
export global GL_C3F_V3F := 10788

/**
 * @type {Integer (UInt32)}
 */
export global GL_N3F_V3F := 10789

/**
 * @type {Integer (UInt32)}
 */
export global GL_C4F_N3F_V3F := 10790

/**
 * @type {Integer (UInt32)}
 */
export global GL_T2F_V3F := 10791

/**
 * @type {Integer (UInt32)}
 */
export global GL_T4F_V4F := 10792

/**
 * @type {Integer (UInt32)}
 */
export global GL_T2F_C4UB_V3F := 10793

/**
 * @type {Integer (UInt32)}
 */
export global GL_T2F_C3F_V3F := 10794

/**
 * @type {Integer (UInt32)}
 */
export global GL_T2F_N3F_V3F := 10795

/**
 * @type {Integer (UInt32)}
 */
export global GL_T2F_C4F_N3F_V3F := 10796

/**
 * @type {Integer (UInt32)}
 */
export global GL_T4F_C4F_N3F_V4F := 10797

/**
 * @type {Integer (UInt32)}
 */
export global GL_EXT_vertex_array := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_EXT_bgra := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_EXT_paletted_texture := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_WIN_swap_hint := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_WIN_draw_range_elements := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY_EXT := 32884

/**
 * @type {Integer (UInt32)}
 */
export global GL_NORMAL_ARRAY_EXT := 32885

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY_EXT := 32886

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_ARRAY_EXT := 32887

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY_EXT := 32888

/**
 * @type {Integer (UInt32)}
 */
export global GL_EDGE_FLAG_ARRAY_EXT := 32889

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY_SIZE_EXT := 32890

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY_TYPE_EXT := 32891

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY_STRIDE_EXT := 32892

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY_COUNT_EXT := 32893

/**
 * @type {Integer (UInt32)}
 */
export global GL_NORMAL_ARRAY_TYPE_EXT := 32894

/**
 * @type {Integer (UInt32)}
 */
export global GL_NORMAL_ARRAY_STRIDE_EXT := 32895

/**
 * @type {Integer (UInt32)}
 */
export global GL_NORMAL_ARRAY_COUNT_EXT := 32896

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY_SIZE_EXT := 32897

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY_TYPE_EXT := 32898

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY_STRIDE_EXT := 32899

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY_COUNT_EXT := 32900

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_ARRAY_TYPE_EXT := 32901

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_ARRAY_STRIDE_EXT := 32902

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_ARRAY_COUNT_EXT := 32903

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY_SIZE_EXT := 32904

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY_TYPE_EXT := 32905

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY_STRIDE_EXT := 32906

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY_COUNT_EXT := 32907

/**
 * @type {Integer (UInt32)}
 */
export global GL_EDGE_FLAG_ARRAY_STRIDE_EXT := 32908

/**
 * @type {Integer (UInt32)}
 */
export global GL_EDGE_FLAG_ARRAY_COUNT_EXT := 32909

/**
 * @type {Integer (UInt32)}
 */
export global GL_VERTEX_ARRAY_POINTER_EXT := 32910

/**
 * @type {Integer (UInt32)}
 */
export global GL_NORMAL_ARRAY_POINTER_EXT := 32911

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_ARRAY_POINTER_EXT := 32912

/**
 * @type {Integer (UInt32)}
 */
export global GL_INDEX_ARRAY_POINTER_EXT := 32913

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COORD_ARRAY_POINTER_EXT := 32914

/**
 * @type {Integer (UInt32)}
 */
export global GL_EDGE_FLAG_ARRAY_POINTER_EXT := 32915

/**
 * @type {Integer (UInt32)}
 */
export global GL_DOUBLE_EXT := 5130

/**
 * @type {Integer (UInt32)}
 */
export global GL_BGR_EXT := 32992

/**
 * @type {Integer (UInt32)}
 */
export global GL_BGRA_EXT := 32993

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_TABLE_FORMAT_EXT := 32984

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_TABLE_WIDTH_EXT := 32985

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_TABLE_RED_SIZE_EXT := 32986

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_TABLE_GREEN_SIZE_EXT := 32987

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_TABLE_BLUE_SIZE_EXT := 32988

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_TABLE_ALPHA_SIZE_EXT := 32989

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_TABLE_LUMINANCE_SIZE_EXT := 32990

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_TABLE_INTENSITY_SIZE_EXT := 32991

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_INDEX1_EXT := 32994

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_INDEX2_EXT := 32995

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_INDEX4_EXT := 32996

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_INDEX8_EXT := 32997

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_INDEX12_EXT := 32998

/**
 * @type {Integer (UInt32)}
 */
export global GL_COLOR_INDEX16_EXT := 32999

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_ELEMENTS_VERTICES_WIN := 33000

/**
 * @type {Integer (UInt32)}
 */
export global GL_MAX_ELEMENTS_INDICES_WIN := 33001

/**
 * @type {Integer (UInt32)}
 */
export global GL_PHONG_WIN := 33002

/**
 * @type {Integer (UInt32)}
 */
export global GL_PHONG_HINT_WIN := 33003

/**
 * @type {Integer (UInt32)}
 */
export global GL_FOG_SPECULAR_TEXTURE_WIN := 33004

/**
 * @type {Integer (UInt32)}
 */
export global GL_LOGIC_OP := 3057

/**
 * @type {Integer (UInt32)}
 */
export global GL_TEXTURE_COMPONENTS := 4099

/**
 * @type {Integer (UInt32)}
 */
export global GLU_VERSION_1_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global GLU_VERSION_1_2 := 1

/**
 * @type {Integer (UInt32)}
 */
export global GLU_INVALID_ENUM := 100900

/**
 * @type {Integer (UInt32)}
 */
export global GLU_INVALID_VALUE := 100901

/**
 * @type {Integer (UInt32)}
 */
export global GLU_OUT_OF_MEMORY := 100902

/**
 * @type {Integer (UInt32)}
 */
export global GLU_INCOMPATIBLE_GL_VERSION := 100903

/**
 * @type {Integer (UInt32)}
 */
export global GLU_VERSION := 100800

/**
 * @type {Integer (UInt32)}
 */
export global GLU_EXTENSIONS := 100801

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TRUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global GLU_FALSE := 0

/**
 * @type {Integer (UInt32)}
 */
export global GLU_SMOOTH := 100000

/**
 * @type {Integer (UInt32)}
 */
export global GLU_FLAT := 100001

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NONE := 100002

/**
 * @type {Integer (UInt32)}
 */
export global GLU_POINT := 100010

/**
 * @type {Integer (UInt32)}
 */
export global GLU_LINE := 100011

/**
 * @type {Integer (UInt32)}
 */
export global GLU_FILL := 100012

/**
 * @type {Integer (UInt32)}
 */
export global GLU_SILHOUETTE := 100013

/**
 * @type {Integer (UInt32)}
 */
export global GLU_OUTSIDE := 100020

/**
 * @type {Integer (UInt32)}
 */
export global GLU_INSIDE := 100021

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_WINDING_RULE := 100140

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_BOUNDARY_ONLY := 100141

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_TOLERANCE := 100142

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_WINDING_ODD := 100130

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_WINDING_NONZERO := 100131

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_WINDING_POSITIVE := 100132

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_WINDING_NEGATIVE := 100133

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_WINDING_ABS_GEQ_TWO := 100134

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_BEGIN := 100100

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_VERTEX := 100101

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_END := 100102

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_ERROR := 100103

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_EDGE_FLAG := 100104

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_COMBINE := 100105

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_BEGIN_DATA := 100106

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_VERTEX_DATA := 100107

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_END_DATA := 100108

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_ERROR_DATA := 100109

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_EDGE_FLAG_DATA := 100110

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_COMBINE_DATA := 100111

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_ERROR1 := 100151

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_ERROR2 := 100152

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_ERROR3 := 100153

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_ERROR4 := 100154

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_ERROR5 := 100155

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_ERROR6 := 100156

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_ERROR7 := 100157

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_ERROR8 := 100158

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_MISSING_BEGIN_POLYGON := 100151

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_MISSING_BEGIN_CONTOUR := 100152

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_MISSING_END_POLYGON := 100153

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_MISSING_END_CONTOUR := 100154

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_COORD_TOO_LARGE := 100155

/**
 * @type {Integer (UInt32)}
 */
export global GLU_TESS_NEED_COMBINE_CALLBACK := 100156

/**
 * @type {Integer (UInt32)}
 */
export global GLU_AUTO_LOAD_MATRIX := 100200

/**
 * @type {Integer (UInt32)}
 */
export global GLU_CULLING := 100201

/**
 * @type {Integer (UInt32)}
 */
export global GLU_SAMPLING_TOLERANCE := 100203

/**
 * @type {Integer (UInt32)}
 */
export global GLU_DISPLAY_MODE := 100204

/**
 * @type {Integer (UInt32)}
 */
export global GLU_PARAMETRIC_TOLERANCE := 100202

/**
 * @type {Integer (UInt32)}
 */
export global GLU_SAMPLING_METHOD := 100205

/**
 * @type {Integer (UInt32)}
 */
export global GLU_U_STEP := 100206

/**
 * @type {Integer (UInt32)}
 */
export global GLU_V_STEP := 100207

/**
 * @type {Integer (UInt32)}
 */
export global GLU_PATH_LENGTH := 100215

/**
 * @type {Integer (UInt32)}
 */
export global GLU_PARAMETRIC_ERROR := 100216

/**
 * @type {Integer (UInt32)}
 */
export global GLU_DOMAIN_DISTANCE := 100217

/**
 * @type {Integer (UInt32)}
 */
export global GLU_MAP1_TRIM_2 := 100210

/**
 * @type {Integer (UInt32)}
 */
export global GLU_MAP1_TRIM_3 := 100211

/**
 * @type {Integer (UInt32)}
 */
export global GLU_OUTLINE_POLYGON := 100240

/**
 * @type {Integer (UInt32)}
 */
export global GLU_OUTLINE_PATCH := 100241

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR1 := 100251

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR2 := 100252

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR3 := 100253

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR4 := 100254

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR5 := 100255

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR6 := 100256

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR7 := 100257

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR8 := 100258

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR9 := 100259

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR10 := 100260

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR11 := 100261

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR12 := 100262

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR13 := 100263

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR14 := 100264

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR15 := 100265

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR16 := 100266

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR17 := 100267

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR18 := 100268

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR19 := 100269

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR20 := 100270

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR21 := 100271

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR22 := 100272

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR23 := 100273

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR24 := 100274

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR25 := 100275

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR26 := 100276

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR27 := 100277

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR28 := 100278

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR29 := 100279

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR30 := 100280

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR31 := 100281

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR32 := 100282

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR33 := 100283

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR34 := 100284

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR35 := 100285

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR36 := 100286

/**
 * @type {Integer (UInt32)}
 */
export global GLU_NURBS_ERROR37 := 100287

/**
 * @type {Integer (UInt32)}
 */
export global GLU_CW := 100120

/**
 * @type {Integer (UInt32)}
 */
export global GLU_CCW := 100121

/**
 * @type {Integer (UInt32)}
 */
export global GLU_INTERIOR := 100122

/**
 * @type {Integer (UInt32)}
 */
export global GLU_EXTERIOR := 100123

/**
 * @type {Integer (UInt32)}
 */
export global GLU_UNKNOWN := 100124

/**
 * @type {Integer (UInt32)}
 */
export global GLU_BEGIN := 100100

/**
 * @type {Integer (UInt32)}
 */
export global GLU_VERTEX := 100101

/**
 * @type {Integer (UInt32)}
 */
export global GLU_END := 100102

/**
 * @type {Integer (UInt32)}
 */
export global GLU_ERROR := 100103

/**
 * @type {Integer (UInt32)}
 */
export global GLU_EDGE_FLAG := 100104
;@endregion Constants
