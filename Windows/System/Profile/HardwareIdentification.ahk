#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHardwareIdentificationStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to obtain a hardware identifier that represents the current hardware.
 * @remarks
 * See [Guidance on using the App Specific Hardware ID (ASHWID) to implement per-device app logic](/previous-versions/windows/apps/jj553431(v=win.10)) for more information.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.hardwareidentification
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class HardwareIdentification extends IInspectable {
;@region Static Methods
    /**
     * Gets a hardware identifier (**ASHWID**) that represents the current hardware. The returned **ASHWID** will be different for each application package. In other words, this API will return different identifiers when called by two apps from different packages. It will return the same identifier when called by two apps that are part of the same package.
     * @remarks
     * The GetPackageSpecificToken is designed for use by professional developers who have experience with licensing content and with sufficient expertise in cryptography
     * @param {IBuffer} nonce The cryptographic *nonce* is optional. The *nonce* is recommended when **ASHWID** needs to be verified on the cloud against replay attacks. In the scenarios where nonce is desired, the remote server should generate a random nonce and pass it to the client app, and then verify that the signature has the expected nonce once the **ASHWID** is received from the client system.
     * @returns {HardwareToken} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.hardwareidentification.getpackagespecifictoken
     */
    static GetPackageSpecificToken(nonce) {
        if (!HardwareIdentification.HasProp("__IHardwareIdentificationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.HardwareIdentification")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHardwareIdentificationStatics.IID)
            HardwareIdentification.__IHardwareIdentificationStatics := IHardwareIdentificationStatics(factoryPtr)
        }

        return HardwareIdentification.__IHardwareIdentificationStatics.GetPackageSpecificToken(nonce)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
