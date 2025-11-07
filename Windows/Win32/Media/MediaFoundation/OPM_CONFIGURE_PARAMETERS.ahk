#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OPM_OMAC.ahk

/**
 * Contains an Output Protection Manager (OPM) or Certified Output Protection Manager (COPP) command.
 * @remarks
 * 
 * The layout of this  structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppcommand">AMCOPPCommand</a> structure used in Certified Output Protection Protocol (COPP).
 *       
 * 
 * Initialize this structure as follows.
 * 
 * <ol>
 * <li>Fill in all the structure members except the <b>omac</b> member.</li>
 * <li>Use the OMAC 1 algorithm to calculate a message authentication code (MAC) for the block of data that appears after the <b>omac</b> member (excluding the <b>omac</b> member).</li>
 * <li>Copy the MAC to the <b>omac</b> member.</li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ns-opmapi-opm_configure_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_CONFIGURE_PARAMETERS extends Win32Struct
{
    static sizeof => 4088

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_omac">OPM_MAC</a> structure. Fill in this structure with the Message Authentication Code (MAC) of the command data. Use AES-based one-key CBC MAC (OMAC) to calculate this value.
     * @type {OPM_OMAC}
     */
    omac{
        get {
            if(!this.HasProp("__omac"))
                this.__omac := OPM_OMAC(0, this)
            return this.__omac
        }
    }

    /**
     * A GUID that specifies the command. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-commands">OPM Commands</a>.
     * @type {Pointer<Guid>}
     */
    guidSetting {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A command sequence number. The application must keep a running count of the commands issued. For each command, increment the sequence number by one.
     * 
     * On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-configure">IOPMVideoOutput::Configure</a>, set <b>ulSequenceNumber</b> equal to the starting command 	sequence number, which is specified when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-startinitialization">IOPMVideoOutput::FinishInitialization</a>. On each subsequent call, increment <b>ulSequenceNumber</b> by 1.
     * 
     * Exception: If the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-configure">IOPMVideoOutput::Configure</a> method fails, do not increment the sequence number. Instead, re-use the same number for the next command.
     * @type {Integer}
     */
    ulSequenceNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of bytes of valid data in the <b>abParameters</b> member.
     * @type {Integer}
     */
    cbParametersSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The data for the command. The meaning of the data depends on the command. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-commands">OPM Commands</a>.
     * @type {Array<Byte>}
     */
    abParameters{
        get {
            if(!this.HasProp("__abParametersProxyArray"))
                this.__abParametersProxyArray := Win32FixedArray(this.ptr + 32, 4056, Primitive, "char")
            return this.__abParametersProxyArray
        }
    }
}
