#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSIOOPERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KsIoOperation_Write => 0

    /**
     * @type {Integer (Int32)}
     */
    static KsIoOperation_Read => 1
}
