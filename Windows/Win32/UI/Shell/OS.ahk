#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class OS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WINDOWS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OS_NT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WIN95ORGREATER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OS_NT4ORGREATER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WIN98ORGREATER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WIN98_GOLD => 6

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WIN2000ORGREATER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WIN2000PRO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WIN2000SERVER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WIN2000ADVSERVER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WIN2000DATACENTER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WIN2000TERMINAL => 12

    /**
     * @type {Integer (UInt32)}
     */
    static OS_EMBEDDED => 13

    /**
     * @type {Integer (UInt32)}
     */
    static OS_TERMINALCLIENT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static OS_TERMINALREMOTEADMIN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WIN95_GOLD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OS_MEORGREATER => 17

    /**
     * @type {Integer (UInt32)}
     */
    static OS_XPORGREATER => 18

    /**
     * @type {Integer (UInt32)}
     */
    static OS_HOME => 19

    /**
     * @type {Integer (UInt32)}
     */
    static OS_PROFESSIONAL => 20

    /**
     * @type {Integer (UInt32)}
     */
    static OS_DATACENTER => 21

    /**
     * @type {Integer (UInt32)}
     */
    static OS_ADVSERVER => 22

    /**
     * @type {Integer (UInt32)}
     */
    static OS_SERVER => 23

    /**
     * @type {Integer (UInt32)}
     */
    static OS_TERMINALSERVER => 24

    /**
     * @type {Integer (UInt32)}
     */
    static OS_PERSONALTERMINALSERVER => 25

    /**
     * @type {Integer (UInt32)}
     */
    static OS_FASTUSERSWITCHING => 26

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WELCOMELOGONUI => 27

    /**
     * @type {Integer (UInt32)}
     */
    static OS_DOMAINMEMBER => 28

    /**
     * @type {Integer (UInt32)}
     */
    static OS_ANYSERVER => 29

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WOW6432 => 30

    /**
     * @type {Integer (UInt32)}
     */
    static OS_WEBSERVER => 31

    /**
     * @type {Integer (UInt32)}
     */
    static OS_SMALLBUSINESSSERVER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OS_TABLETPC => 33

    /**
     * @type {Integer (UInt32)}
     */
    static OS_SERVERADMINUI => 34

    /**
     * @type {Integer (UInt32)}
     */
    static OS_MEDIACENTER => 35

    /**
     * @type {Integer (UInt32)}
     */
    static OS_APPLIANCE => 36
}
