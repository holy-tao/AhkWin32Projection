#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

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
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_POWERMESSAGEWAKE_PARAMS_A extends Win32Struct
{
    static sizeof => 520

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
     * Buffer that contains a string of custom text. Windows displays this text on the power management page of the device properties display in Device Manager.
     * @type {Array<SByte>}
     */
    PowerMessageWake{
        get {
            if(!this.HasProp("__PowerMessageWakeProxyArray"))
                this.__PowerMessageWakeProxyArray := Win32FixedArray(this.ptr + 8, 512, Primitive, "char")
            return this.__PowerMessageWakeProxyArray
        }
    }
}
