#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INDCustomData.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the result of the PlayReady-ND license fetch.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indlicensefetchresult
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDLicenseFetchResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDLicenseFetchResult
     * @type {Guid}
     */
    static IID => Guid("{21d39698-aa62-45ff-a5ff-8037e5433825}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResponseCustomData"]

    /**
     * Gets the custom data from a license fetch response.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indlicensefetchresult.responsecustomdata
     * @type {INDCustomData} 
     */
    ResponseCustomData {
        get => this.get_ResponseCustomData()
    }

    /**
     * 
     * @returns {INDCustomData} 
     */
    get_ResponseCustomData() {
        result := ComCall(6, this, "ptr*", &customData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INDCustomData(customData)
    }
}
