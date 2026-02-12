#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IContentPrefetcherTime extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPrefetcherTime
     * @type {Guid}
     */
    static IID => Guid("{e361fd08-132a-4fde-a7cc-fcb0e66523af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LastSuccessfulPrefetchTime"]

    /**
     * @type {IReference<DateTime>} 
     */
    LastSuccessfulPrefetchTime {
        get => this.get_LastSuccessfulPrefetchTime()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_LastSuccessfulPrefetchTime() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }
}
