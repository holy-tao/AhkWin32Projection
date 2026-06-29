#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents the set of arguments that are passed in to the command line.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_command_arg_set
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_COMMAND_ARG_SET {
    #StructPack 8

    /**
     * Specifies the number of arguments in the array.
     */
    argsCount : UInt32

    /**
     * Defines an array of strings that specify the arguments.
     */
    args : PWSTR.Ptr

}
