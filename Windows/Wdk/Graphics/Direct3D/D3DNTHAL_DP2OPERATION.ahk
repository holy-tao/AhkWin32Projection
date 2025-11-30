#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DNTHAL_DP2OPERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_POINTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_INDEXEDLINELIST => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_INDEXEDTRIANGLELIST => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_RENDERSTATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_LINELIST => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_LINESTRIP => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_INDEXEDLINESTRIP => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_TRIANGLELIST => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_TRIANGLESTRIP => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_INDEXEDTRIANGLESTRIP => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_TRIANGLEFAN => 21

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_INDEXEDTRIANGLEFAN => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_TRIANGLEFAN_IMM => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_LINELIST_IMM => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_TEXTURESTAGESTATE => 25

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_INDEXEDTRIANGLELIST2 => 26

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_INDEXEDLINELIST2 => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_VIEWPORTINFO => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_WINFO => 29

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETPALETTE => 30

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_UPDATEPALETTE => 31

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_ZRANGE => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETMATERIAL => 33

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETLIGHT => 34

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_CREATELIGHT => 35

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETTRANSFORM => 36

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_TEXBLT => 38

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_STATESET => 39

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETPRIORITY => 40

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETRENDERTARGET => 41

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_CLEAR => 42

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETTEXLOD => 43

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETCLIPPLANE => 44

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_CREATEVERTEXSHADER => 45

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DELETEVERTEXSHADER => 46

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETVERTEXSHADER => 47

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETVERTEXSHADERCONST => 48

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETSTREAMSOURCE => 49

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETSTREAMSOURCEUM => 50

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETINDICES => 51

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DRAWPRIMITIVE => 52

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DRAWINDEXEDPRIMITIVE => 53

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_CREATEPIXELSHADER => 54

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DELETEPIXELSHADER => 55

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETPIXELSHADER => 56

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETPIXELSHADERCONST => 57

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_CLIPPEDTRIANGLEFAN => 58

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DRAWPRIMITIVE2 => 59

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DRAWINDEXEDPRIMITIVE2 => 60

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DRAWRECTPATCH => 61

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DRAWTRIPATCH => 62

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_VOLUMEBLT => 63

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_BUFFERBLT => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_MULTIPLYTRANSFORM => 65

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_ADDDIRTYRECT => 66

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_ADDDIRTYBOX => 67

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_CREATEVERTEXSHADERDECL => 71

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DELETEVERTEXSHADERDECL => 72

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETVERTEXSHADERDECL => 73

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_CREATEVERTEXSHADERFUNC => 74

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DELETEVERTEXSHADERFUNC => 75

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETVERTEXSHADERFUNC => 76

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETVERTEXSHADERCONSTI => 77

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETSCISSORRECT => 79

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETSTREAMSOURCE2 => 80

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_BLT => 81

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_COLORFILL => 82

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETVERTEXSHADERCONSTB => 83

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_CREATEQUERY => 84

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETRENDERTARGET2 => 85

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETDEPTHSTENCIL => 86

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_RESPONSECONTINUE => 87

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_RESPONSEQUERY => 88

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_GENERATEMIPSUBLEVELS => 89

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_DELETEQUERY => 90

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_ISSUEQUERY => 91

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETPIXELSHADERCONSTI => 93

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETPIXELSHADERCONSTB => 94

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETSTREAMSOURCEFREQ => 95

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SURFACEBLT => 96

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_SETCONVOLUTIONKERNELMONO => 97

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTDP2OP_COMPOSERECTS => 98
}
