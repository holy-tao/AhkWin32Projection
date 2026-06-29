#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Provides information about the parameter on the stack.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ns-callobj-callframeparaminfo
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct CALLFRAMEPARAMINFO {
    #StructPack 4

    /**
     * <b>TRUE</b> if this is an [in] parameter; otherwise, <b>FALSE</b>.
     */
    fIn : BOOLEAN

    /**
     * <b>TRUE</b> if this is an [out] parameter; otherwise, <b>FALSE</b>.
     */
    fOut : BOOLEAN

    /**
     * Represents the offset in bytes from the stack location of the frame to the start of the parameter.
     */
    stackOffset : UInt32

    /**
     * Represents the size in bytes occupied by the parameter on the stack.
     */
    cbParam : UInt32

}
