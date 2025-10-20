#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptDebugBreakpoint extends IUnknown{
    /**
     * The interface identifier for IDataModelScriptDebugBreakpoint
     * @type {Guid}
     */
    static IID => Guid("{6bb27b35-02e6-47cb-90a0-5371244032de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Integer} 
     */
    GetId() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsEnabled() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Enable() {
        ComCall(5, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Disable() {
        ComCall(6, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Remove() {
        ComCall(7, this)
        return result
    }

    /**
     * 
     * @param {Pointer<ScriptDebugPosition>} position 
     * @param {Pointer<ScriptDebugPosition>} positionSpanEnd 
     * @param {Pointer<BSTR>} lineText 
     * @returns {HRESULT} 
     */
    GetPosition(position, positionSpanEnd, lineText) {
        result := ComCall(8, this, "ptr", position, "ptr", positionSpanEnd, "ptr", lineText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
