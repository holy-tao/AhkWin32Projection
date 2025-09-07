#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSHADER_INSTRUCTION_OPCODE_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_NOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_MOV => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_ADD => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_SUB => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_MAD => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_MUL => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_RCP => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_RSQ => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_DP3 => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_DP4 => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_MIN => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_MAX => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_SLT => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_SGE => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_EXP => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_LOG => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_LIT => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_DST => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_LRP => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_FRC => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_M4x4 => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_M4x3 => 21

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_M3x4 => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_M3x3 => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_M3x2 => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_CALL => 25

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_CALLNZ => 26

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_LOOP => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_RET => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_ENDLOOP => 29

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_LABEL => 30

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_DCL => 31

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_POW => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_CRS => 33

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_SGN => 34

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_ABS => 35

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_NRM => 36

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_SINCOS => 37

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_REP => 38

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_ENDREP => 39

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_IF => 40

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_IFC => 41

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_ELSE => 42

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_ENDIF => 43

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_BREAK => 44

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_BREAKC => 45

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_MOVA => 46

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_DEFB => 47

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_DEFI => 48

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXCOORD => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXKILL => 65

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEX => 66

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXBEM => 67

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXBEML => 68

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXREG2AR => 69

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXREG2GB => 70

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXM3x2PAD => 71

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXM3x2TEX => 72

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXM3x3PAD => 73

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXM3x3TEX => 74

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_RESERVED0 => 75

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXM3x3SPEC => 76

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXM3x3VSPEC => 77

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_EXPP => 78

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_LOGP => 79

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_CND => 80

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_DEF => 81

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXREG2RGB => 82

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXDP3TEX => 83

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXM3x2DEPTH => 84

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXDP3 => 85

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXM3x3 => 86

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXDEPTH => 87

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_CMP => 88

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_BEM => 89

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_DP2ADD => 90

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_DSX => 91

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_DSY => 92

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXLDD => 93

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_SETP => 94

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_TEXLDL => 95

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_BREAKP => 96

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_PHASE => 65533

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_COMMENT => 65534

    /**
     * @type {Integer (Int32)}
     */
    static D3DSIO_END => 65535
}
