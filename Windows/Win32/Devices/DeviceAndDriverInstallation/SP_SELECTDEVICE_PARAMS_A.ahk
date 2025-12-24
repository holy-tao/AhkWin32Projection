#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * An SP_SELECTDEVICE_PARAMS structure corresponds to a DIF_SELECTDEVICE installation request. (ANSI)
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
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_selectdevice_params_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_SELECTDEVICE_PARAMS_A extends Win32Struct
{
    static sizeof => 612

    static packingSize => 4

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
     * @type {SP_CLASSINSTALL_HEADER}
     */
    ClassInstallHeader{
        get {
            if(!this.HasProp("__ClassInstallHeader"))
                this.__ClassInstallHeader := SP_CLASSINSTALL_HEADER(0, this)
            return this.__ClassInstallHeader
        }
    }

    /**
     * Buffer that contains an installer-provided window title for driver-selection windows. Windows uses this title for the window title for the Select Device dialogs.
     * @type {String}
     */
    Title {
        get => StrGet(this.ptr + 8, 59, "UTF-8")
        set => StrPut(value, this.ptr + 8, 59, "UTF-8")
    }

    /**
     * Buffer that contains an installer-provided select-device instructions.
     * @type {String}
     */
    Instructions {
        get => StrGet(this.ptr + 68, 255, "UTF-8")
        set => StrPut(value, this.ptr + 68, 255, "UTF-8")
    }

    /**
     * Buffer that contains an installer-provided label for the list of drivers from which the user can select.
     * @type {String}
     */
    ListLabel {
        get => StrGet(this.ptr + 324, 29, "UTF-8")
        set => StrPut(value, this.ptr + 324, 29, "UTF-8")
    }

    /**
     * Buffer that contains an installer-provided subtitle used in select-device wizards. This string is not used in select dialogs.
     * @type {String}
     */
    SubTitle {
        get => StrGet(this.ptr + 354, 255, "UTF-8")
        set => StrPut(value, this.ptr + 354, 255, "UTF-8")
    }

    /**
     * Reserved. For internal use only.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 610, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
