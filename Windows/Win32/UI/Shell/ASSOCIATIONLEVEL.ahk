#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the source of the default association for a file name extension. Used by methods of the IApplicationAssociationRegistration interface.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-associationlevel
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ASSOCIATIONLEVEL extends Win32Enum{

    /**
     * The machine-level default application association.
     * @type {Integer (Int32)}
     */
    static AL_MACHINE => 0

    /**
     * The effective default for the current user. This value should be used by most applications.
     * @type {Integer (Int32)}
     */
    static AL_EFFECTIVE => 1

    /**
     * The per-user default application association. If this value is used and no per-user default is declared, the calling method fails with a value of <c>HRESULT_FROM_WIN32(ERROR_NO_ASSOCIATION)</c>.
     * @type {Integer (Int32)}
     */
    static AL_USER => 2
}
