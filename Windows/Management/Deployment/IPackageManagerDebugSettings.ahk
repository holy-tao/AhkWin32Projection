#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageManagerDebugSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManagerDebugSettings
     * @type {Guid}
     */
    static IID => Guid("{1a611683-a988-4fcf-8f0f-ce175898e8eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContentGroupStateAsync", "SetContentGroupStateWithPercentageAsync"]

    /**
     * 
     * @param {Package} package_ 
     * @param {HSTRING} contentGroupName 
     * @param {Integer} state 
     * @returns {IAsyncAction} 
     */
    SetContentGroupStateAsync(package_, contentGroupName, state) {
        if(contentGroupName is String) {
            pin := HSTRING.Create(contentGroupName)
            contentGroupName := pin.Value
        }
        contentGroupName := contentGroupName is Win32Handle ? NumGet(contentGroupName, "ptr") : contentGroupName

        result := ComCall(6, this, "ptr", package_, "ptr", contentGroupName, "int", state, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {Package} package_ 
     * @param {HSTRING} contentGroupName 
     * @param {Integer} state 
     * @param {Float} completionPercentage 
     * @returns {IAsyncAction} 
     */
    SetContentGroupStateWithPercentageAsync(package_, contentGroupName, state, completionPercentage) {
        if(contentGroupName is String) {
            pin := HSTRING.Create(contentGroupName)
            contentGroupName := pin.Value
        }
        contentGroupName := contentGroupName is Win32Handle ? NumGet(contentGroupName, "ptr") : contentGroupName

        result := ComCall(7, this, "ptr", package_, "ptr", contentGroupName, "int", state, "double", completionPercentage, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }
}
