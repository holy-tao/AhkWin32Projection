#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INDCustomData.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Retrieves and sets properties used for fetching a PlayReady-ND license.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indlicensefetchdescriptor
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDLicenseFetchDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDLicenseFetchDescriptor
     * @type {Guid}
     */
    static IID => Guid("{5498d33a-e686-4935-a567-7ca77ad20fa4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentIDType", "get_ContentID", "get_LicenseFetchChallengeCustomData", "put_LicenseFetchChallengeCustomData"]

    /**
     * Gets the type of the content identifier used for fetching a license.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indlicensefetchdescriptor.contentidtype
     * @type {Integer} 
     */
    ContentIDType {
        get => this.get_ContentIDType()
    }

    /**
     * Gets the content identifier used for fetching a license.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indlicensefetchdescriptor.contentid
     */
    ContentID {
        get => this.get_ContentID()
    }

    /**
     * Gets or sets custom data for a license fetch challenge.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indlicensefetchdescriptor.licensefetchchallengecustomdata
     * @type {INDCustomData} 
     */
    LicenseFetchChallengeCustomData {
        get => this.get_LicenseFetchChallengeCustomData()
        set => this.put_LicenseFetchChallengeCustomData(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentIDType() {
        result := ComCall(6, this, "int*", &contentIDType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return contentIDType
    }

    /**
     * 
     * @param {Pointer<Pointer>} contentIDBytes 
     * @returns {HRESULT} 
     */
    get_ContentID(contentIDBytes) {
        result := ComCall(7, this, "ptr", contentIDBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {INDCustomData} 
     */
    get_LicenseFetchChallengeCustomData() {
        result := ComCall(8, this, "ptr*", &licenseFetchChallengeCustomData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INDCustomData(licenseFetchChallengeCustomData)
    }

    /**
     * 
     * @param {INDCustomData} licenseFetchChallengeCustomData 
     * @returns {HRESULT} 
     */
    put_LicenseFetchChallengeCustomData(licenseFetchChallengeCustomData) {
        result := ComCall(9, this, "ptr", licenseFetchChallengeCustomData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
