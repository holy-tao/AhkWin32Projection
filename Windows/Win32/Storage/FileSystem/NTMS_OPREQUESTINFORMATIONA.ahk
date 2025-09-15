#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The NTMS_OPREQUESTINFORMATION structure defines the properties specific to operator-request system control for RSM. (ANSI)
 * @remarks
 * The 
  * <b>NTMS_OPREQUESTINFORMATION</b> structure is included in the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The ntmsapi.h header defines NTMS_OPREQUESTINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_oprequestinformationa
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class NTMS_OPREQUESTINFORMATIONA extends Win32Struct
{
    static sizeof => 504

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    Request {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * System time when the operator request was submitted.
     * @type {SYSTEMTIME}
     */
    Submitted{
        get {
            if(!this.HasProp("__Submitted"))
                this.__Submitted := SYSTEMTIME(this.ptr + 8)
            return this.__Submitted
        }
    }

    /**
     * 
     * @type {Integer}
     */
    State {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Operator message text.
     * @type {String}
     */
    szMessage {
        get => StrGet(this.ptr + 28, 255, "UTF-8")
        set => StrPut(value, this.ptr + 28, 255, "UTF-8")
    }

    /**
     * 
     * @type {Integer}
     */
    Arg1Type {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }

    /**
     * <b>Arg1</b> object ID used for move requests or other operator requests that require a reference object. The purpose of this object varies based on the type of operator request. For appropriate uses of <b>Arg1</b>, see the <b>Request</b> description.
     * @type {Pointer<Guid>}
     */
    Arg1 {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * 
     * @type {Integer}
     */
    Arg2Type {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * <b>Arg2</b> object ID used for operator requests that require a second reference object. The purpose of this object varies based on the type of operator request. For appropriate uses of <b>Arg2</b>, see the <b>Request</b> description.
     * @type {Pointer<Guid>}
     */
    Arg2 {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * Application that submitted the operator request.
     * @type {String}
     */
    szApplication {
        get => StrGet(this.ptr + 312, 63, "UTF-8")
        set => StrPut(value, this.ptr + 312, 63, "UTF-8")
    }

    /**
     * Interactive user logged on to the computer that submitted the operator request.
     * @type {String}
     */
    szUser {
        get => StrGet(this.ptr + 376, 63, "UTF-8")
        set => StrPut(value, this.ptr + 376, 63, "UTF-8")
    }

    /**
     * Computer that submitted the operator request.
     * @type {String}
     */
    szComputer {
        get => StrGet(this.ptr + 440, 63, "UTF-8")
        set => StrPut(value, this.ptr + 440, 63, "UTF-8")
    }
}
