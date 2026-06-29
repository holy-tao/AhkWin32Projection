#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SP_CLASSINSTALL_HEADER.ahk" { SP_CLASSINSTALL_HEADER }
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * An SP_POWERMESSAGEWAKE_PARAMS structure corresponds to a DIF_POWERMESSAGEWAKE installation request. (ANSI)
 * @remarks
 * Windows only sends the DIF_POWERMESSAGEWAKE request if the drivers for the device support power management.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The setupapi.h header defines SP_POWERMESSAGEWAKE_PARAMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_powermessagewake_params_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset ANSI
 */
export default struct SP_POWERMESSAGEWAKE_PARAMS_A {
    #StructPack 4

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
     */
    ClassInstallHeader : SP_CLASSINSTALL_HEADER

    /**
     * Buffer that contains a string of custom text. Windows displays this text on the power management page of the device properties display in Device Manager.
     */
    PowerMessageWake : CHAR[512]

}
