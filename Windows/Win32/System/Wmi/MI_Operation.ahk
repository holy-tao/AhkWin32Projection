#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_OperationFT.ahk" { MI_OperationFT }

/**
 * Represents a single operations execution. This object holds the internal function tables for carrying out actions on the operation.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_operation
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Operation {
    #StructPack 8

    /**
     * Reserved for internal use.
     */
    reserved1 : Int64

    /**
     * Reserved for internal use.
     */
    reserved2 : IntPtr

    /**
     * This member is used internally, and it must not be changed.
     */
    ft : MI_OperationFT.Ptr

}
