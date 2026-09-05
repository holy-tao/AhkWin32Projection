#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
class WSDXML_OP extends Win32Enum {

    /**
     * Native name: OpNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: OpEndOfTable
     * @type {Integer (Int32)}
     */
    static EndOfTable => 1

    /**
     * Native name: OpBeginElement_
     * @type {Integer (Int32)}
     */
    static BeginElement_ => 2

    /**
     * Native name: OpBeginAnyElement
     * @type {Integer (Int32)}
     */
    static BeginAnyElement => 3

    /**
     * Native name: OpEndElement
     * @type {Integer (Int32)}
     */
    static EndElement => 4

    /**
     * Native name: OpElement_
     * @type {Integer (Int32)}
     */
    static Element_ => 5

    /**
     * Native name: OpAnyElement
     * @type {Integer (Int32)}
     */
    static AnyElement => 6

    /**
     * Native name: OpAnyElements
     * @type {Integer (Int32)}
     */
    static AnyElements => 7

    /**
     * Native name: OpAnyText
     * @type {Integer (Int32)}
     */
    static AnyText => 8

    /**
     * Native name: OpAttribute_
     * @type {Integer (Int32)}
     */
    static Attribute_ => 9

    /**
     * Native name: OpBeginChoice
     * @type {Integer (Int32)}
     */
    static BeginChoice => 10

    /**
     * Native name: OpEndChoice
     * @type {Integer (Int32)}
     */
    static EndChoice => 11

    /**
     * Native name: OpBeginSequence
     * @type {Integer (Int32)}
     */
    static BeginSequence => 12

    /**
     * Native name: OpEndSequence
     * @type {Integer (Int32)}
     */
    static EndSequence => 13

    /**
     * Native name: OpBeginAll
     * @type {Integer (Int32)}
     */
    static BeginAll => 14

    /**
     * Native name: OpEndAll
     * @type {Integer (Int32)}
     */
    static EndAll => 15

    /**
     * Native name: OpAnything
     * @type {Integer (Int32)}
     */
    static Anything => 16

    /**
     * Native name: OpAnyNumber
     * @type {Integer (Int32)}
     */
    static AnyNumber => 17

    /**
     * Native name: OpOneOrMore
     * @type {Integer (Int32)}
     */
    static OneOrMore => 18

    /**
     * Native name: OpOptional
     * @type {Integer (Int32)}
     */
    static Optional => 19

    /**
     * Native name: OpFormatBool_
     * @type {Integer (Int32)}
     */
    static FormatBool_ => 20

    /**
     * Native name: OpFormatInt8_
     * @type {Integer (Int32)}
     */
    static FormatInt8_ => 21

    /**
     * Native name: OpFormatInt16_
     * @type {Integer (Int32)}
     */
    static FormatInt16_ => 22

    /**
     * Native name: OpFormatInt32_
     * @type {Integer (Int32)}
     */
    static FormatInt32_ => 23

    /**
     * Native name: OpFormatInt64_
     * @type {Integer (Int32)}
     */
    static FormatInt64_ => 24

    /**
     * Native name: OpFormatUInt8_
     * @type {Integer (Int32)}
     */
    static FormatUInt8_ => 25

    /**
     * Native name: OpFormatUInt16_
     * @type {Integer (Int32)}
     */
    static FormatUInt16_ => 26

    /**
     * Native name: OpFormatUInt32_
     * @type {Integer (Int32)}
     */
    static FormatUInt32_ => 27

    /**
     * Native name: OpFormatUInt64_
     * @type {Integer (Int32)}
     */
    static FormatUInt64_ => 28

    /**
     * Native name: OpFormatUnicodeString_
     * @type {Integer (Int32)}
     */
    static FormatUnicodeString_ => 29

    /**
     * Native name: OpFormatDom_
     * @type {Integer (Int32)}
     */
    static FormatDom_ => 30

    /**
     * Native name: OpFormatStruct_
     * @type {Integer (Int32)}
     */
    static FormatStruct_ => 31

    /**
     * Native name: OpFormatUri_
     * @type {Integer (Int32)}
     */
    static FormatUri_ => 32

    /**
     * Native name: OpFormatUuidUri_
     * @type {Integer (Int32)}
     */
    static FormatUuidUri_ => 33

    /**
     * Native name: OpFormatName_
     * @type {Integer (Int32)}
     */
    static FormatName_ => 34

    /**
     * Native name: OpFormatListInsertTail_
     * @type {Integer (Int32)}
     */
    static FormatListInsertTail_ => 35

    /**
     * Native name: OpFormatType_
     * @type {Integer (Int32)}
     */
    static FormatType_ => 36

    /**
     * Native name: OpFormatDynamicType_
     * @type {Integer (Int32)}
     */
    static FormatDynamicType_ => 37

    /**
     * Native name: OpFormatLookupType_
     * @type {Integer (Int32)}
     */
    static FormatLookupType_ => 38

    /**
     * Native name: OpFormatDuration_
     * @type {Integer (Int32)}
     */
    static FormatDuration_ => 39

    /**
     * Native name: OpFormatDateTime_
     * @type {Integer (Int32)}
     */
    static FormatDateTime_ => 40

    /**
     * Native name: OpFormatFloat_
     * @type {Integer (Int32)}
     */
    static FormatFloat_ => 41

    /**
     * Native name: OpFormatDouble_
     * @type {Integer (Int32)}
     */
    static FormatDouble_ => 42

    /**
     * Native name: OpProcess_
     * @type {Integer (Int32)}
     */
    static Process_ => 43

    /**
     * Native name: OpQualifiedAttribute_
     * @type {Integer (Int32)}
     */
    static QualifiedAttribute_ => 44

    /**
     * Native name: OpFormatXMLDeclaration_
     * @type {Integer (Int32)}
     */
    static FormatXMLDeclaration_ => 45

    /**
     * Native name: OpFormatMax
     * @type {Integer (Int32)}
     */
    static FormatMax => 46
}
