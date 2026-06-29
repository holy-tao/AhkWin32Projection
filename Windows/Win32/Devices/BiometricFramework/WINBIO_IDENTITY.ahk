#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

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
 */
export default struct WINBIO_IDENTITY {
    #StructPack 4


    struct _Value {

        struct _AccountSid {
            Size : UInt32

            Data : Int8[68]

        }

        Null : UInt32

        static __New() {
            DefineProp(this.Prototype, 'Wildcard', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'TemplateGuid', { type: Guid, offset: 0 })
            DefineProp(this.Prototype, 'AccountSid', { type: WINBIO_IDENTITY._Value._AccountSid, offset: 0 })
            DefineProp(this.Prototype, 'SecureId', { type: Int8[32], offset: 0 })
            this.DeleteProp("__New")
        }
    }

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
     */
    Type : UInt32

    /**
     * A union that can contain one of the following values:
     */
    Value : WINBIO_IDENTITY._Value

}
