#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an identifying value associated with a biometric template.
 * @remarks
 * This structure is used in the following functions:
  * 
  * -   [**WinBioDeleteTemplate**](/windows/desktop/api/Winbio/nf-winbio-winbiodeletetemplate)
  * -   [**WinBioEnrollCommit**](/windows/desktop/api/Winbio/nf-winbio-winbioenrollcommit)
  * -   [**WinBioEnumEnrollments**](/windows/desktop/api/Winbio/nf-winbio-winbioenumenrollments)
  * -   [**WinBioGetCredentialState**](/windows/desktop/api/Winbio/nf-winbio-winbiogetcredentialstate)
  * -   [**WinBioIdentify**](/windows/desktop/api/Winbio/nf-winbio-winbioidentify)
  * -   [**WinBioRemoveCredential**](/windows/desktop/api/Winbio/nf-winbio-winbioremovecredential)
  * -   [**WinBioVerify**](/windows/desktop/api/Winbio/nf-winbio-winbioverify)
  * -   [**WinBioVerifyWithCallback**](/windows/desktop/api/Winbio/nf-winbio-winbioverifywithcallback)
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-identity
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_IDENTITY extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Specifies the format of the identity information contained in this structure. This can be one of the following values:
     * 
     * 
     * 
     * | Value                                                                                                                                                                                         | Meaning                                                                         |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
     * | <span id="WINBIO_ID_TYPE_NULL"></span><span id="winbio_id_type_null"></span><dl> <dt>**WINBIO\_ID\_TYPE\_NULL**</dt> </dl>             | The template has no associated ID.<br/>                                   |
     * | <span id="WINBIO_ID_TYPE_WILDCARD"></span><span id="winbio_id_type_wildcard"></span><dl> <dt>**WINBIO\_ID\_TYPE\_WILDCARD**</dt> </dl> | The structure matches all template identities.<br/>                       |
     * | <span id="WINBIO_ID_TYPE_GUID"></span><span id="winbio_id_type_guid"></span><dl> <dt>**WINBIO\_ID\_TYPE\_GUID**</dt> </dl>             | The structure contains a GUID associated with the template.<br/>          |
     * | <span id="WINBIO_ID_TYPE_SID"></span><span id="winbio_id_type_sid"></span><dl> <dt>**WINBIO\_ID\_TYPE\_SID**</dt> </dl>                | The structure contains the account SID associated with the template.<br/> |
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _AccountSid extends Win32Struct {
        static sizeof => 72
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Size {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        Data{
            get {
                if(!this.HasProp("__DataProxyArray"))
                    this.__DataProxyArray := Win32FixedArray(this.ptr + 4, 68, Primitive, "char")
                return this.__DataProxyArray
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Null {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Wildcard {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    TemplateGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {_AccountSid}
     */
    AccountSid{
        get {
            if(!this.HasProp("__AccountSid"))
                this.__AccountSid := %this.__Class%._AccountSid(this.ptr + 8)
            return this.__AccountSid
        }
    }

    /**
     * @type {Array<Byte>}
     */
    SecureId{
        get {
            if(!this.HasProp("__SecureIdProxyArray"))
                this.__SecureIdProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "char")
            return this.__SecureIdProxyArray
        }
    }
}
