#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\REDIRECTION_FUNCTION_DESCRIPTOR.ahk" { REDIRECTION_FUNCTION_DESCRIPTOR }

/**
 * @namespace Windows.Win32.System.LibraryLoader
 */
export default struct REDIRECTION_DESCRIPTOR {
    #StructPack 8

    Version : UInt32

    FunctionCount : UInt32

    Redirections : REDIRECTION_FUNCTION_DESCRIPTOR.Ptr

}
