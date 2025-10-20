#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the features for supporting keyboard mnemonics, ambient properties, and events in control objects.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iolecontrol
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleControl extends IUnknown{
    /**
     * The interface identifier for IOleControl
     * @type {Guid}
     */
    static IID => Guid("{b196b288-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<CONTROLINFO>} pCI 
     * @returns {HRESULT} 
     */
    GetControlInfo(pCI) {
        result := ComCall(3, this, "ptr", pCI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @returns {HRESULT} 
     */
    OnMnemonic(pMsg) {
        result := ComCall(4, this, "ptr", pMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dispID 
     * @returns {HRESULT} 
     */
    OnAmbientPropertyChange(dispID) {
        result := ComCall(5, this, "int", dispID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bFreeze 
     * @returns {HRESULT} 
     */
    FreezeEvents(bFreeze) {
        result := ComCall(6, this, "int", bFreeze, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
