#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardCryptogramMaterialPossessionProof.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the result of calling [TryProvePossessionOfCryptogramMaterialPackageAsync](smartcardcryptogramgenerator_tryprovepossessionofcryptogrammaterialpackageasync_2141877963.md) with a challenge token to prove that the device possesses the identified cryptogram material.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialpossessionproof
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramMaterialPossessionProof extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardCryptogramMaterialPossessionProof

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardCryptogramMaterialPossessionProof.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the operation status of the proof operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialpossessionproof.operationstatus
     * @type {Integer} 
     */
    OperationStatus {
        get => this.get_OperationStatus()
    }

    /**
     * Gets the result of the proof of possession operation. This field is only valid if the OperationStatus field is Success.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialpossessionproof.proof
     * @type {IBuffer} 
     */
    Proof {
        get => this.get_Proof()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OperationStatus() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialPossessionProof")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialPossessionProof.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialPossessionProof := ISmartCardCryptogramMaterialPossessionProof(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialPossessionProof.get_OperationStatus()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Proof() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialPossessionProof")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialPossessionProof.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialPossessionProof := ISmartCardCryptogramMaterialPossessionProof(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialPossessionProof.get_Proof()
    }

;@endregion Instance Methods
}
