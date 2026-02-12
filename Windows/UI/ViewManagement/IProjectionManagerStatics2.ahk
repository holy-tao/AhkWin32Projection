#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IProjectionManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProjectionManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{f33d2f43-2749-4cde-b977-c0c41e7415d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartProjectingWithDeviceInfoAsync", "RequestStartProjectingAsync", "RequestStartProjectingWithPlacementAsync", "GetDeviceSelector"]

    /**
     * 
     * @param {Integer} projectionViewId 
     * @param {Integer} anchorViewId 
     * @param {DeviceInformation} displayDeviceInfo 
     * @returns {IAsyncAction} 
     */
    StartProjectingWithDeviceInfoAsync(projectionViewId, anchorViewId, displayDeviceInfo) {
        result := ComCall(6, this, "int", projectionViewId, "int", anchorViewId, "ptr", displayDeviceInfo, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} projectionViewId 
     * @param {Integer} anchorViewId 
     * @param {RECT} selection 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestStartProjectingAsync(projectionViewId, anchorViewId, selection) {
        result := ComCall(7, this, "int", projectionViewId, "int", anchorViewId, "ptr", selection, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} projectionViewId 
     * @param {Integer} anchorViewId 
     * @param {RECT} selection 
     * @param {Integer} prefferedPlacement 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestStartProjectingWithPlacementAsync(projectionViewId, anchorViewId, selection, prefferedPlacement) {
        result := ComCall(8, this, "int", projectionViewId, "int", anchorViewId, "ptr", selection, "int", prefferedPlacement, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        selector_ := HSTRING()
        result := ComCall(9, this, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }
}
