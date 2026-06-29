#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Specifies a text name or status string for a single command identifier.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ns-docobj-olecmdtext
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLECMDTEXT {
    #StructPack 4

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ne-docobj-olecmdtextf">OLECMDTEXTF</a> enumeration describing whether the <b>rgwz</b> member contains a command name or status text.
     */
    cmdtextf : UInt32

    /**
     * The number of characters actually written into the <b>rgwz</b> buffer before <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-querystatus">IOleCommandTarget::QueryStatus</a> returns.
     */
    cwActual : UInt32

    /**
     * The number of elements in the <b>rgwz</b> array.
     */
    cwBuf : UInt32

    /**
     * A caller-allocated array of wide characters to receive the command name or status text.
     */
    rgwz : WCHAR[1]

}
