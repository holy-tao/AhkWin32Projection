#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getdispatcher
     */
    GetDispatcher() {
        result := ComCall(3, this, "ptr*", &ppDispatcher := 0, "HRESULT")
        return IInspectable(ppDispatcher)
    }

    /**
     * 
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getuilayer
     */
    GetUiLayer() {
        result := ComCall(4, this, "ptr*", &ppLayer := 0, "HRESULT")
        return IInspectable(ppLayer)
    }

    /**
     * 
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getapplication
     */
    GetApplication() {
        result := ComCall(5, this, "ptr*", &ppApplication := 0, "HRESULT")
        return IInspectable(ppApplication)
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getiinspectablefromhandle
     */
    GetIInspectableFromHandle(instanceHandle) {
        result := ComCall(6, this, "uint", instanceHandle, "ptr*", &ppInstance := 0, "HRESULT")
        return IInspectable(ppInstance)
    }

    /**
     * 
     * @param {IInspectable} pInstance 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-gethandlefromiinspectable
     */
    GetHandleFromIInspectable(pInstance) {
        result := ComCall(7, this, "ptr", pInstance, "uint*", &pHandle := 0, "HRESULT")
        return pHandle
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
        ppInstanceHandlesMarshal := ppInstanceHandles is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", rect, pCountMarshal, pCount, ppInstanceHandlesMarshal, ppInstanceHandles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInspectable} pInstance 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-registerinstance
     */
    RegisterInstance(pInstance) {
        result := ComCall(9, this, "ptr", pInstance, "uint*", &pInstanceHandle := 0, "HRESULT")
        return pInstanceHandle
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getinitializationdata
     */
    GetInitializationData() {
        pInitializationData := BSTR()
        result := ComCall(10, this, "ptr", pInitializationData, "HRESULT")
        return pInitializationData
    }
}
