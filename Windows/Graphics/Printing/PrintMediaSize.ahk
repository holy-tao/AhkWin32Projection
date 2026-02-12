#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the media size option.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printmediasize
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintMediaSize extends Win32Enum{

    /**
     * The default media size.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * A media size that is not available with the application, or a size that is not supported by the print device.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A media size that is specific to the print device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * A business card size.
     * @type {Integer (Int32)}
     */
    static BusinessCard => 3

    /**
     * A credit card size.
     * @type {Integer (Int32)}
     */
    static CreditCard => 4

    /**
     * The IsoA0 media size.
     * @type {Integer (Int32)}
     */
    static IsoA0 => 5

    /**
     * The IsoA1 media size.
     * @type {Integer (Int32)}
     */
    static IsoA1 => 6

    /**
     * The IsoA10 media size.
     * @type {Integer (Int32)}
     */
    static IsoA10 => 7

    /**
     * The IsoA2 media size.
     * @type {Integer (Int32)}
     */
    static IsoA2 => 8

    /**
     * The IsoA3 media size.
     * @type {Integer (Int32)}
     */
    static IsoA3 => 9

    /**
     * The IsoA3Extra media size.
     * @type {Integer (Int32)}
     */
    static IsoA3Extra => 10

    /**
     * The IsoA3Rotated media size.
     * @type {Integer (Int32)}
     */
    static IsoA3Rotated => 11

    /**
     * The IsoA4 media size.
     * @type {Integer (Int32)}
     */
    static IsoA4 => 12

    /**
     * The IsoA4Extra media size.
     * @type {Integer (Int32)}
     */
    static IsoA4Extra => 13

    /**
     * The IsoA4Rotated media size.
     * @type {Integer (Int32)}
     */
    static IsoA4Rotated => 14

    /**
     * The IsoA5 media size.
     * @type {Integer (Int32)}
     */
    static IsoA5 => 15

    /**
     * The IsoA5Extra media size.
     * @type {Integer (Int32)}
     */
    static IsoA5Extra => 16

    /**
     * The IsoA5Rotated media size.
     * @type {Integer (Int32)}
     */
    static IsoA5Rotated => 17

    /**
     * The IsoA6 media size.
     * @type {Integer (Int32)}
     */
    static IsoA6 => 18

    /**
     * The IsoA6Rotated media size.
     * @type {Integer (Int32)}
     */
    static IsoA6Rotated => 19

    /**
     * The IsoA7 media size.
     * @type {Integer (Int32)}
     */
    static IsoA7 => 20

    /**
     * The IsoA8 media size.
     * @type {Integer (Int32)}
     */
    static IsoA8 => 21

    /**
     * The IsoA9 media size.
     * @type {Integer (Int32)}
     */
    static IsoA9 => 22

    /**
     * The IsoB0 media size.
     * @type {Integer (Int32)}
     */
    static IsoB0 => 23

    /**
     * The IsoB1 media size.
     * @type {Integer (Int32)}
     */
    static IsoB1 => 24

    /**
     * The IsoB10 media size.
     * @type {Integer (Int32)}
     */
    static IsoB10 => 25

    /**
     * The IsoB2 media size.
     * @type {Integer (Int32)}
     */
    static IsoB2 => 26

    /**
     * The IsoB3 media size.
     * @type {Integer (Int32)}
     */
    static IsoB3 => 27

    /**
     * The IsoB4 media size.
     * @type {Integer (Int32)}
     */
    static IsoB4 => 28

    /**
     * The IsoB4Envelope media size.
     * @type {Integer (Int32)}
     */
    static IsoB4Envelope => 29

    /**
     * The IsoB5Envelope media size.
     * @type {Integer (Int32)}
     */
    static IsoB5Envelope => 30

    /**
     * The IsoB5Extra media size.
     * @type {Integer (Int32)}
     */
    static IsoB5Extra => 31

    /**
     * The IsoB7 media size.
     * @type {Integer (Int32)}
     */
    static IsoB7 => 32

    /**
     * The IsoB8 media size.
     * @type {Integer (Int32)}
     */
    static IsoB8 => 33

    /**
     * The IsoB9 media size.
     * @type {Integer (Int32)}
     */
    static IsoB9 => 34

    /**
     * The IsoC0 media size.
     * @type {Integer (Int32)}
     */
    static IsoC0 => 35

    /**
     * The IsoC1 media size.
     * @type {Integer (Int32)}
     */
    static IsoC1 => 36

    /**
     * The IsoC10 media size.
     * @type {Integer (Int32)}
     */
    static IsoC10 => 37

    /**
     * The IsoC2 media size.
     * @type {Integer (Int32)}
     */
    static IsoC2 => 38

    /**
     * The IsoC3 media size.
     * @type {Integer (Int32)}
     */
    static IsoC3 => 39

    /**
     * The IsoC3Envelope media size.
     * @type {Integer (Int32)}
     */
    static IsoC3Envelope => 40

    /**
     * The IsoC4 media size.
     * @type {Integer (Int32)}
     */
    static IsoC4 => 41

    /**
     * The IsoC4Envelope media size.
     * @type {Integer (Int32)}
     */
    static IsoC4Envelope => 42

    /**
     * The IsoC5 media size.
     * @type {Integer (Int32)}
     */
    static IsoC5 => 43

    /**
     * The IsoC5Envelope media size.
     * @type {Integer (Int32)}
     */
    static IsoC5Envelope => 44

    /**
     * The IsoC6 media size.
     * @type {Integer (Int32)}
     */
    static IsoC6 => 45

    /**
     * The IsoC6C5Envelope media size.
     * @type {Integer (Int32)}
     */
    static IsoC6C5Envelope => 46

    /**
     * The IsoC6Envelope media size.
     * @type {Integer (Int32)}
     */
    static IsoC6Envelope => 47

    /**
     * The IsoC7 media size.
     * @type {Integer (Int32)}
     */
    static IsoC7 => 48

    /**
     * The IsoC8 media size.
     * @type {Integer (Int32)}
     */
    static IsoC8 => 49

    /**
     * The IsoC9 media size.
     * @type {Integer (Int32)}
     */
    static IsoC9 => 50

    /**
     * The IsoDLEnvelope media size.
     * @type {Integer (Int32)}
     */
    static IsoDLEnvelope => 51

    /**
     * The IsoDLEnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static IsoDLEnvelopeRotated => 52

    /**
     * The IsoSRA3 media size.
     * @type {Integer (Int32)}
     */
    static IsoSRA3 => 53

    /**
     * The Japan2LPhoto media size.
     * @type {Integer (Int32)}
     */
    static Japan2LPhoto => 54

    /**
     * The JapanChou3Envelope media size.
     * @type {Integer (Int32)}
     */
    static JapanChou3Envelope => 55

    /**
     * The JapanChou3EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static JapanChou3EnvelopeRotated => 56

    /**
     * The JapanChou4Envelope media size.
     * @type {Integer (Int32)}
     */
    static JapanChou4Envelope => 57

    /**
     * The JapanChou4EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static JapanChou4EnvelopeRotated => 58

    /**
     * The JapanChouDoubleHagakiPostcard media size.
     * @type {Integer (Int32)}
     */
    static JapanDoubleHagakiPostcard => 59

    /**
     * The JapanChouDoubleHagakiPostcardRotated media size.
     * @type {Integer (Int32)}
     */
    static JapanDoubleHagakiPostcardRotated => 60

    /**
     * The JapanHagakiPostcard media size.
     * @type {Integer (Int32)}
     */
    static JapanHagakiPostcard => 61

    /**
     * The JapanHagakiPostcardRotated media size.
     * @type {Integer (Int32)}
     */
    static JapanHagakiPostcardRotated => 62

    /**
     * The JapanKaku2Envelope media size.
     * @type {Integer (Int32)}
     */
    static JapanKaku2Envelope => 63

    /**
     * The JapanKaku2EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static JapanKaku2EnvelopeRotated => 64

    /**
     * The JapanKaku3Envelope media size.
     * @type {Integer (Int32)}
     */
    static JapanKaku3Envelope => 65

    /**
     * The JapanKaku3EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static JapanKaku3EnvelopeRotated => 66

    /**
     * The JapanlPhoto media size.
     * @type {Integer (Int32)}
     */
    static JapanLPhoto => 67

    /**
     * The JapanQuadrupleHagakiPostcard media size.
     * @type {Integer (Int32)}
     */
    static JapanQuadrupleHagakiPostcard => 68

    /**
     * The JapanYou1Envelope media size.
     * @type {Integer (Int32)}
     */
    static JapanYou1Envelope => 69

    /**
     * The JapanYou2Envelope media size.
     * @type {Integer (Int32)}
     */
    static JapanYou2Envelope => 70

    /**
     * The JapanYou3Envelope media size.
     * @type {Integer (Int32)}
     */
    static JapanYou3Envelope => 71

    /**
     * The JapanYou4Envelope media size.
     * @type {Integer (Int32)}
     */
    static JapanYou4Envelope => 72

    /**
     * The JapanYou4EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static JapanYou4EnvelopeRotated => 73

    /**
     * The JapanYou6Envelope media size.
     * @type {Integer (Int32)}
     */
    static JapanYou6Envelope => 74

    /**
     * The JapanYou6EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static JapanYou6EnvelopeRotated => 75

    /**
     * The JisB0 media size.
     * @type {Integer (Int32)}
     */
    static JisB0 => 76

    /**
     * The JisB1 media size.
     * @type {Integer (Int32)}
     */
    static JisB1 => 77

    /**
     * The JisB10 media size.
     * @type {Integer (Int32)}
     */
    static JisB10 => 78

    /**
     * The JisB2 media size.
     * @type {Integer (Int32)}
     */
    static JisB2 => 79

    /**
     * The JisB3 media size.
     * @type {Integer (Int32)}
     */
    static JisB3 => 80

    /**
     * The JisB4 media size.
     * @type {Integer (Int32)}
     */
    static JisB4 => 81

    /**
     * The JisB4 media size.
     * @type {Integer (Int32)}
     */
    static JisB4Rotated => 82

    /**
     * The JisB5 media size.
     * @type {Integer (Int32)}
     */
    static JisB5 => 83

    /**
     * The JisB5Rotated media size.
     * @type {Integer (Int32)}
     */
    static JisB5Rotated => 84

    /**
     * The JisB6 media size.
     * @type {Integer (Int32)}
     */
    static JisB6 => 85

    /**
     * The JisB6Rotated media size.
     * @type {Integer (Int32)}
     */
    static JisB6Rotated => 86

    /**
     * The JisB7 media size.
     * @type {Integer (Int32)}
     */
    static JisB7 => 87

    /**
     * The JisB8 media size.
     * @type {Integer (Int32)}
     */
    static JisB8 => 88

    /**
     * The JisB9 media size.
     * @type {Integer (Int32)}
     */
    static JisB9 => 89

    /**
     * The NorthAmerica10x11 media size.
     * @type {Integer (Int32)}
     */
    static NorthAmerica10x11 => 90

    /**
     * The NorthAmerica10x12 media size.
     * @type {Integer (Int32)}
     */
    static NorthAmerica10x12 => 91

    /**
     * The NorthAmerica10x14 media size.
     * @type {Integer (Int32)}
     */
    static NorthAmerica10x14 => 92

    /**
     * The NorthAmerica11x17 media size.
     * @type {Integer (Int32)}
     */
    static NorthAmerica11x17 => 93

    /**
     * The NorthAmerica14x17 media size.
     * @type {Integer (Int32)}
     */
    static NorthAmerica14x17 => 94

    /**
     * The NorthAmerica4x6 media size.
     * @type {Integer (Int32)}
     */
    static NorthAmerica4x6 => 95

    /**
     * The NorthAmerica4x8 media size.
     * @type {Integer (Int32)}
     */
    static NorthAmerica4x8 => 96

    /**
     * The NorthAmerica5x7 media size.
     * @type {Integer (Int32)}
     */
    static NorthAmerica5x7 => 97

    /**
     * The NorthAmerica8x10 media size.
     * @type {Integer (Int32)}
     */
    static NorthAmerica8x10 => 98

    /**
     * The NorthAmerica9x11 media size.
     * @type {Integer (Int32)}
     */
    static NorthAmerica9x11 => 99

    /**
     * The NorthAmericaArchitectureASheet media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaArchitectureASheet => 100

    /**
     * The NorthAmericaArchitectureBSheet media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaArchitectureBSheet => 101

    /**
     * The NorthAmericaArchitectureCSheet media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaArchitectureCSheet => 102

    /**
     * The NorthAmericaArchitectureDSheet media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaArchitectureDSheet => 103

    /**
     * The NorthAmericaArchitectureESheet media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaArchitectureESheet => 104

    /**
     * The NorthAmericaCSheet media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaCSheet => 105

    /**
     * The NorthAmericaDSheet media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaDSheet => 106

    /**
     * The NorthAmericaESheet media sze.
     * @type {Integer (Int32)}
     */
    static NorthAmericaESheet => 107

    /**
     * The NorthAmericaExecutive media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaExecutive => 108

    /**
     * The NorthAmericaGermanLegalFanfold media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaGermanLegalFanfold => 109

    /**
     * The NorthAmericaGermanStandardFanfold media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaGermanStandardFanfold => 110

    /**
     * The NorthAmericaLegal media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaLegal => 111

    /**
     * The NorthAmericaLegalExtra media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaLegalExtra => 112

    /**
     * The NorthAmericaLetter media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaLetter => 113

    /**
     * The NorthAmericaLetterExtra media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaLetterExtra => 114

    /**
     * The NorthAmericaLetterPlus media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaLetterPlus => 115

    /**
     * The NorthAmericaLetterRotated media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaLetterRotated => 116

    /**
     * The NorthAmericaMonarchEnvelope media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaMonarchEnvelope => 117

    /**
     * The NorthAmericaNote media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaNote => 118

    /**
     * The NorthAmericaNumber10Envelope media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaNumber10Envelope => 119

    /**
     * The NorthAmericaNumber10EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaNumber10EnvelopeRotated => 120

    /**
     * The NorthAmericaNumber11Envelope media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaNumber11Envelope => 121

    /**
     * The NorthAmericaNumber12Envelope media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaNumber12Envelope => 122

    /**
     * The NorthAmericaNumber14Envelope media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaNumber14Envelope => 123

    /**
     * The NorthAmericaNumber9Envelope media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaNumber9Envelope => 124

    /**
     * The NorthAmericaPersonalEnvelope media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaPersonalEnvelope => 125

    /**
     * The NorthAmericaQuarto media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaQuarto => 126

    /**
     * The NorthAmericaStatement media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaStatement => 127

    /**
     * The NorthAmericaSuperA media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaSuperA => 128

    /**
     * The NorthAmericaSuperB media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaSuperB => 129

    /**
     * The NorthAmericaTabloid media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaTabloid => 130

    /**
     * The NorthAmericaTabloidExtra media size.
     * @type {Integer (Int32)}
     */
    static NorthAmericaTabloidExtra => 131

    /**
     * The OtherMetricA3Plus media size.
     * @type {Integer (Int32)}
     */
    static OtherMetricA3Plus => 132

    /**
     * The OtherMetricA4Plus media size.
     * @type {Integer (Int32)}
     */
    static OtherMetricA4Plus => 133

    /**
     * The OtherMetricFolio media size.
     * @type {Integer (Int32)}
     */
    static OtherMetricFolio => 134

    /**
     * OtherMetricInviteEnvelope media size.
     * @type {Integer (Int32)}
     */
    static OtherMetricInviteEnvelope => 135

    /**
     * The OtherMetricItalianEnvelope media size.
     * @type {Integer (Int32)}
     */
    static OtherMetricItalianEnvelope => 136

    /**
     * The Prc10Envelope media size.
     * @type {Integer (Int32)}
     */
    static Prc10Envelope => 137

    /**
     * The Prc10EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc10EnvelopeRotated => 138

    /**
     * The Prc16K media size.
     * @type {Integer (Int32)}
     */
    static Prc16K => 139

    /**
     * The Prc16KRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc16KRotated => 140

    /**
     * The Prc1Envelope media size.
     * @type {Integer (Int32)}
     */
    static Prc1Envelope => 141

    /**
     * The Prc1EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc1EnvelopeRotated => 142

    /**
     * The Prc2Envelope media size.
     * @type {Integer (Int32)}
     */
    static Prc2Envelope => 143

    /**
     * The Prc2EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc2EnvelopeRotated => 144

    /**
     * The Prc32K media size.
     * @type {Integer (Int32)}
     */
    static Prc32K => 145

    /**
     * The Prc32KBig media size.
     * @type {Integer (Int32)}
     */
    static Prc32KBig => 146

    /**
     * The Prc32KRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc32KRotated => 147

    /**
     * The Prc3Envelope media size.
     * @type {Integer (Int32)}
     */
    static Prc3Envelope => 148

    /**
     * The Prc3EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc3EnvelopeRotated => 149

    /**
     * The Prc4Envelope media size.
     * @type {Integer (Int32)}
     */
    static Prc4Envelope => 150

    /**
     * The Prc4EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc4EnvelopeRotated => 151

    /**
     * The Prc5Envelope media size.
     * @type {Integer (Int32)}
     */
    static Prc5Envelope => 152

    /**
     * The Prc5EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc5EnvelopeRotated => 153

    /**
     * The Prc6Envelope media size.
     * @type {Integer (Int32)}
     */
    static Prc6Envelope => 154

    /**
     * The Prc6EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc6EnvelopeRotated => 155

    /**
     * The Prc7Envelope media size.
     * @type {Integer (Int32)}
     */
    static Prc7Envelope => 156

    /**
     * The Prc7EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc7EnvelopeRotated => 157

    /**
     * The Prc8Envelope media size.
     * @type {Integer (Int32)}
     */
    static Prc8Envelope => 158

    /**
     * The Prc8EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc8EnvelopeRotated => 159

    /**
     * The Prc9Envelope media size.
     * @type {Integer (Int32)}
     */
    static Prc9Envelope => 160

    /**
     * The Prc9EnvelopeRotated media size.
     * @type {Integer (Int32)}
     */
    static Prc9EnvelopeRotated => 161

    /**
     * The Roll04Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll04Inch => 162

    /**
     * The Roll06Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll06Inch => 163

    /**
     * The Roll08Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll08Inch => 164

    /**
     * The Roll12Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll12Inch => 165

    /**
     * The Roll15Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll15Inch => 166

    /**
     * The Roll18Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll18Inch => 167

    /**
     * The Roll22Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll22Inch => 168

    /**
     * The Roll24Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll24Inch => 169

    /**
     * The Roll30Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll30Inch => 170

    /**
     * The Roll36Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll36Inch => 171

    /**
     * The Roll54Inch media size.
     * @type {Integer (Int32)}
     */
    static Roll54Inch => 172
}
