#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_SessionFT.ahk" { MI_SessionFT }

/**
 * An object that is associated with a destination and has a set of credentials and options associated with it. .
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_session
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Session {
    #StructPack 8

    /**
     * For internal use only.
     */
    reserved1 : Int64

    /**
     * For internal use only.
     */
    reserved2 : IntPtr

    /**
     * This is the function table for accessing carrying out 
     *                       operations on a destination machine, along with configuration of the session. Use the functions containing the MI_Session_ prefix to access this information.
     */
    ft : MI_SessionFT.Ptr

}
