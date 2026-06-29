#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SP_CLASSINSTALL_HEADER.ahk" { SP_CLASSINSTALL_HEADER }
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * An SP_SELECTDEVICE_PARAMS structure corresponds to a DIF_SELECTDEVICE installation request. (Unicode)
 * @remarks
 * If an installer sets fields in this structure to be used during driver selection, the installer must also set the DI_USECI_SELECTSTRINGS flag in the SP_DEVINSTALL_PARAMS. 
 * 
 * The following screen shot shows a sample Select Device dialog box and identifies the strings an installer can supply.
 * 
 * <img alt="Screen shot of a Select a Device Driver dialog box" src="images/select-dialog.png"/>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The setupapi.h header defines SP_SELECTDEVICE_PARAMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_selectdevice_params_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct SP_SELECTDEVICE_PARAMS_W {
    #StructPack 4

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
     */
    ClassInstallHeader : SP_CLASSINSTALL_HEADER

    /**
     * Buffer that contains an installer-provided window title for driver-selection windows. Windows uses this title for the window title for the Select Device dialogs.
     */
    Title : WCHAR[60]

    /**
     * Buffer that contains an installer-provided select-device instructions.
     */
    Instructions : WCHAR[256]

    /**
     * Buffer that contains an installer-provided label for the list of drivers from which the user can select.
     */
    ListLabel : WCHAR[30]

    /**
     * Buffer that contains an installer-provided subtitle used in select-device wizards. This string is not used in select dialogs.
     */
    SubTitle : WCHAR[256]

}
