#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminThreadingModels extends Win32Enum {

    /**
     * Native name: COMAdminThreadingModelApartment
     * @type {Integer (Int32)}
     */
    static ModelApartment => 0

    /**
     * Native name: COMAdminThreadingModelFree
     * @type {Integer (Int32)}
     */
    static ModelFree => 1

    /**
     * Native name: COMAdminThreadingModelMain
     * @type {Integer (Int32)}
     */
    static ModelMain => 2

    /**
     * Native name: COMAdminThreadingModelBoth
     * @type {Integer (Int32)}
     */
    static ModelBoth => 3

    /**
     * Native name: COMAdminThreadingModelNeutral
     * @type {Integer (Int32)}
     */
    static ModelNeutral => 4

    /**
     * Native name: COMAdminThreadingModelNotSpecified
     * @type {Integer (Int32)}
     */
    static ModelNotSpecified => 5
}
