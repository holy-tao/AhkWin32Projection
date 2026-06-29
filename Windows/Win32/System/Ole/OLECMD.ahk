#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Associates command flags from the OLECMDF enumeration with a command identifier through a call to IOleCommandTarget::QueryStatus.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ns-docobj-olecmd
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLECMD {
    #StructPack 4

    /**
     * A command identifier; taken from the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ne-docobj-olecmdid">OLECMDID</a> enumeration.
     */
    cmdID : UInt32

    /**
     * Flags associated with <b>cmdID</b>; taken from the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ne-docobj-olecmdf">OLECMDF</a> enumeration.
     */
    cmdf : UInt32

}
