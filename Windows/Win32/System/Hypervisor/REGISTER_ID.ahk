#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class REGISTER_ID{

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterRax => 0

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterRcx => 1

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterRdx => 2

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterRbx => 3

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterRsp => 4

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterRbp => 5

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterRsi => 6

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterRdi => 7

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterR8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterR9 => 9

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterR10 => 10

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterR11 => 11

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterR12 => 12

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterR13 => 13

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterR14 => 14

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterR15 => 15

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterRip => 16

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterRFlags => 17

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm0 => 18

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm1 => 19

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm2 => 20

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm3 => 21

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm4 => 22

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm5 => 23

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm6 => 24

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm7 => 25

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm8 => 26

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm9 => 27

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm10 => 28

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm11 => 29

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm12 => 30

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm13 => 31

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm14 => 32

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmm15 => 33

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterFpMmx0 => 34

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterFpMmx1 => 35

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterFpMmx2 => 36

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterFpMmx3 => 37

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterFpMmx4 => 38

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterFpMmx5 => 39

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterFpMmx6 => 40

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterFpMmx7 => 41

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterFpControlStatus => 42

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterXmmControlStatus => 43

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterCr0 => 44

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterCr2 => 45

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterCr3 => 46

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterCr4 => 47

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterCr8 => 48

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterEfer => 49

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterDr0 => 50

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterDr1 => 51

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterDr2 => 52

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterDr3 => 53

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterDr6 => 54

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterDr7 => 55

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterEs => 56

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterCs => 57

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterSs => 58

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterDs => 59

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterFs => 60

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterGs => 61

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterLdtr => 62

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterTr => 63

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterIdtr => 64

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterGdtr => 65

    /**
     * @type {Integer (Int32)}
     */
    static X64_RegisterMax => 66

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX0 => 67

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX1 => 68

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX2 => 69

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX3 => 70

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX4 => 71

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX5 => 72

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX6 => 73

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX7 => 74

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX8 => 75

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX9 => 76

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX10 => 77

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX11 => 78

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX12 => 79

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX13 => 80

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX14 => 81

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX15 => 82

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX16 => 83

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX17 => 84

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX18 => 85

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX19 => 86

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX20 => 87

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX21 => 88

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX22 => 89

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX23 => 90

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX24 => 91

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX25 => 92

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX26 => 93

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX27 => 94

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterX28 => 95

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterXFp => 96

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterXLr => 97

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterPc => 98

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterSpEl0 => 99

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterSpEl1 => 100

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterCpsr => 101

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ0 => 102

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ1 => 103

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ2 => 104

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ3 => 105

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ4 => 106

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ5 => 107

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ6 => 108

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ7 => 109

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ8 => 110

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ9 => 111

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ10 => 112

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ11 => 113

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ12 => 114

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ13 => 115

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ14 => 116

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ15 => 117

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ16 => 118

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ17 => 119

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ18 => 120

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ19 => 121

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ20 => 122

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ21 => 123

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ22 => 124

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ23 => 125

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ24 => 126

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ25 => 127

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ26 => 128

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ27 => 129

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ28 => 130

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ29 => 131

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ30 => 132

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterQ31 => 133

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterFpStatus => 134

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterFpControl => 135

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterEsrEl1 => 136

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterSpsrEl1 => 137

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterFarEl1 => 138

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterParEl1 => 139

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterElrEl1 => 140

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterTtbr0El1 => 141

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterTtbr1El1 => 142

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterVbarEl1 => 143

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterSctlrEl1 => 144

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterActlrEl1 => 145

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterTcrEl1 => 146

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterMairEl1 => 147

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterAmairEl1 => 148

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterTpidrEl0 => 149

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterTpidrroEl0 => 150

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterTpidrEl1 => 151

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterContextIdrEl1 => 152

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterCpacrEl1 => 153

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterCsselrEl1 => 154

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterCntkctlEl1 => 155

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterCntvCvalEl0 => 156

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterCntvCtlEl0 => 157

    /**
     * @type {Integer (Int32)}
     */
    static ARM64_RegisterMax => 158
}
