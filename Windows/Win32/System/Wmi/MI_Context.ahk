#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ContextFT.ahk" { MI_ContextFT }

/**
 * Holds context for the operation that the provider needs to carry out.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_context
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Context {
    #StructPack 8

    /**
     * This member is used internally, and it must not be changed.
     */
    ft : MI_ContextFT.Ptr

    /**
     * Reserved for internal use.
     */
    reserved : IntPtr[3]

}
