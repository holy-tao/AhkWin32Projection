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
     * 
     * @param {Pointer<IInspectable>} ppDispatcher 
     * @returns {HRESULT} 
     */
    GetDispatcher(ppDispatcher) {
        result := ComCall(3, this, "ptr", ppDispatcher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} ppLayer 
     * @returns {HRESULT} 
     */
    GetUiLayer(ppLayer) {
        result := ComCall(4, this, "ptr", ppLayer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} ppApplication 
     * @returns {HRESULT} 
     */
    GetApplication(ppApplication) {
        result := ComCall(5, this, "ptr", ppApplication, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} instanceHandle 
     * @param {Pointer<IInspectable>} ppInstance 
     * @returns {HRESULT} 
     */
    GetIInspectableFromHandle(instanceHandle, ppInstance) {
        result := ComCall(6, this, "uint", instanceHandle, "ptr", ppInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} pInstance 
     * @param {Pointer<UInt64>} pHandle 
     * @returns {HRESULT} 
     */
    GetHandleFromIInspectable(pInstance, pHandle) {
        result := ComCall(7, this, "ptr", pInstance, "uint*", pHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {RECT} rect 
     * @param {Pointer<UInt32>} pCount 
     * @param {Pointer<UInt64>} ppInstanceHandles 
     * @returns {HRESULT} 
     */
    HitTest(rect, pCount, ppInstanceHandles) {
        result := ComCall(8, this, "ptr", rect, "uint*", pCount, "uint*", ppInstanceHandles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} pInstance 
     * @param {Pointer<UInt64>} pInstanceHandle 
     * @returns {HRESULT} 
     */
    RegisterInstance(pInstance, pInstanceHandle) {
        result := ComCall(9, this, "ptr", pInstance, "uint*", pInstanceHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pInitializationData 
     * @returns {HRESULT} 
     */
    GetInitializationData(pInitializationData) {
        result := ComCall(10, this, "ptr", pInitializationData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
