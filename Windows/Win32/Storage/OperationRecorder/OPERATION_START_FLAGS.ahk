#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.OperationRecorder
 * @version v4.0.30319
 */
class OPERATION_START_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static OPERATION_START_TRACE_CURRENT_THREAD => 1
}
