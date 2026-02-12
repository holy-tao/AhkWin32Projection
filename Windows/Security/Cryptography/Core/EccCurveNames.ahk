#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEccCurveNamesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains static properties that enable you to retrieve supported elliptic curve cryptography (ECC) algorithm names.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class EccCurveNames extends IInspectable {
;@region Static Properties
    /**
     * Retrieves a string that contains "BRAINPOOLP160R1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp160r1
     * @type {HSTRING} 
     */
    static BrainpoolP160r1 {
        get => EccCurveNames.get_BrainpoolP160r1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP160T1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp160t1
     * @type {HSTRING} 
     */
    static BrainpoolP160t1 {
        get => EccCurveNames.get_BrainpoolP160t1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP192R1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp192r1
     * @type {HSTRING} 
     */
    static BrainpoolP192r1 {
        get => EccCurveNames.get_BrainpoolP192r1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP192T1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp192t1
     * @type {HSTRING} 
     */
    static BrainpoolP192t1 {
        get => EccCurveNames.get_BrainpoolP192t1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP224R1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp224r1
     * @type {HSTRING} 
     */
    static BrainpoolP224r1 {
        get => EccCurveNames.get_BrainpoolP224r1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP224T1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp224t1
     * @type {HSTRING} 
     */
    static BrainpoolP224t1 {
        get => EccCurveNames.get_BrainpoolP224t1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP256R1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp256r1
     * @type {HSTRING} 
     */
    static BrainpoolP256r1 {
        get => EccCurveNames.get_BrainpoolP256r1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP256T1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp256t1
     * @type {HSTRING} 
     */
    static BrainpoolP256t1 {
        get => EccCurveNames.get_BrainpoolP256t1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP320R1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp320r1
     * @type {HSTRING} 
     */
    static BrainpoolP320r1 {
        get => EccCurveNames.get_BrainpoolP320r1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP320T1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp320t1
     * @type {HSTRING} 
     */
    static BrainpoolP320t1 {
        get => EccCurveNames.get_BrainpoolP320t1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP384R1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp384r1
     * @type {HSTRING} 
     */
    static BrainpoolP384r1 {
        get => EccCurveNames.get_BrainpoolP384r1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP384T1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp384t1
     * @type {HSTRING} 
     */
    static BrainpoolP384t1 {
        get => EccCurveNames.get_BrainpoolP384t1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP512R1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp512r1
     * @type {HSTRING} 
     */
    static BrainpoolP512r1 {
        get => EccCurveNames.get_BrainpoolP512r1()
    }

    /**
     * Retrieves a string that contains "BRAINPOOLP512T1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.brainpoolp512t1
     * @type {HSTRING} 
     */
    static BrainpoolP512t1 {
        get => EccCurveNames.get_BrainpoolP512t1()
    }

    /**
     * Retrieves a string that contains "CURVE25519".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.curve25519
     * @type {HSTRING} 
     */
    static Curve25519 {
        get => EccCurveNames.get_Curve25519()
    }

    /**
     * Retrieves a string that contains "EC192WAPI".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.ec192wapi
     * @type {HSTRING} 
     */
    static Ec192wapi {
        get => EccCurveNames.get_Ec192wapi()
    }

    /**
     * Retrieves a string that contains "NISTP192".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.nistp192
     * @type {HSTRING} 
     */
    static NistP192 {
        get => EccCurveNames.get_NistP192()
    }

    /**
     * Retrieves a string that contains "NISTP224".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.nistp224
     * @type {HSTRING} 
     */
    static NistP224 {
        get => EccCurveNames.get_NistP224()
    }

    /**
     * Retrieves a string that contains "NISTP256".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.nistp256
     * @type {HSTRING} 
     */
    static NistP256 {
        get => EccCurveNames.get_NistP256()
    }

    /**
     * Retrieves a string that contains "NISTP384".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.nistp384
     * @type {HSTRING} 
     */
    static NistP384 {
        get => EccCurveNames.get_NistP384()
    }

    /**
     * Retrieves a string that contains "NISTP521".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.nistp521
     * @type {HSTRING} 
     */
    static NistP521 {
        get => EccCurveNames.get_NistP521()
    }

    /**
     * Retrieves a string that contains "NUMSP256T1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.numsp256t1
     * @type {HSTRING} 
     */
    static NumsP256t1 {
        get => EccCurveNames.get_NumsP256t1()
    }

    /**
     * Retrieves a string that contains "NUMSP384T1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.numsp384t1
     * @type {HSTRING} 
     */
    static NumsP384t1 {
        get => EccCurveNames.get_NumsP384t1()
    }

    /**
     * Retrieves a string that contains "NUMSP512T1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.numsp512t1
     * @type {HSTRING} 
     */
    static NumsP512t1 {
        get => EccCurveNames.get_NumsP512t1()
    }

    /**
     * Retrieves a string that contains "SECP160K1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp160k1
     * @type {HSTRING} 
     */
    static SecP160k1 {
        get => EccCurveNames.get_SecP160k1()
    }

    /**
     * Retrieves a string that contains "SECP160R1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp160r1
     * @type {HSTRING} 
     */
    static SecP160r1 {
        get => EccCurveNames.get_SecP160r1()
    }

    /**
     * Retrieves a string that contains "SECP160R2".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp160r2
     * @type {HSTRING} 
     */
    static SecP160r2 {
        get => EccCurveNames.get_SecP160r2()
    }

    /**
     * Retrieves a string that contains "SECP192K1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp192k1
     * @type {HSTRING} 
     */
    static SecP192k1 {
        get => EccCurveNames.get_SecP192k1()
    }

    /**
     * Retrieves a string that contains "SECP192R1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp192r1
     * @type {HSTRING} 
     */
    static SecP192r1 {
        get => EccCurveNames.get_SecP192r1()
    }

    /**
     * Retrieves a string that contains "SECP224K1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp224k1
     * @type {HSTRING} 
     */
    static SecP224k1 {
        get => EccCurveNames.get_SecP224k1()
    }

    /**
     * Retrieves a string that contains "SECP224R1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp224r1
     * @type {HSTRING} 
     */
    static SecP224r1 {
        get => EccCurveNames.get_SecP224r1()
    }

    /**
     * Retrieves a string that contains "SecP256k1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp256k1
     * @type {HSTRING} 
     */
    static SecP256k1 {
        get => EccCurveNames.get_SecP256k1()
    }

    /**
     * Retrieves a string that contains "SecP256r1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp256r1
     * @type {HSTRING} 
     */
    static SecP256r1 {
        get => EccCurveNames.get_SecP256r1()
    }

    /**
     * Retrieves a string that contains "SecP384r1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp384r1
     * @type {HSTRING} 
     */
    static SecP384r1 {
        get => EccCurveNames.get_SecP384r1()
    }

    /**
     * Retrieves a string that contains "SecP521r1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.secp521r1
     * @type {HSTRING} 
     */
    static SecP521r1 {
        get => EccCurveNames.get_SecP521r1()
    }

    /**
     * Retrieves a string that contains "WTLS7".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.wtls7
     * @type {HSTRING} 
     */
    static Wtls7 {
        get => EccCurveNames.get_Wtls7()
    }

    /**
     * Retrieves a string that contains "WTLS9".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.wtls9
     * @type {HSTRING} 
     */
    static Wtls9 {
        get => EccCurveNames.get_Wtls9()
    }

    /**
     * Retrieves a string that contains "WTLS12".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.wtls12
     * @type {HSTRING} 
     */
    static Wtls12 {
        get => EccCurveNames.get_Wtls12()
    }

    /**
     * Retrieves a string that contains "X962P192v1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.x962p192v1
     * @type {HSTRING} 
     */
    static X962P192v1 {
        get => EccCurveNames.get_X962P192v1()
    }

    /**
     * Retrieves a string that contains "X962P192v2".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.x962p192v2
     * @type {HSTRING} 
     */
    static X962P192v2 {
        get => EccCurveNames.get_X962P192v2()
    }

    /**
     * Retrieves a string that contains "X962P192v3".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.x962p192v3
     * @type {HSTRING} 
     */
    static X962P192v3 {
        get => EccCurveNames.get_X962P192v3()
    }

    /**
     * Retrieves a string that contains "X962P239v1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.x962p239v1
     * @type {HSTRING} 
     */
    static X962P239v1 {
        get => EccCurveNames.get_X962P239v1()
    }

    /**
     * Retrieves a string that contains "X962P239v2".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.x962p239v2
     * @type {HSTRING} 
     */
    static X962P239v2 {
        get => EccCurveNames.get_X962P239v2()
    }

    /**
     * Retrieves a string that contains "X962P239v3".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.x962p239v3
     * @type {HSTRING} 
     */
    static X962P239v3 {
        get => EccCurveNames.get_X962P239v3()
    }

    /**
     * Retrieves a string that contains "X962P256v1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.x962p256v1
     * @type {HSTRING} 
     */
    static X962P256v1 {
        get => EccCurveNames.get_X962P256v1()
    }

    /**
     * Gets an array of strings that represents all the curves registered on the local computer. This includes curves that were registered by the local administrator.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.ecccurvenames.allecccurvenames
     * @type {IVectorView<HSTRING>} 
     */
    static AllEccCurveNames {
        get => EccCurveNames.get_AllEccCurveNames()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP160r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP160r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP160t1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP160t1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP192r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP192r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP192t1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP192t1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP224r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP224r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP224t1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP224t1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP256r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP256r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP256t1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP256t1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP320r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP320r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP320t1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP320t1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP384r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP384r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP384t1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP384t1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP512r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP512r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BrainpoolP512t1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_BrainpoolP512t1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Curve25519() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_Curve25519()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ec192wapi() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_Ec192wapi()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NistP192() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_NistP192()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NistP224() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_NistP224()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NistP256() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_NistP256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NistP384() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_NistP384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NistP521() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_NistP521()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NumsP256t1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_NumsP256t1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NumsP384t1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_NumsP384t1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NumsP512t1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_NumsP512t1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP160k1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP160k1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP160r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP160r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP160r2() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP160r2()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP192k1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP192k1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP192r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP192r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP224k1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP224k1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP224r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP224r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP256k1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP256k1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP256r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP256r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP384r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP384r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SecP521r1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_SecP521r1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Wtls7() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_Wtls7()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Wtls9() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_Wtls9()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Wtls12() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_Wtls12()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_X962P192v1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_X962P192v1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_X962P192v2() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_X962P192v2()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_X962P192v3() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_X962P192v3()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_X962P239v1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_X962P239v1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_X962P239v2() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_X962P239v2()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_X962P239v3() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_X962P239v3()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_X962P256v1() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_X962P256v1()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static get_AllEccCurveNames() {
        if (!EccCurveNames.HasProp("__IEccCurveNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.EccCurveNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEccCurveNamesStatics.IID)
            EccCurveNames.__IEccCurveNamesStatics := IEccCurveNamesStatics(factoryPtr)
        }

        return EccCurveNames.__IEccCurveNamesStatics.get_AllEccCurveNames()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
