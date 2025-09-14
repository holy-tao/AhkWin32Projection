#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * An SP_TROUBLESHOOTER_PARAMS structure corresponds to a DIF_TROUBLESHOOTER installation request. (ANSI)
 * @remarks
 * An installer fills in this structure in response to a DIF_TROUBLESHOOTER request.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The setupapi.h header defines SP_TROUBLESHOOTER_PARAMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_troubleshooter_params_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_TROUBLESHOOTER_PARAMS_A extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
     * @type {SP_CLASSINSTALL_HEADER}
     */
    ClassInstallHeader{
        get {
            if(!this.HasProp("__ClassInstallHeader"))
                this.__ClassInstallHeader := SP_CLASSINSTALL_HEADER(this.ptr + 0)
            return this.__ClassInstallHeader
        }
    }

    /**
     * Optionally specifies a string buffer that contains the path of a CHM file. The CHM file contains HTML help topics with troubleshooting information. The path must be fully qualified if the file is not in default system help directory (%SystemRoot%\help).
     * @type {Array<SByte>}
     */
    ChmFile{
        get {
            if(!this.HasProp("__ChmFileProxyArray"))
                this.__ChmFileProxyArray := Win32FixedArray(this.ptr + 8, 260, Primitive, "char")
            return this.__ChmFileProxyArray
        }
    }

    /**
     * Optionally specifies a string buffer that contains the path of a topic in the <b>ChmFile</b>. This parameter identifies the page of the <b>ChmFile</b> that Windows should display first.
     * @type {Array<SByte>}
     */
    HtmlTroubleShooter{
        get {
            if(!this.HasProp("__HtmlTroubleShooterProxyArray"))
                this.__HtmlTroubleShooterProxyArray := Win32FixedArray(this.ptr + 268, 260, Primitive, "char")
            return this.__HtmlTroubleShooterProxyArray
        }
    }
}
