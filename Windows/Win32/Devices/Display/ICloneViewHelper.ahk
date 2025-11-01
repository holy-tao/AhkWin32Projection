#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class ICloneViewHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICloneViewHelper
     * @type {Guid}
     */
    static IID => Guid("{f6a3d4c4-5632-4d83-b0a1-fb88712b1eb7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectedIDs", "GetActiveTopology", "SetActiveTopology", "Commit"]

    /**
     * 
     * @param {PWSTR} wszAdaptorName 
     * @param {Pointer<Integer>} pulCount 
     * @param {Pointer<Integer>} pulID 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    GetConnectedIDs(wszAdaptorName, pulCount, pulID, ulFlags) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"
        pulIDMarshal := pulID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", wszAdaptorName, pulCountMarshal, pulCount, pulIDMarshal, pulID, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszAdaptorName 
     * @param {Integer} ulSourceID 
     * @param {Pointer<Integer>} pulCount 
     * @param {Pointer<Integer>} pulTargetID 
     * @returns {HRESULT} 
     */
    GetActiveTopology(wszAdaptorName, ulSourceID, pulCount, pulTargetID) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"
        pulTargetIDMarshal := pulTargetID is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", wszAdaptorName, "uint", ulSourceID, pulCountMarshal, pulCount, pulTargetIDMarshal, pulTargetID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszAdaptorName 
     * @param {Integer} ulSourceID 
     * @param {Integer} ulCount 
     * @param {Pointer<Integer>} pulTargetID 
     * @returns {HRESULT} 
     */
    SetActiveTopology(wszAdaptorName, ulSourceID, ulCount, pulTargetID) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        pulTargetIDMarshal := pulTargetID is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", wszAdaptorName, "uint", ulSourceID, "uint", ulCount, pulTargetIDMarshal, pulTargetID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFinalCall 
     * @returns {HRESULT} 
     */
    Commit(fFinalCall) {
        result := ComCall(6, this, "int", fFinalCall, "HRESULT")
        return result
    }
}
