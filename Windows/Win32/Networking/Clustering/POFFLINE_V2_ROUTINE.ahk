#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The POFFLINE_V2_ROUTINE callback function marks a resource as unavailable for use after cleanup processing is complete.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-poffline_v2_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class POFFLINE_V2_ROUTINE extends IUnknown {

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
     * @param {Pointer<Void>} Resource 
     * @param {PWSTR} DestinationNodeName 
     * @param {Integer} OfflineFlags 
     * @param {Pointer} InBuffer 
     * @param {Integer} InBufferSize 
     * @param {Integer} Reserved 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Resource, DestinationNodeName, OfflineFlags, InBuffer, InBufferSize, Reserved) {
        DestinationNodeName := DestinationNodeName is String ? StrPtr(DestinationNodeName) : DestinationNodeName

        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, ResourceMarshal, Resource, "ptr", DestinationNodeName, "uint", OfflineFlags, "ptr", InBuffer, "uint", InBufferSize, "uint", Reserved, "uint")
        return result
    }
}
