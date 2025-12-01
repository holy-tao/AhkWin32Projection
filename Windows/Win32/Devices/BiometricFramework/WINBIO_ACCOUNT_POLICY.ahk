#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_IDENTITY.ahk

/**
 * Contains either a default or account-specific antispoofing policy.
 * @remarks
 * See the discussion of the [**EngineAdapterSetAccountPolicy**](/windows/desktop/api/Winbio_adapter/nc-winbio_adapter-pibio_engine_set_account_policy_fn) method for a description of how this structure is used.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-account-policy
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_ACCOUNT_POLICY extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A [**WINBIO\_IDENTITY**](winbio-identity.md) structure that specifies the account information.
     * @type {WINBIO_IDENTITY}
     */
    Identity{
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := WINBIO_IDENTITY(0, this)
            return this.__Identity
        }
    }

    /**
     * One of the [**WINBIO\_ANTI\_SPOOF\_POLICY\_ACTION**](winbio-anti-spoof-policy-action.md) enumeration values that specifies what antispoofing policy action to use for the account.
     * @type {Integer}
     */
    AntiSpoofBehavior {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }
}
