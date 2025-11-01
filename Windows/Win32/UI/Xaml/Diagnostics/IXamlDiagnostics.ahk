#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a XAML Diagnostics session.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/nn-xamlom-ixamldiagnostics
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class IXamlDiagnostics extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlDiagnostics
     * @type {Guid}
     */
    static IID => Guid("{18c9e2b6-3f43-4116-9f2b-ff935d7770d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDispatcher", "GetUiLayer", "GetApplication", "GetIInspectableFromHandle", "GetHandleFromIInspectable", "HitTest", "RegisterInstance", "GetInitializationData"]

    /**
     * 
     * @param {Pointer<IInspectable>} ppDispatcher 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getdispatcher
     */
    GetDispatcher(ppDispatcher) {
        result := ComCall(3, this, "ptr*", ppDispatcher, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} ppLayer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getuilayer
     */
    GetUiLayer(ppLayer) {
        result := ComCall(4, this, "ptr*", ppLayer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} ppApplication 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getapplication
     */
    GetApplication(ppApplication) {
        result := ComCall(5, this, "ptr*", ppApplication, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Pointer<IInspectable>} ppInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getiinspectablefromhandle
     */
    GetIInspectableFromHandle(instanceHandle, ppInstance) {
        result := ComCall(6, this, "uint", instanceHandle, "ptr*", ppInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInspectable} pInstance 
     * @param {Pointer<Integer>} pHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-gethandlefromiinspectable
     */
    GetHandleFromIInspectable(pInstance, pHandle) {
        pHandleMarshal := pHandle is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pInstance, pHandleMarshal, pHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RECT} rect 
     * @param {Pointer<Integer>} pCount 
     * @param {Pointer<Pointer<Integer>>} ppInstanceHandles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-hittest
     */
    HitTest(rect, pCount, ppInstanceHandles) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", rect, pCountMarshal, pCount, "ptr*", ppInstanceHandles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInspectable} pInstance 
     * @param {Pointer<Integer>} pInstanceHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-registerinstance
     */
    RegisterInstance(pInstance, pInstanceHandle) {
        pInstanceHandleMarshal := pInstanceHandle is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pInstance, pInstanceHandleMarshal, pInstanceHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pInitializationData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getinitializationdata
     */
    GetInitializationData(pInitializationData) {
        result := ComCall(10, this, "ptr", pInitializationData, "HRESULT")
        return result
    }
}
