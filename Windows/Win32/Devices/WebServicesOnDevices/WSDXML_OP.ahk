#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDXML_OP{

    /**
     * @type {Integer (Int32)}
     */
    static OpNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static OpEndOfTable => 1

    /**
     * @type {Integer (Int32)}
     */
    static OpBeginElement_ => 2

    /**
     * @type {Integer (Int32)}
     */
    static OpBeginAnyElement => 3

    /**
     * @type {Integer (Int32)}
     */
    static OpEndElement => 4

    /**
     * @type {Integer (Int32)}
     */
    static OpElement_ => 5

    /**
     * @type {Integer (Int32)}
     */
    static OpAnyElement => 6

    /**
     * @type {Integer (Int32)}
     */
    static OpAnyElements => 7

    /**
     * @type {Integer (Int32)}
     */
    static OpAnyText => 8

    /**
     * @type {Integer (Int32)}
     */
    static OpAttribute_ => 9

    /**
     * @type {Integer (Int32)}
     */
    static OpBeginChoice => 10

    /**
     * @type {Integer (Int32)}
     */
    static OpEndChoice => 11

    /**
     * @type {Integer (Int32)}
     */
    static OpBeginSequence => 12

    /**
     * @type {Integer (Int32)}
     */
    static OpEndSequence => 13

    /**
     * @type {Integer (Int32)}
     */
    static OpBeginAll => 14

    /**
     * @type {Integer (Int32)}
     */
    static OpEndAll => 15

    /**
     * @type {Integer (Int32)}
     */
    static OpAnything => 16

    /**
     * @type {Integer (Int32)}
     */
    static OpAnyNumber => 17

    /**
     * @type {Integer (Int32)}
     */
    static OpOneOrMore => 18

    /**
     * @type {Integer (Int32)}
     */
    static OpOptional => 19

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatBool_ => 20

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatInt8_ => 21

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatInt16_ => 22

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatInt32_ => 23

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatInt64_ => 24

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatUInt8_ => 25

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatUInt16_ => 26

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatUInt32_ => 27

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatUInt64_ => 28

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatUnicodeString_ => 29

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatDom_ => 30

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatStruct_ => 31

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatUri_ => 32

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatUuidUri_ => 33

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatName_ => 34

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatListInsertTail_ => 35

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatType_ => 36

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatDynamicType_ => 37

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatLookupType_ => 38

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatDuration_ => 39

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatDateTime_ => 40

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatFloat_ => 41

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatDouble_ => 42

    /**
     * @type {Integer (Int32)}
     */
    static OpProcess_ => 43

    /**
     * @type {Integer (Int32)}
     */
    static OpQualifiedAttribute_ => 44

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatXMLDeclaration_ => 45

    /**
     * @type {Integer (Int32)}
     */
    static OpFormatMax => 46
}
