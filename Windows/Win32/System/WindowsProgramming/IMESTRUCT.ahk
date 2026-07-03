#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Used by SendIMEMessageEx to specify the subfunction to be executed in the Input Method Editor (IME) message and its parameters. This structure is also used to receive return values from those subfunctions.
 * @see https://learn.microsoft.com/windows/win32/api/ime/ns-ime-imestruct
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct IMESTRUCT {
    #StructPack 8

    fnc : UInt32

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     */
    wParam : WPARAM

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     */
    wCount : UInt32

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     */
    dchSource : UInt32

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     */
    dchDest : UInt32

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     */
    lParam1 : LPARAM

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     */
    lParam2 : LPARAM

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     */
    lParam3 : LPARAM

}
