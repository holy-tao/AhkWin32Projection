#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class OS extends Win32Enum {

    /**
     * Native name: OS_WINDOWS
     * @type {Integer (UInt32)}
     */
    static WINDOWS => 0

    /**
     * Native name: OS_NT
     * @type {Integer (UInt32)}
     */
    static NT => 1

    /**
     * Native name: OS_WIN95ORGREATER
     * @type {Integer (UInt32)}
     */
    static WIN95ORGREATER => 2

    /**
     * Native name: OS_NT4ORGREATER
     * @type {Integer (UInt32)}
     */
    static NT4ORGREATER => 3

    /**
     * Native name: OS_WIN98ORGREATER
     * @type {Integer (UInt32)}
     */
    static WIN98ORGREATER => 5

    /**
     * Native name: OS_WIN98_GOLD
     * @type {Integer (UInt32)}
     */
    static WIN98_GOLD => 6

    /**
     * Native name: OS_WIN2000ORGREATER
     * @type {Integer (UInt32)}
     */
    static WIN2000ORGREATER => 7

    /**
     * Native name: OS_WIN2000PRO
     * @type {Integer (UInt32)}
     */
    static WIN2000PRO => 8

    /**
     * Native name: OS_WIN2000SERVER
     * @type {Integer (UInt32)}
     */
    static WIN2000SERVER => 9

    /**
     * Native name: OS_WIN2000ADVSERVER
     * @type {Integer (UInt32)}
     */
    static WIN2000ADVSERVER => 10

    /**
     * Native name: OS_WIN2000DATACENTER
     * @type {Integer (UInt32)}
     */
    static WIN2000DATACENTER => 11

    /**
     * Native name: OS_WIN2000TERMINAL
     * @type {Integer (UInt32)}
     */
    static WIN2000TERMINAL => 12

    /**
     * Native name: OS_EMBEDDED
     * @type {Integer (UInt32)}
     */
    static EMBEDDED => 13

    /**
     * Native name: OS_TERMINALCLIENT
     * @type {Integer (UInt32)}
     */
    static TERMINALCLIENT => 14

    /**
     * Native name: OS_TERMINALREMOTEADMIN
     * @type {Integer (UInt32)}
     */
    static TERMINALREMOTEADMIN => 15

    /**
     * Native name: OS_WIN95_GOLD
     * @type {Integer (UInt32)}
     */
    static WIN95_GOLD => 16

    /**
     * Native name: OS_MEORGREATER
     * @type {Integer (UInt32)}
     */
    static MEORGREATER => 17

    /**
     * Native name: OS_XPORGREATER
     * @type {Integer (UInt32)}
     */
    static XPORGREATER => 18

    /**
     * Native name: OS_HOME
     * @type {Integer (UInt32)}
     */
    static HOME => 19

    /**
     * Native name: OS_PROFESSIONAL
     * @type {Integer (UInt32)}
     */
    static PROFESSIONAL => 20

    /**
     * Native name: OS_DATACENTER
     * @type {Integer (UInt32)}
     */
    static DATACENTER => 21

    /**
     * Native name: OS_ADVSERVER
     * @type {Integer (UInt32)}
     */
    static ADVSERVER => 22

    /**
     * Native name: OS_SERVER
     * @type {Integer (UInt32)}
     */
    static SERVER => 23

    /**
     * Native name: OS_TERMINALSERVER
     * @type {Integer (UInt32)}
     */
    static TERMINALSERVER => 24

    /**
     * Native name: OS_PERSONALTERMINALSERVER
     * @type {Integer (UInt32)}
     */
    static PERSONALTERMINALSERVER => 25

    /**
     * Native name: OS_FASTUSERSWITCHING
     * @type {Integer (UInt32)}
     */
    static FASTUSERSWITCHING => 26

    /**
     * Native name: OS_WELCOMELOGONUI
     * @type {Integer (UInt32)}
     */
    static WELCOMELOGONUI => 27

    /**
     * Native name: OS_DOMAINMEMBER
     * @type {Integer (UInt32)}
     */
    static DOMAINMEMBER => 28

    /**
     * Native name: OS_ANYSERVER
     * @type {Integer (UInt32)}
     */
    static ANYSERVER => 29

    /**
     * Native name: OS_WOW6432
     * @type {Integer (UInt32)}
     */
    static WOW6432 => 30

    /**
     * Native name: OS_WEBSERVER
     * @type {Integer (UInt32)}
     */
    static WEBSERVER => 31

    /**
     * Native name: OS_SMALLBUSINESSSERVER
     * @type {Integer (UInt32)}
     */
    static SMALLBUSINESSSERVER => 32

    /**
     * Native name: OS_TABLETPC
     * @type {Integer (UInt32)}
     */
    static TABLETPC => 33

    /**
     * Native name: OS_SERVERADMINUI
     * @type {Integer (UInt32)}
     */
    static SERVERADMINUI => 34

    /**
     * Native name: OS_MEDIACENTER
     * @type {Integer (UInt32)}
     */
    static MEDIACENTER => 35

    /**
     * Native name: OS_APPLIANCE
     * @type {Integer (UInt32)}
     */
    static APPLIANCE => 36
}
