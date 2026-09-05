#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.OperationRecorder
 */
class OPERATION_START_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: OPERATION_START_TRACE_CURRENT_THREAD
     * @type {Integer (UInt32)}
     */
    static TRACE_CURRENT_THREAD => 1
}
