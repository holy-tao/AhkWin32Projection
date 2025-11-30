#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class EXpsJobConsumption extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XpsJob_DocumentSequenceAdded => 0

    /**
     * @type {Integer (Int32)}
     */
    static XpsJob_FixedDocumentAdded => 1

    /**
     * @type {Integer (Int32)}
     */
    static XpsJob_FixedPageAdded => 2
}
