#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INDCustomData.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Gets custom data from a PlayReady-ND license fetch operation. This custom data is an argument from a PlayReady-ND [LicenseFetchCompleted](ndclient_licensefetchcompleted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indlicensefetchcompletedeventargs
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDLicenseFetchCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDLicenseFetchCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{1ee30a1a-11b2-4558-8865-e3a516922517}")

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
     * Gets custom data from a license fetch response.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indlicensefetchcompletedeventargs.responsecustomdata
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
