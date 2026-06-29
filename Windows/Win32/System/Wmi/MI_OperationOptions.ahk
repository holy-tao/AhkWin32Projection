#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_OperationOptionsFT.ahk" { MI_OperationOptionsFT }

/**
 * Represents a set of operation options.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_operationoptions
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_OperationOptions {
    #StructPack 8

    /**
     * This member is used internally, and it must not be changed.
     */
    reserved1 : Int64

    /**
     * This member is used internally, and it must not be changed.
     */
    reserved2 : IntPtr

    /**
     * This member is used internally, and it must not be changed.
     */
    ft : MI_OperationOptionsFT.Ptr

}
