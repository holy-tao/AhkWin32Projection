#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputLabel extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelUnknown => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxGuide => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxBack => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxStart => 3

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxMenu => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxView => 5

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxA => 7

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxB => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxX => 9

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxY => 10

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxDPadUp => 11

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxDPadDown => 12

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxDPadLeft => 13

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxDPadRight => 14

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxLeftShoulder => 15

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxLeftTrigger => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxLeftStickButton => 17

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxRightShoulder => 18

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxRightTrigger => 19

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxRightStickButton => 20

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxPaddle1 => 21

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxPaddle2 => 22

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxPaddle3 => 23

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelXboxPaddle4 => 24

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterA => 25

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterB => 26

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterC => 27

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterD => 28

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterE => 29

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterF => 30

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterG => 31

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterH => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterI => 33

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterJ => 34

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterK => 35

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterL => 36

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterM => 37

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterN => 38

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterO => 39

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterP => 40

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterQ => 41

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterR => 42

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterS => 43

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterT => 44

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterU => 45

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterV => 46

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterW => 47

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterX => 48

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterY => 49

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLetterZ => 50

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNumber0 => 51

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNumber1 => 52

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNumber2 => 53

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNumber3 => 54

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNumber4 => 55

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNumber5 => 56

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNumber6 => 57

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNumber7 => 58

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNumber8 => 59

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelNumber9 => 60

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowUp => 61

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowUpRight => 62

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowRight => 63

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowDownRight => 64

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowDown => 65

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowDownLLeft => 66

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowLeft => 67

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowUpLeft => 68

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowUpDown => 69

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowLeftRight => 70

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowUpDownLeftRight => 71

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowClockwise => 72

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowCounterClockwise => 73

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelArrowReturn => 74

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconBranding => 75

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconHome => 76

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconMenu => 77

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconCross => 78

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconCircle => 79

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconSquare => 80

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconTriangle => 81

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconStar => 82

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconDPadUp => 83

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconDPadDown => 84

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconDPadLeft => 85

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconDPadRight => 86

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconDialClockwise => 87

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconDialCounterClockwise => 88

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconSliderLeftRight => 89

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconSliderUpDown => 90

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconWheelUpDown => 91

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconPlus => 92

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconMinus => 93

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelIconSuspension => 94

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelHome => 95

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelGuide => 96

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelMode => 97

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelSelect => 98

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelMenu => 99

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelView => 100

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelBack => 101

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelStart => 102

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelOptions => 103

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelShare => 104

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelUp => 105

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelDown => 106

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLeft => 107

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelRight => 108

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLB => 109

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLT => 110

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelLSB => 111

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelL1 => 112

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelL2 => 113

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelL3 => 114

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelRB => 115

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelRT => 116

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelRSB => 117

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelR1 => 118

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelR2 => 119

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelR3 => 120

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelP1 => 121

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelP2 => 122

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelP3 => 123

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLabelP4 => 124
}
