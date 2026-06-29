#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_ANTI_SPOOF_POLICY_ACTION.ahk" { WINBIO_ANTI_SPOOF_POLICY_ACTION }

/**
 * Contains either a default or account-specific antispoofing policy.
 * @remarks
 * See the discussion of the [**EngineAdapterSetAccountPolicy**](/windows/desktop/api/Winbio_adapter/nc-winbio_adapter-pibio_engine_set_account_policy_fn) method for a description of how this structure is used.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-account-policy
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_ACCOUNT_POLICY {
    #StructPack 4

    /**
     * A [**WINBIO\_IDENTITY**](winbio-identity.md) structure that specifies the account information.
     */
    Identity : WINBIO_IDENTITY

    /**
     * One of the [**WINBIO\_ANTI\_SPOOF\_POLICY\_ACTION**](winbio-anti-spoof-policy-action.md) enumeration values that specifies what antispoofing policy action to use for the account.
     */
    AntiSpoofBehavior : WINBIO_ANTI_SPOOF_POLICY_ACTION

}
