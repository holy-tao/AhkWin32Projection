#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UserActivityAttribution.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivityAttributionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityAttributionFactory
     * @type {Guid}
     */
    static IID => Guid("{e62bd252-c566-4f42-9974-916c4d76377e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithUri"]

    /**
     * 
     * @param {Uri} iconUri 
     * @returns {UserActivityAttribution} 
     */
    CreateWithUri(iconUri) {
        result := ComCall(6, this, "ptr", iconUri, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserActivityAttribution(value)
    }
}
