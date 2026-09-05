#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.OperationRecorder
 */
class OPERATION_END_PARAMETERS_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: OPERATION_END_DISCARD
     * @type {Integer (UInt32)}
     */
    static DISCARD => 1
}
