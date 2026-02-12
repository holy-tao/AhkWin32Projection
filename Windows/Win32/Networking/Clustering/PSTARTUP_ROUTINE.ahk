#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Loads a resource DLL, returning a structure containing a function table and a version number.
 * @remarks
 * The <i>Startup</i> entry-point function returns a function table 
 *      that describes both the supported interface version of the Resource API and the entry points for all other 
 *      functions required by the supported version of the Resource API.
 * 
 * At present, only Resource API version 1.0 is supported.
 * 
 * If your resource supports more than one version of the Resource API, return a function table for the latest 
 *      version. The version number should be less than or equal to the <i>MaxVersionSupported</i> 
 *      parameter. If the version of the function table pointed to by the <i>FunctionTable</i> 
 *      parameter is not within range, your resource cannot be loaded successfully.
 * 
 * For more information see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-startup">Implementing Startup</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-pstartup_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PSTARTUP_ROUTINE extends IUnknown {

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
     * @param {PWSTR} ResourceType_ 
     * @param {Integer} MinVersionSupported 
     * @param {Integer} MaxVersionSupported 
     * @param {Pointer<PSET_RESOURCE_STATUS_ROUTINE>} SetResourceStatus 
     * @param {Pointer<PLOG_EVENT_ROUTINE>} LogEvent 
     * @param {Pointer<Pointer<CLRES_FUNCTION_TABLE>>} FunctionTable 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ResourceType_, MinVersionSupported, MaxVersionSupported, SetResourceStatus, LogEvent, FunctionTable) {
        ResourceType_ := ResourceType_ is String ? StrPtr(ResourceType_) : ResourceType_

        FunctionTableMarshal := FunctionTable is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", ResourceType_, "uint", MinVersionSupported, "uint", MaxVersionSupported, "ptr", SetResourceStatus, "ptr", LogEvent, FunctionTableMarshal, FunctionTable, "uint")
        return result
    }
}
