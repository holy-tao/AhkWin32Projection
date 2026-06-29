#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ISCSI_TARGET_PORTALA.ahk" { ISCSI_TARGET_PORTALA }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * ISCSI_TARGET_PORTAL_GROUP. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The iscsidsc.h header defines ISCSI_TARGET_PORTAL_GROUP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_groupa
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @charset ANSI
 */
export default struct ISCSI_TARGET_PORTAL_GROUPA {
    #StructPack 4

    /**
     * The number of portals in the portal group.
     */
    Count : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a> structures that describe the portals associated with the portal group. Portal names and addresses are described by either wide-character or ascii strings, depending upon implementation.
     */
    Portals : ISCSI_TARGET_PORTALA[1]

}
