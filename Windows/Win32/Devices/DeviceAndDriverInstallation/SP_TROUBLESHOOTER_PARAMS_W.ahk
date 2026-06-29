#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SP_CLASSINSTALL_HEADER.ahk" { SP_CLASSINSTALL_HEADER }
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * An SP_TROUBLESHOOTER_PARAMS structure corresponds to a DIF_TROUBLESHOOTER installation request. (Unicode)
 * @remarks
 * An installer fills in this structure in response to a DIF_TROUBLESHOOTER request.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The setupapi.h header defines SP_TROUBLESHOOTER_PARAMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_troubleshooter_params_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct SP_TROUBLESHOOTER_PARAMS_W {
    #StructPack 4

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
     */
    ClassInstallHeader : SP_CLASSINSTALL_HEADER

    /**
     * Optionally specifies a string buffer that contains the path of a CHM file. The CHM file contains HTML help topics with troubleshooting information. The path must be fully qualified if the file is not in default system help directory (%SystemRoot%\help).
     */
    ChmFile : WCHAR[260]

    /**
     * Optionally specifies a string buffer that contains the path of a topic in the <b>ChmFile</b>. This parameter identifies the page of the <b>ChmFile</b> that Windows should display first.
     */
    HtmlTroubleShooter : WCHAR[260]

}
