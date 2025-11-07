#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class IViewHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewHelper
     * @type {Guid}
     */
    static IID => Guid("{e85ccef5-aaaa-47f0-b5e3-61f7aecdc4c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectedIDs", "GetActiveTopology", "SetActiveTopology", "Commit", "SetConfiguration", "GetProceedOnNewConfiguration"]

    /**
     * 
     * @param {PWSTR} wszAdaptorName 
     * @param {Pointer<Integer>} pulCount 
     * @param {Pointer<Integer>} pulID 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-getconnectedids
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
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-getactivetopology
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
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-setactivetopology
     */
    SetActiveTopology(wszAdaptorName, ulSourceID, ulCount, pulTargetID) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        pulTargetIDMarshal := pulTargetID is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", wszAdaptorName, "uint", ulSourceID, "uint", ulCount, pulTargetIDMarshal, pulTargetID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-commit
     */
    Commit() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pIStream 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-setconfiguration
     */
    SetConfiguration(pIStream) {
        result := ComCall(7, this, "ptr", pIStream, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-getproceedonnewconfiguration
     */
    GetProceedOnNewConfiguration() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
