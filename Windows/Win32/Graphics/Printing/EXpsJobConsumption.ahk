#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class EXpsJobConsumption extends Win32Enum {

    /**
     * Native name: XpsJob_DocumentSequenceAdded
     * @type {Integer (Int32)}
     */
    static DocumentSequenceAdded => 0

    /**
     * Native name: XpsJob_FixedDocumentAdded
     * @type {Integer (Int32)}
     */
    static FixedDocumentAdded => 1

    /**
     * Native name: XpsJob_FixedPageAdded
     * @type {Integer (Int32)}
     */
    static FixedPageAdded => 2
}
