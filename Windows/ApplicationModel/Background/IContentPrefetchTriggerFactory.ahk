#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ContentPrefetchTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IContentPrefetchTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPrefetchTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{c2643eda-8a03-409e-b8c4-88814c28ccb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {TimeSpan} waitInterval 
     * @returns {ContentPrefetchTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(waitInterval) {
        result := ComCall(6, this, "ptr", waitInterval, "ptr*", &trigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContentPrefetchTrigger(trigger)
    }
}
