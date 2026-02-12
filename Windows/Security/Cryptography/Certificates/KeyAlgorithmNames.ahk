#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyAlgorithmNamesStatics2.ahk
#Include .\IKeyAlgorithmNamesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines several commonly used public key algorithm names. You can use this class in the [KeyAlgorithmName](certificaterequestproperties_keyalgorithmname.md) property on the [CertificateRequestProperties](certificaterequestproperties.md) class.
 * @remarks
 * This class contains only static properties. You do not have to create an instance of the class to retrieve the properties. Instead, use the class name followed by the dot operator (.), followed by the property name.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class KeyAlgorithmNames extends IInspectable {
;@region Static Properties
    /**
     * Returns "ECDSA" as the key algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames.ecdsa
     * @type {HSTRING} 
     */
    static Ecdsa {
        get => KeyAlgorithmNames.get_Ecdsa()
    }

    /**
     * Returns "ECDH" as the key algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames.ecdh
     * @type {HSTRING} 
     */
    static Ecdh {
        get => KeyAlgorithmNames.get_Ecdh()
    }

    /**
     * Returns "RSA" as the key algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames.rsa
     * @type {HSTRING} 
     */
    static Rsa {
        get => KeyAlgorithmNames.get_Rsa()
    }

    /**
     * Returns "DSA" as the key algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames.dsa
     * @type {HSTRING} 
     */
    static Dsa {
        get => KeyAlgorithmNames.get_Dsa()
    }

    /**
     * Returns "ECDH256" as the key algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames.ecdh256
     * @type {HSTRING} 
     */
    static Ecdh256 {
        get => KeyAlgorithmNames.get_Ecdh256()
    }

    /**
     * Returns "ECDH384" as the key algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames.ecdh384
     * @type {HSTRING} 
     */
    static Ecdh384 {
        get => KeyAlgorithmNames.get_Ecdh384()
    }

    /**
     * Returns "ECDH521" as the key algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames.ecdh521
     * @type {HSTRING} 
     */
    static Ecdh521 {
        get => KeyAlgorithmNames.get_Ecdh521()
    }

    /**
     * Returns "ECDSA256" as the key algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames.ecdsa256
     * @type {HSTRING} 
     */
    static Ecdsa256 {
        get => KeyAlgorithmNames.get_Ecdsa256()
    }

    /**
     * Returns "ECDSA384" as the key algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames.ecdsa384
     * @type {HSTRING} 
     */
    static Ecdsa384 {
        get => KeyAlgorithmNames.get_Ecdsa384()
    }

    /**
     * Returns "ECDSA521" as the key algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyalgorithmnames.ecdsa521
     * @type {HSTRING} 
     */
    static Ecdsa521 {
        get => KeyAlgorithmNames.get_Ecdsa521()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ecdsa() {
        if (!KeyAlgorithmNames.HasProp("__IKeyAlgorithmNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAlgorithmNamesStatics2.IID)
            KeyAlgorithmNames.__IKeyAlgorithmNamesStatics2 := IKeyAlgorithmNamesStatics2(factoryPtr)
        }

        return KeyAlgorithmNames.__IKeyAlgorithmNamesStatics2.get_Ecdsa()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ecdh() {
        if (!KeyAlgorithmNames.HasProp("__IKeyAlgorithmNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAlgorithmNamesStatics2.IID)
            KeyAlgorithmNames.__IKeyAlgorithmNamesStatics2 := IKeyAlgorithmNamesStatics2(factoryPtr)
        }

        return KeyAlgorithmNames.__IKeyAlgorithmNamesStatics2.get_Ecdh()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Rsa() {
        if (!KeyAlgorithmNames.HasProp("__IKeyAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAlgorithmNamesStatics.IID)
            KeyAlgorithmNames.__IKeyAlgorithmNamesStatics := IKeyAlgorithmNamesStatics(factoryPtr)
        }

        return KeyAlgorithmNames.__IKeyAlgorithmNamesStatics.get_Rsa()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Dsa() {
        if (!KeyAlgorithmNames.HasProp("__IKeyAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAlgorithmNamesStatics.IID)
            KeyAlgorithmNames.__IKeyAlgorithmNamesStatics := IKeyAlgorithmNamesStatics(factoryPtr)
        }

        return KeyAlgorithmNames.__IKeyAlgorithmNamesStatics.get_Dsa()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ecdh256() {
        if (!KeyAlgorithmNames.HasProp("__IKeyAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAlgorithmNamesStatics.IID)
            KeyAlgorithmNames.__IKeyAlgorithmNamesStatics := IKeyAlgorithmNamesStatics(factoryPtr)
        }

        return KeyAlgorithmNames.__IKeyAlgorithmNamesStatics.get_Ecdh256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ecdh384() {
        if (!KeyAlgorithmNames.HasProp("__IKeyAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAlgorithmNamesStatics.IID)
            KeyAlgorithmNames.__IKeyAlgorithmNamesStatics := IKeyAlgorithmNamesStatics(factoryPtr)
        }

        return KeyAlgorithmNames.__IKeyAlgorithmNamesStatics.get_Ecdh384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ecdh521() {
        if (!KeyAlgorithmNames.HasProp("__IKeyAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAlgorithmNamesStatics.IID)
            KeyAlgorithmNames.__IKeyAlgorithmNamesStatics := IKeyAlgorithmNamesStatics(factoryPtr)
        }

        return KeyAlgorithmNames.__IKeyAlgorithmNamesStatics.get_Ecdh521()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ecdsa256() {
        if (!KeyAlgorithmNames.HasProp("__IKeyAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAlgorithmNamesStatics.IID)
            KeyAlgorithmNames.__IKeyAlgorithmNamesStatics := IKeyAlgorithmNamesStatics(factoryPtr)
        }

        return KeyAlgorithmNames.__IKeyAlgorithmNamesStatics.get_Ecdsa256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ecdsa384() {
        if (!KeyAlgorithmNames.HasProp("__IKeyAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAlgorithmNamesStatics.IID)
            KeyAlgorithmNames.__IKeyAlgorithmNamesStatics := IKeyAlgorithmNamesStatics(factoryPtr)
        }

        return KeyAlgorithmNames.__IKeyAlgorithmNamesStatics.get_Ecdsa384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ecdsa521() {
        if (!KeyAlgorithmNames.HasProp("__IKeyAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAlgorithmNamesStatics.IID)
            KeyAlgorithmNames.__IKeyAlgorithmNamesStatics := IKeyAlgorithmNamesStatics(factoryPtr)
        }

        return KeyAlgorithmNames.__IKeyAlgorithmNamesStatics.get_Ecdsa521()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
