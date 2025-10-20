#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables controls and containers to avoid performance bottlenecks on loading controls. It combines the load-time or initialization-time handshaking between the control and its container into a single call.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iquickactivate
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IQuickActivate extends IUnknown{
    /**
     * The interface identifier for IQuickActivate
     * @type {Guid}
     */
    static IID => Guid("{cf51ed10-62fe-11cf-bf86-00a0c9034836}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<QACONTAINER>} pQaContainer 
     * @param {Pointer<QACONTROL>} pQaControl 
     * @returns {HRESULT} 
     */
    QuickActivate(pQaContainer, pQaControl) {
        result := ComCall(3, this, "ptr", pQaContainer, "ptr", pQaControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pSizel 
     * @returns {HRESULT} 
     */
    SetContentExtent(pSizel) {
        result := ComCall(4, this, "ptr", pSizel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pSizel 
     * @returns {HRESULT} 
     */
    GetContentExtent(pSizel) {
        result := ComCall(5, this, "ptr", pSizel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
