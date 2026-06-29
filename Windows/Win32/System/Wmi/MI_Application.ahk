#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ApplicationFT.ahk" { MI_ApplicationFT }

/**
 * Represents the initialized infrastructure.
 * @remarks
 * This structure can be initialized to <b>MI_APPLICATION_NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_application
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Application {
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
    ft : MI_ApplicationFT.Ptr

}
