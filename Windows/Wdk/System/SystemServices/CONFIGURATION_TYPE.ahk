#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class CONFIGURATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ArcSystem => 0

    /**
     * @type {Integer (Int32)}
     */
    static CentralProcessor => 1

    /**
     * @type {Integer (Int32)}
     */
    static FloatingPointProcessor => 2

    /**
     * @type {Integer (Int32)}
     */
    static PrimaryIcache => 3

    /**
     * @type {Integer (Int32)}
     */
    static PrimaryDcache => 4

    /**
     * @type {Integer (Int32)}
     */
    static SecondaryIcache => 5

    /**
     * @type {Integer (Int32)}
     */
    static SecondaryDcache => 6

    /**
     * @type {Integer (Int32)}
     */
    static SecondaryCache => 7

    /**
     * @type {Integer (Int32)}
     */
    static EisaAdapter => 8

    /**
     * @type {Integer (Int32)}
     */
    static TcAdapter => 9

    /**
     * @type {Integer (Int32)}
     */
    static ScsiAdapter => 10

    /**
     * @type {Integer (Int32)}
     */
    static DtiAdapter => 11

    /**
     * @type {Integer (Int32)}
     */
    static MultiFunctionAdapter => 12

    /**
     * @type {Integer (Int32)}
     */
    static DiskController => 13

    /**
     * @type {Integer (Int32)}
     */
    static TapeController => 14

    /**
     * @type {Integer (Int32)}
     */
    static CdromController => 15

    /**
     * @type {Integer (Int32)}
     */
    static WormController => 16

    /**
     * @type {Integer (Int32)}
     */
    static SerialController => 17

    /**
     * @type {Integer (Int32)}
     */
    static NetworkController => 18

    /**
     * @type {Integer (Int32)}
     */
    static DisplayController => 19

    /**
     * @type {Integer (Int32)}
     */
    static ParallelController => 20

    /**
     * @type {Integer (Int32)}
     */
    static PointerController => 21

    /**
     * @type {Integer (Int32)}
     */
    static KeyboardController => 22

    /**
     * @type {Integer (Int32)}
     */
    static AudioController => 23

    /**
     * @type {Integer (Int32)}
     */
    static OtherController => 24

    /**
     * @type {Integer (Int32)}
     */
    static DiskPeripheral => 25

    /**
     * @type {Integer (Int32)}
     */
    static FloppyDiskPeripheral => 26

    /**
     * @type {Integer (Int32)}
     */
    static TapePeripheral => 27

    /**
     * @type {Integer (Int32)}
     */
    static ModemPeripheral => 28

    /**
     * @type {Integer (Int32)}
     */
    static MonitorPeripheral => 29

    /**
     * @type {Integer (Int32)}
     */
    static PrinterPeripheral => 30

    /**
     * @type {Integer (Int32)}
     */
    static PointerPeripheral => 31

    /**
     * @type {Integer (Int32)}
     */
    static KeyboardPeripheral => 32

    /**
     * @type {Integer (Int32)}
     */
    static TerminalPeripheral => 33

    /**
     * @type {Integer (Int32)}
     */
    static OtherPeripheral => 34

    /**
     * @type {Integer (Int32)}
     */
    static LinePeripheral => 35

    /**
     * @type {Integer (Int32)}
     */
    static NetworkPeripheral => 36

    /**
     * @type {Integer (Int32)}
     */
    static SystemMemory => 37

    /**
     * @type {Integer (Int32)}
     */
    static DockingInformation => 38

    /**
     * @type {Integer (Int32)}
     */
    static RealModeIrqRoutingTable => 39

    /**
     * @type {Integer (Int32)}
     */
    static RealModePCIEnumeration => 40

    /**
     * @type {Integer (Int32)}
     */
    static MaximumType => 41
}
