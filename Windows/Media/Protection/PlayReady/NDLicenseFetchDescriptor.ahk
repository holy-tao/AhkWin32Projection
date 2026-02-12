#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INDLicenseFetchDescriptor.ahk
#Include .\INDLicenseFetchDescriptorFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Retrieves and sets properties used for fetching a PlayReady-ND license.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndlicensefetchdescriptor
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDLicenseFetchDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INDLicenseFetchDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INDLicenseFetchDescriptor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} contentIDType 
     * @param {Integer} contentIDBytes_length 
     * @param {Pointer<Integer>} contentIDBytes 
     * @param {INDCustomData} licenseFetchChallengeCustomData 
     * @returns {NDLicenseFetchDescriptor} 
     */
    static CreateInstance(contentIDType, contentIDBytes_length, contentIDBytes, licenseFetchChallengeCustomData) {
        if (!NDLicenseFetchDescriptor.HasProp("__INDLicenseFetchDescriptorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.NDLicenseFetchDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INDLicenseFetchDescriptorFactory.IID)
            NDLicenseFetchDescriptor.__INDLicenseFetchDescriptorFactory := INDLicenseFetchDescriptorFactory(factoryPtr)
        }

        return NDLicenseFetchDescriptor.__INDLicenseFetchDescriptorFactory.CreateInstance(contentIDType, contentIDBytes_length, contentIDBytes, licenseFetchChallengeCustomData)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the type of the content identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndlicensefetchdescriptor.contentidtype
     * @type {Integer} 
     */
    ContentIDType {
        get => this.get_ContentIDType()
    }

    /**
     * Gets the content identifer.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndlicensefetchdescriptor.contentid
     */
    ContentID {
        get => this.get_ContentID()
    }

    /**
     * Gets or sets custom data for a license fetch challenge.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndlicensefetchdescriptor.licensefetchchallengecustomdata
     * @type {INDCustomData} 
     */
    LicenseFetchChallengeCustomData {
        get => this.get_LicenseFetchChallengeCustomData()
        set => this.put_LicenseFetchChallengeCustomData(value)
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
    get_ContentIDType() {
        if (!this.HasProp("__INDLicenseFetchDescriptor")) {
            if ((queryResult := this.QueryInterface(INDLicenseFetchDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDLicenseFetchDescriptor := INDLicenseFetchDescriptor(outPtr)
        }

        return this.__INDLicenseFetchDescriptor.get_ContentIDType()
    }

    /**
     * 
     * @param {Pointer<Pointer>} contentIDBytes 
     * @returns {HRESULT} 
     */
    get_ContentID(contentIDBytes) {
        if (!this.HasProp("__INDLicenseFetchDescriptor")) {
            if ((queryResult := this.QueryInterface(INDLicenseFetchDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDLicenseFetchDescriptor := INDLicenseFetchDescriptor(outPtr)
        }

        return this.__INDLicenseFetchDescriptor.get_ContentID(contentIDBytes)
    }

    /**
     * 
     * @returns {INDCustomData} 
     */
    get_LicenseFetchChallengeCustomData() {
        if (!this.HasProp("__INDLicenseFetchDescriptor")) {
            if ((queryResult := this.QueryInterface(INDLicenseFetchDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDLicenseFetchDescriptor := INDLicenseFetchDescriptor(outPtr)
        }

        return this.__INDLicenseFetchDescriptor.get_LicenseFetchChallengeCustomData()
    }

    /**
     * 
     * @param {INDCustomData} licenseFetchChallengeCustomData 
     * @returns {HRESULT} 
     */
    put_LicenseFetchChallengeCustomData(licenseFetchChallengeCustomData) {
        if (!this.HasProp("__INDLicenseFetchDescriptor")) {
            if ((queryResult := this.QueryInterface(INDLicenseFetchDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDLicenseFetchDescriptor := INDLicenseFetchDescriptor(outPtr)
        }

        return this.__INDLicenseFetchDescriptor.put_LicenseFetchChallengeCustomData(licenseFetchChallengeCustomData)
    }

;@endregion Instance Methods
}
