#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The POPEN_ROUTINE callback function opens a resource. The POPEN_ROUTINE type defines a pointer to this function.
 * @remarks
 * The <i>Open</i> entry-point function opens a resource with the name 
 *      identified by the <i>ResourceName</i> parameter and returns its resource identifier. The 
 *      resource identifier can be used in future calls to other 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-api">Resource API</a> entry points to identify the resource.
 * 
 * Never close the handle represented by the <i>ResourceHandle</i> parameter or use it for any 
 *      purpose other than passing it to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> 
 *      through either the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> callback function or the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_status_routine">SetResourceStatus</a> callback function.
 * 
 * For effective implementation strategies of the <i>Open</i> 
 *      entry-point function, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-open">Implementing Open</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-popen_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class POPEN_ROUTINE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {PWSTR} ResourceName 
     * @param {HKEY} ResourceKey 
     * @param {Pointer} ResourceHandle 
     * @returns {Pointer<Void>} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ResourceName, ResourceKey, ResourceHandle) {
        ResourceName := ResourceName is String ? StrPtr(ResourceName) : ResourceName
        ResourceKey := ResourceKey is Win32Handle ? NumGet(ResourceKey, "ptr") : ResourceKey

        result := ComCall(3, this, "ptr", ResourceName, "ptr", ResourceKey, "ptr", ResourceHandle, "ptr")
        return result
    }
}
