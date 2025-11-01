#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a CHAP shared secret.
 * @remarks
 * 
  * This structure is used by the following methods: 
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsserviceiscsi-setinitiatorsharedsecret">IVdsServiceIscsi::SetInitiatorSharedSecret</a> sets the shared secret for an iSCSI initiator. If the <b>pSharedSecret</b> member is <b>NULL</b> and the <b>ulSharedSecretSize</b> member is zero, <b>SetInitiatorSharedSecret</b> clears any existing shared secrets.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-setsharedsecret">IVdsIscsiTarget::SetSharedSecret</a> sets the shared secret for an iSCSI target. If the <b>pSharedSecret</b> member is <b>NULL</b> and the <b>ulSharedSecretSize</b> member is zero, <b>SetSharedSecret</b> clears any existing shared secrets.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsserviceiscsi-remembertargetsharedsecret">IVdsServiceIscsi::RememberTargetSharedSecret</a> tells the initiator to remember the secret of the target.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-rememberinitiatorsharedsecret">IVdsIscsiTarget::RememberInitiatorSharedSecret</a> tells the target to remember the secret of the initiator.</li>
  * </ul>
  * For one-way CHAP, the secret is set on the target. The initiator must remember the CHAP secret of the target in order to do a successful login. 
  * 
  * For mutual CHAP, secrets are set on the target and the initiator. To do a successful login, the target and the initiator must remember each other's secrets.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_iscsi_shared_secret
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_SHARED_SECRET extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to an array of bytes that contains the CHAP shared secret. If a shared secret is not necessary, this parameter should be <b>NULL</b>.
     * @type {Pointer<Integer>}
     */
    pSharedSecret {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of bytes in the array that the <b>pSharedSecret</b> member points to. If the <b>pSharedSecret</b> member is <b>NULL</b>, this parameter must be zero. If  <b>pSharedSecret</b> is not <b>NULL</b>, this parameter must be greater than or equal to 12 and less than or equal to 16.
     * @type {Integer}
     */
    ulSharedSecretSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
